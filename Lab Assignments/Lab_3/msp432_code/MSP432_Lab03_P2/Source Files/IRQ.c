#include "ti/devices/msp432p4xx/inc/msp.h"
#include "Header Files/main.h"

/**************************************************************
 * Function Definitions
 * ************************************************************
 */

// Main IRQ initialization Function
void IRQ_set(void)
{
    // Enable interrupts in NVIC module
    NVIC->ISER[0] = 1 << ((ADC14_IRQn) & 31);   // Enable ADC interrupt in NVIC module
    NVIC->ISER[0] = 1 << ((EUSCIA0_IRQn) & 31); // Enable UART interrupt in NVIC module
    NVIC->ISER[1] = 1 << ((PORT1_IRQn) & 31);   // Enable Port1 interrupt in NVIC module
}

// UART interrupt service routine
void EUSCIA0_IRQHandler(void)
{

    if (EUSCI_A0->IFG & EUSCI_A_IFG_RXIFG)
    {
        // Check if the TX buffer is empty first
       while(!(EUSCI_A0->IFG & EUSCI_A_IFG_TXIFG));
       {

           if(MODE == 1)
           {

               // Echo the received character back
               echo_char();

           }

           if(MODE == 2)
           {

               // Print the PWM Duty Cycle
               print_duty();

           }

           if(MODE == 3)
           {

               // Print the Temperature
               print_temp();

           }

       }

    }
}

// Por1 Interrupt Service Routine
void PORT1_IRQHandler(void)
{
    volatile uint32_t i;

    // If the button P1.4 is pressed - duty cycle increases by 10%
    if(P1->IFG & BIT4)
    {
        if(duty_cycle == 1000)  // Fixing duty cycle output range
        {
            duty_cycle = -100;
        }
        duty_cycle += 100;

        TIMER_A0->CCR[2] = duty_cycle;  // Sending out duty cycle to assigned timer pin
    }

    // If the button P1.1 is pressed - duty cycle decreases by 10%
    if(P1->IFG & BIT1)
    {
        if(duty_cycle == 0)     // Fixing duty cycle output range
        {
            duty_cycle = 1100;
        }
        duty_cycle -= 100;
        TIMER_A0->CCR[2] = duty_cycle;  // Sending out duty cycle to assigned timer pin
    }

    duty_out = (duty_cycle/100);    // updating duty cycle output variable

    // Delay for switch debounce
    for(i = 0; i < 10000; i++)
    P1->IFG &= ~BIT4;
    P1->IFG &= ~BIT1;
}

// ADC14 interrupt service routine
void ADC14_IRQHandler(void)
{
    if (ADC14->IFGR0 & ADC14_IFGR0_IFG0)
    {
        temp = ADC14->MEM[0];
    }
}
