/* --COPYRIGHT--,BSD_EX
 * Copyright (c) 2014, Texas Instruments Incorporated
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
 *
 *  --/COPYRIGHT--*/
/******************************************************************************
 * This code has been created solely by Rushi James Macwan.
 *
 * Various resources available on the MSP-432 Open Source platform have been
 * used for creating this code. This code has been built essentially using
 * the MSP432 Simplelink SDK containing several examples. The same can be
 * accessed by visiting the below given link:
 *
 * Link: http://www.ti.com/general/docs/lit/getliterature.tsp?
 * baseLiteratureNumber=slac698&fileType=zip
 *
 * To summarize explicitly, all the resource examples used for creating this
 * entire project are as under which can be found by accessing the above link:
 *
 * msp432p401x_euscia0_uart_01
 * msp432p401x_adc14_10
 * msp432p401x_ta1_16
 *
 * This work has been created with due respect for the copyrights of TI and all
 * the authors and contributors at TI who have created the above example codes
 * which are available at the link provided in this document.
 *
 * The init.c file contains a significant portion of the codes that were written
 * by the authors in the above explicitly mentioned examples. The init.c file
 * shares a significant content with the referenced codes and I duly acknowledge
 * the original authors for their work.
 *
 * Credits and Courtesy to the free Open Source platform offered by Texas
 * Instruments and all the individual authors who have provided the example codes.
******************************************************************************/

/*******************   ---INTRODUCTION---    *******************************
 *
 * For running the code in the Echo mode, please enter 1 as the value of the
 * MODE variable. Similarly, for measuring the PWM, please enter 2 in to the MODE
 * variable. For measuring temperature and reading values both in degree
 * Celsius and Fahrenheit, please enter 3 in to the MODE variable.
 ***************************************************************************/

#include <Header Files/main.h>
#include "ti/devices/msp432p4xx/inc/msp.h"


/*****************************MODE********************************/

int MODE = 1;           //change MODE to ECHO=1 / PWM=2 / TEMP=3

/*****************************MODE********************************/


/**************************************************************
 * Shared global variables across source files
 * ************************************************************
 */

// Temperature Sensor associated global variables
volatile long temp;                     // Raw temperature output in degree Celsius from the ADC
volatile float IntDegF;                 // Temperature converted in degree Fahrenheit
volatile float IntDegC;                 // Temperature converted in degree Celsius

// PWM associated global variables
int duty_cycle  = start_duty*10;        // Main variable that calculates duty cycle
int duty_out    = start_duty/10;        // variable that is used to print duty cycle

/**************************************************************
 * Main Function
 * ************************************************************
 */

int main(void)
{
    //Initializing the board (e.g. timers, clocks, UART, etc.)
    init();

    // Enable interrupts in NVIC module
    IRQ_set();

    // Enable global interrupt
    __enable_irq();
    
    if(MODE != 3)
    {
        // Enable sleep on exit from ISR
        SCB->SCR |= SCB_SCR_SLEEPONEXIT_Msk;
    }

    if(MODE == 3)
    {
        // Wake up on exit from ISR
        SCB->SCR &= ~SCB_SCR_SLEEPONEXIT_Msk;
    }

    // Ensures SLEEPONEXIT occurs immediately
    __DSB();

    while (1)
    {
        ADC14->CTL0 |= ADC14_CTL0_SC;       // Sampling and conversion start

        // Enter LPM0
        __sleep();
        __no_operation();                   // For debugger

        temp_refresh();

        __no_operation();                   // For debugger
    }
}
