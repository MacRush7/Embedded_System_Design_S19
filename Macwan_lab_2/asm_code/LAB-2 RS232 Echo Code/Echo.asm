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
*This code is based on the example 10-4 on page 292 (chap-10) of the reference 
*book that I have used to formulate this code. I fully credit and 
*acknowledge the same as the source of my understanding for this submission.
*
*****************************************************************************/

		/*** Introducing MAIN and ISR Parts ***/

		ORG 0000H
		LJMP MAIN
		
		ORG 0023H
		LJMP ISR
		
		/*** MAIN PART ***/

MAIN:
		ORG 0100H
			
		/*************Settings for AT89C51RC2 compatibility***************/
		
		MOV A, 8EH				//AO bit going low as per the requirement (see manual)
		ANL A, #11111110b
		MOV 8EH, A
		
		/************Changing PCON register******************************/
		
		MOV A, PCON				// Changing settings such that baud rate would be doubled
		SETB ACC.7
		MOV PCON, A
		
		MOV TMOD, #20H			// Setting Timer 1, mode 2 (auto-reload)
		MOV TH1, #0FFH			// Setting baud rate to 57600 (the highest that can be set)
		MOV SCON, #50H			// 8-bit, 1 stop bit, REN enabled serial communication
		MOV IE, #90H			// Enabling Serial Interrupt Service
		SETB TR1				// Starting the Timer 1
		
LOOP:	NOP
		AJMP LOOP
		
ISR:
		ORG 0040H
		JNB RI, HERE			// Check if a character has been received
		MOV SBUF, SBUF			// If a character is received, it is printed out to the 
								// terminal emulator
		CLR RI					// Clearing the receiver interrupt flag
HERE:	CLR TI					// Clearing the transmitter interrupt flag
		RETI
		
		END