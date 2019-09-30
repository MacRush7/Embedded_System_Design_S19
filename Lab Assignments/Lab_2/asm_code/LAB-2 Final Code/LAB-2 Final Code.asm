/******************************************************************************
*	ESD Lab-2 Part-1 Assembly Language Programming
*	Device - 8051
*	Code developed using 8051 Interrupt features
*	Credits: The 8051 Microcontroller and Embedded Systems (2nd Ed.) Book by Mazidi
/******************************************************************************
*	Student Name	: Rushi James Macwan
*	Course			: Embedded System Design (Spring-19)
/******************************************************************************
*
*This code has been written and produced by Rushi James Macwan with the help of
*Keil Software and Intel 8051 instruction set keeping in mind the CU Honor Code.
*Credits and courtesy to all the third-party software platforms.
*
*Credits and courtesy to the Teaching Assistants for suggesting me some 
*improvements to my code during the lab sign-off and actually helping me to 
*make it even better. I sincerely thank them for his valuable support and 
*guidance.
*
/******************************************************************************
*Copyright (C) 2019 by Rushi James Macwan
*
*Redistribution, modification or use of this software in source or binary
*forms is permitted as long as the files maintain this copyright. Users are
*permitted to modify this and use it to learn about the field of embedded
*software. Rushi James Macwan is not liable for any misuse of this material
*any misuse of this material.
*
*****************************************************************************/
/******************************************************************************
*Introduction to the code structure:
*
*The Timer 0 in this code counts from 0 to all the way up to FFFFH which takes
*1/7th of the 0.5 second period that is required for toggling the LED. This is
*because the counter counts everey 1.0815 micro seconds. Therefore, it counts 
*all the way upto FFFFH from 0 in (1.0815 us * 65536 = 70.877 ms) and therefore
*it will take approximately 70.877 ms for the timer to overflow once. Again, to
*obtain a time duration of 0.5 seconds, the timer must overflow approximately
*(0.5/70.877 ms = 7.05) which can be rounded off to 7 overflows. So, the code
*will let the Timer 0 overflow for 7 times before the LED is toggled.
*
*****************************************************************************/
		
			/*************************CODE BEGINS******************************/
			/******************************************************************/
			/******************************************************************/					
			
			/********MAIN PART DEFINITION*******/
			
			ORG 0000H				// Main part begins at 0000H location in the memory
				
			LJMP MAIN				// Long jump performed to the main function
			
			/********ISR PART DEFINITION*******/
	
			ORG 000BH				// Timer0 ISR part begins at 000BH location in the memory
									// Datasheet specified memory location for Timer 0 interrupt vector address
			
			LJMP ISR_TIMER0			// Long jump performed to the Timer0 ISR function
			
			
			/*************************MAIN PART BEGINS*************************/
			/******************************************************************/
			/******************************************************************/

MAIN:		
			ORG 0100H				// Reading the code from a memory location that is safe and
									// does not intercept with interrupt vector addresses
				
			/*************Settings for AT89C51RC2 compatibility***************/
			
			MOV A, 8EH				//AO bit going low as per the requirement (see manual)
			ANL A, #11111110b
			MOV 8EH, A
			
			MOV A, #00H				// Initializing the Accumulator to serve as an
									// overflow counter for the LED timing
			
			MOV TMOD, #01H			// Timer 0 Mode 1 selected for 8051
			MOV TL0, #00H			// Setting lower byte to 00H for 8051
			MOV TH0, #00H			// Setting upper byte to 00H for 8051
			MOV IE, #82H			// Enabling the Timer 0 interrupt
			SETB TR0				// Setting the TR0 bit so that Timer 0 starts counting
			
			/* Execution enters the infinite loop after this point */
			
LOOP:		NOP						// No operation while in the infinite loop
			SJMP LOOP				// Keeping the execution inside the infinite loop

			/*************************MAIN PART ENDS***************************/
			/******************************************************************/
			/******************************************************************/
			
			/*************************ISR PART BEGINS**************************/
			/******************************************************************/
			/******************************************************************/
			
			/* ISR Part of 8051 which implements the Timer 0 interrupt routines */
			
ISR_Timer0:	
			ORG 0040H				// Beginning the code at a memory location that does not intercept
									// with interrupt vector addresses or the main part
			CPL P1.7				// Toggling an extra pin as the first instruction in the ISR
			CLR TF0					// Clearing the interrupt if the Timer 0 has not overflowed for 7 times
									// after which the execution returns to the MAIN PART
			INC A					// Incrementing the Timer 0 ISR counts 
			CJNE A, #07H, REPEAT	// If Timer 0 has not overflowed for 7 times, the ISR jumps to REPEAT loop
			MOV A, #00H				// If Timer 0 has successfully overflowed for 7 times, it toggles the LED
			CPL P1.5				// LED PIN - toggled
REPEAT:		CPL P1.7				// Re-toggling the extra pin before the ISR is exited
			RETI					// Returning the ISR
			
			/*************************ISR PART ENDS****************************/
			/******************************************************************/
			/******************************************************************/
			
			END
			
			/******************************************************************/
			/******************************************************************/
			/*************************CODE ENDS********************************/