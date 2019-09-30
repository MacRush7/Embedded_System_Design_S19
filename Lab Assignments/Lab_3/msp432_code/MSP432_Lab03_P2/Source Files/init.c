#include "ti/devices/msp432p4xx/inc/msp.h"
#include "Header Files/main.h"

/**************************************************************
 * Function Definitions
 * ************************************************************
 */

// Main initialization Function
void init(void)
{
    WDT_A->CTL = WDT_A_CTL_PW |             // Stop watchdog timer
                WDT_A_CTL_HOLD;

    // Initializing other parameters
    adc_set();
    ports_set();
    pwm_set();
    uart_set();
    timer_set();
}

// ADC Initialization Function
void adc_set(void)
{
    // Initialize the shared reference module
    // By default, REFMSTR=1 => REFCTL is used to configure the internal reference
    while(REF_A->CTL0 & REF_A_CTL0_GENBUSY);// If ref generator busy, WAIT
    REF_A->CTL0 |= REF_A_CTL0_VSEL_0 |      // Enable internal 1.2V reference
            REF_A_CTL0_ON;                  // Turn reference on

    REF_A->CTL0 &= ~REF_A_CTL0_TCOFF;       // Enable temperature sensor

    // Configure ADC - Pulse sample mode; ADC14_CTL0_SC trigger
    ADC14->CTL0 |= ADC14_CTL0_SHT0_6 |      // ADC ON,temperature sample period>5us
            ADC14_CTL0_ON |
            ADC14_CTL0_SHP;
    ADC14->CTL1 |= ADC14_CTL1_TCMAP;        // Enable internal temperature sensor
    ADC14->MCTL[0] = ADC14_MCTLN_VRSEL_1 |  // ADC input ch A22 => temp sense
            ADC14_MCTLN_INCH_22;
    ADC14->IER0 = 0x0001;                   // ADC_IFG upon conv result-ADCMEM0

    // Wait for reference generator to settle
    while(!(REF_A->CTL0 & REF_A_CTL0_GENRDY));

    ADC14->CTL0 |= ADC14_CTL0_ENC;
}

// Ports Initialization Function
void ports_set(void)
{
    // Configure GPIO
    P2->DIR |= BIT5;                 // providing the duty cycle on P2.5
    P2->SEL0 |= BIT5;
    P2->SEL1 &= ~(BIT5);

    /* Setting Port-1 pins
     * Configuring UART pins as well buttons P1.1 and P1.4
     */
    P1->DIR = ~(uint8_t) (BIT4 | BIT1);
    P1->OUT = (BIT4 | BIT1);
    P1->REN = (BIT4 | BIT1);                 // Enable pull-up resistor (P1.1 output high)
    // Configure UART pins
    P1->SEL0 |= BIT2 | BIT3;                // set 2-UART pin as secondary function
    P1->SEL1 = 0;
    P1->IES = (BIT1 | BIT4);                // Interrupt on high-to-low transition
    P1->IFG = 0;                            // Clear all P1 interrupt flags
    P1->IE = (BIT1 | BIT4);                 // Enable interrupt for P1.1 and P1.4

    // Setting all other ports to a default value
    P3->DIR |= 0xFF; P3->OUT = 0;
    P4->DIR |= 0xFF; P4->OUT = 0;
    P5->DIR |= 0xFF; P5->OUT = 0;
    P6->DIR |= 0xFF; P6->OUT = 0;
    P7->DIR |= 0xFF; P7->OUT = 0;
    P8->DIR |= 0xFF; P8->OUT = 0;
    P9->DIR |= 0xFF; P9->OUT = 0;
    P10->DIR |= 0xFF; P10->OUT = 0;

    // Port-J assignment
    PJ->DIR |= (BIT0| BIT1 | BIT2 | BIT3);
    PJ->OUT &= ~(BIT0 | BIT1 | BIT2 | BIT3);
}

// PWM (Clock Sources) Initialization Function
void pwm_set(void)
{
    CS->KEY = CS_KEY_VAL;                   // Unlock CS module for register access
    CS->CTL0 = 0;                           // Reset tuning parameters
    CS->CTL0 = CS_CTL0_DCORSEL_3;           // Set DCO to 12MHz (nominal, center of 8-16MHz range)
    CS->CTL1 = CS_CTL1_SELA_2 |             // Select ACLK = REFO
            CS_CTL1_SELS_3 |                // SMCLK = DCO
            CS_CTL1_SELM_3;                 // MCLK = DCO
    CS->KEY = 0;                            // Lock CS module from unintended accesses

}

// Timers (PWM) Initialization Function
void timer_set(void)
{
    TIMER_A0->CCR[0] = 1000 - 1;                // PWM Period
    TIMER_A0->CCTL[2] = TIMER_A_CCTLN_OUTMOD_7; // CCR2 reset/set
    TIMER_A0->CCR[2] = duty_cycle;              // CCR2 PWM duty cycle - available on P2.5
    TIMER_A0->CTL = TIMER_A_CTL_SSEL__SMCLK |   // SMCLK
    TIMER_A_CTL_MC__UP |                        // Up mode
    TIMER_A_CTL_CLR;                            // Clear TAR
}

// UART Initialization Function
void uart_set(void)
{
        // Configure UART
        EUSCI_A0->CTLW0 |= EUSCI_A_CTLW0_SWRST; // Put eUSCI in reset
        EUSCI_A0->CTLW0 = EUSCI_A_CTLW0_SWRST | // Remain eUSCI in reset
        EUSCI_B_CTLW0_SSEL__SMCLK;      // Configure eUSCI clock source for SMCLK

        // Baud Rate calculation
        // 12000000/(16*9600) = 78.125
        // Fractional portion = 0.125
        // User's Guide Table 21-4: UCBRSx = 0x10
        // UCBRFx = int ( (78.125-78)*16) = 2

        EUSCI_A0->BRW = 78;

        /* 12000000/16/9600 = 78 (approx.)
         * supports efficient Baud rates between 250,000 (value 3) to 9600 (value 78)
         */

        EUSCI_A0->MCTLW = (2 << EUSCI_A_MCTLW_BRF_OFS) |
                EUSCI_A_MCTLW_OS16;

        EUSCI_A0->CTLW0 &= ~EUSCI_A_CTLW0_SWRST; // Initialize eUSCI
        EUSCI_A0->IFG &= ~EUSCI_A_IFG_RXIFG;    // Clear eUSCI RX interrupt flag
        EUSCI_A0->IE |= EUSCI_A_IE_RXIE;        // Enable USCI_A0 RX interrupt
}
