/* --COPYRIGHT--,BSD_EX
 * Copyright (c) 2013, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 *******************************************************************************
 *
 *                       MSP432 CODE EXAMPLE DISCLAIMER
 *
 * MSP432 code examples are self-contained low-level programs that typically
 * demonstrate a single peripheral function or device feature in a highly
 * concise manner. For this the code may rely on the device's power-on default
 * register values and settings such as the clock configuration and care must
 * be taken when combining code from several examples to avoid potential side
 * effects. Also see http://www.ti.com/tool/mspdriverlib for an API functional
 * library & https://dev.ti.com/pinmux/ for a GUI approach to peripheral configuration.
 *
 * --/COPYRIGHT--*/
//******************************************************************************
//  MSP432P401 Demo - Timer0_A3, Toggle P1.0, CCR0 Cont Mode ISR, DCO SMCLK
//
//  Description: Toggle P1.0 using software and TA_0 ISR. Timer0_A is
//  configured for continuous mode, thus the timer overflows when TAR counts
//  to CCR0. In this example, CCR0 is loaded with 50000.
//  ACLK = n/a, MCLK = SMCLK = TACLK = default DCO = ~3MHz
//
//           MSP432P401x
//         ---------------
//     /|\|               |
//      | |               |
//      --|RST            |
//        |               |
//        |           P1.0|-->LED
//
//   William Goh
//   Texas Instruments Inc.
//   Oct 2016 (updated) | November 2013 (created)
//   Built with CCSv6.1, IAR, Keil, GCC
//******************************************************************************
//  This code has been modified by Rushi James Macwan.
//  All modifications with due respect for copyrights have been cited with the
//  term - "MODIFICATION-<number>". The MODIFICATIONS do not remove the original
//  work but only comment the codes as per necessity.
//
//  Credits and Courtesy to the original owner of this work (William Goh
//  and Texas Instruments Inc.).
//
//  The code is modified by Rushi James Macwan and has been used only for academic
//  purposes to serve as a lab submission work. The modified parts are added with
//  appropriate comments wherever necessary to keep the original owner's work intact.
//  All original work from the third-party has been completely acknowledged before
//  submitting this work as a lab assignment for the ESDS-19 class.
//
//  Thanks.
//******************************************************************************


#include "ti/devices/msp432p4xx/inc/msp.h"

//////////////////////////////////MODIFICATION-1
int TIMER_OVERFLOW_CNT; //global variable - timer overflow counter variable
//////////////////////////////////

int main(void) {
    WDT_A->CTL = WDT_A_CTL_PW |             // Stop WDT
            WDT_A_CTL_HOLD;

    // Configure GPIO

    P1->DIR |= BIT0;
    P1->OUT |= BIT0;

    //////////////////////////////////MODIFICATION-2
    // Configuring more pins for our use
    // Test pins
    P3->DIR |= BIT6;
    P3->OUT |= BIT6;
    P2->DIR = (BIT1 | BIT2);        //Additional features from the 19-C problem
    P2->OUT = BIT1;                 //Additional features from the 19-C problem
    //////////////////////////////////


    TIMER_A0->CCTL[0] = TIMER_A_CCTLN_CCIE; // TACCR0 interrupt enabled
    //////////////////////////////////MODIFICATION-3
    // Modified the timer register starting value for my own reference
    TIMER_A0->CCR[0] = 0;                   // TA 0 starts counting from 0
    //////////////////////////////////
    TIMER_A0->CTL = TIMER_A_CTL_SSEL__SMCLK | // SMCLK, continuous mode
            TIMER_A_CTL_MC__CONTINUOUS;

    SCB->SCR |= SCB_SCR_SLEEPONEXIT_Msk;    // Enable sleep on exit from ISR

    // Ensures SLEEPONEXIT takes effect immediately
    __DSB();

    // Enable global interrupt
    __enable_irq();

    NVIC->ISER[0] = 1 << ((TA0_0_IRQn) & 31);

    while (1)
    {
        __sleep();

        __no_operation();                   // For debugger

    }
}

// Timer A0 interrupt service routine

void TA0_0_IRQHandler(void)
{
    //////////////////////////////////MODIFICATION-4
    TIMER_OVERFLOW_CNT++;    //incrementing variable TIMER_OVERFLOW_CNT every time the interrupt occurs
    //////////////////////////////////

    /*
     * The variable j is incremented and used such that the interrupt handler
     * toggles the LED only after a certain value has been reached. In my
     * case, a value of 65535 is added to the 16-bit Timer A every time an interrupt
     * occurs. This 16-bit timer can count from 0 to 65535. The SMCLK clock is used
     * which uses a frequency of 3 MHz. This means that there will be 3 M cycles per
     * second for the SMCLK clock.
     *
     * Now, the clock period is (1/3M = 0.33u seconds) which implies that for every
     * 0.33u seconds (meaning one cycle), the timer will increment by one.
     * In turn, this means that the timer will reach the value 65535 from 0 in
     * (65535 * 0.3333 u = 21.845 m seconds). Therefore, the timer can count a total
     * time of 21.845 milli-seconds after which overflow occurs as 65535 when incremented
     * by one will result in a zero.
     *
     * Finally, since we need a toggling time period (on/off time period) of 200
     * milli-seconds, we will need break the timer revolutions in terms of whole
     * numbers. Therefore, we can consider the timer to count for up to 20 ms (lesser
     * than its maximum ability of 21.845 ms) and then let the timer overflow for
     * 10 times after which we toggle the LED. This way, we will have a total time
     * duration of 20ms * 10 (overflows) = 200 milli-seconds before which the LED
     * will be toggled.
     *
     * Now, for the timer to keep incrementing for a period of  20 ms, we will
     * need the timer to count upto (20 ms * 65535 / 21.845 ms = 60000) after
     * which we will increment the counter TIMER_OVERFLOW_CNT. As soon as the
     * counter value reaches 10, it means that a duration of 200ms will have
     * passed and we will therefore enter a loop to toggle the LED.
     *
     * Please Note:- The practical value slightly differs from 60000 because of
     * internal system aspects. Therefore, proper calibration will be required
     * and the value might even deviate by 1% (of 65535) from the original value.
     * In my case, the value exceeds approximately by 0.82% (of 65535) and therefore,
     * I will be using 60540 instead of 60000.
     *
     * Note:- This method of calculating the exact toggling time period of 200ms
     * takes into account the issue of energy consumption. Since, the interrupt
     * handler will be called only 10 times for every time an LED is toggled,
     * lesser power will be consumed. Lowering the number of ISR calls, lowers
     * the spikes in the energy consumption (every time the ISR is called) and
     * eventually accounts for a more efficient embedded system.
     *
     * Credits & Courtesy: I thank Kiran (TA) for helping me deal with the problem
     * in a very detailed fashion. I acknowledge his help and support for the same.
     */

    TIMER_A0->CCTL[0] &= ~TIMER_A_CCTLN_CCIFG;

    //////////////////////////////////MODIFICATION-5
    // Modified timer register increment value for my own reference
    TIMER_A0->CCR[0] += 60540;                      // Add Offset to TACCR0 for a duration of approx. 20 ms

    if(TIMER_OVERFLOW_CNT%10 == 0)                  // Letting the timer overflow for 10 times before the LED is toggled
    {
           P1->OUT ^= BIT0;                         // LED Toggling
           P3->OUT ^= BIT6;                         // toggling test point
           P2->OUT ^= BIT1;                         //Additional toggling features from the 19-C problem
           if(P2->OUT != BIT1)
               P2->OUT ^= BIT2;
    }
    //////////////////////////////////MODIFICATION-5 ends
}


