#include "ti/devices/msp432p4xx/inc/msp.h"
#include "Header Files/main.h"

/**************************************************************
 * Function Definitions for various print operations
 * ************************************************************
 */

void delay(void)
{
    int wait_var;
    for (wait_var=0 ; wait_var <= 750; wait_var++)
    {
        //Do Nothing
    }
}

void print_temp(void)
{
    if(EUSCI_A0->RXBUF == 'T')
    {
        print_tempC();
        delay();
        print_tempF();
        new_par();
    }
}

void print_tempC(void)
{
    char text[14] = "Temperature: "; // Text to notify Temperature output
    char temp_print[4] = "XXC";           // Text to provide Temperature
    int temp_out, text_out;

    // Arranging output into a proper line

    new_line();
    delay();
    car_return();

    // Output of the main text
    for(text_out=0; text_out<=12; text_out++)
    {
        // Main printing part

        delay();
        EUSCI_A0->TXBUF = text[text_out];
        delay();

        // Main printing part ends
    }

    // Setting array for printing temperature

    if(IntDegC >= 0 && IntDegC <= 9)
    {
        temp_print[0] = '0';
        temp_print[1] = (int) IntDegC + '0';
    }
    if(IntDegC >= 10 && IntDegC <= 99)
    {
        temp_print[0] = ((int)(IntDegC/10.0f)) + '0';
        temp_print[1] = (int) (IntDegC - ((float) ((int)(IntDegC/10.0f)) * 10.0f)) + '0';
    }

    // Output of the temperature reading
    for(temp_out=0; temp_out<=2; temp_out++)
    {
        // Main printing part

        delay();
        EUSCI_A0->TXBUF = temp_print[temp_out];
        delay();

        // Main printing part ends
    }
}

void print_tempF(void)
{
    char text[14] = "Temperature: "; // Text to notify Temperature output
    char temp_print[4] = "XXF";           // Text to provide Temperature
    int temp_out, text_out;

    // Arranging output into a proper line

    new_line();
    delay();
    car_return();

    // Output of the main text
    for(text_out=0; text_out<=12; text_out++)
    {
        // Main printing part

        delay();
        EUSCI_A0->TXBUF = text[text_out];
        delay();

        // Main printing part ends
    }

    // Setting array for printing temperature

    if(IntDegF >= 0 && IntDegF <= 9)
    {
        temp_print[0] = '0';
        temp_print[1] = (int) IntDegF + '0';
    }
    if(IntDegF >= 10 && IntDegF <= 99)
    {
        temp_print[0] = ((int)(IntDegF/10.0f)) + '0';
        temp_print[1] = (int) (IntDegF - ((float) ((int)(IntDegF/10.0f)) * 10.0f)) + '0';
    }

    // Output of the temperature reading
    for(temp_out=0; temp_out<=2; temp_out++)
    {
        // Main printing part

        delay();
        EUSCI_A0->TXBUF = temp_print[temp_out];
        delay();

        // Main printing part ends
    }
}

void print_duty(void)
{
    if(EUSCI_A0->RXBUF == 'P')
    {
        new_par();

        char text[13] = "Duty Cycle: "; // Text to notify Duty Cycle output
        char pwm[5] = "X0X%";           // Text to provide Duty Cycle
        int pwm_out, text_out;

        // Arranging output into a proper line

        new_line();
        delay();
        delay();
        car_return();

        // Output of the main text
        for(text_out=0; text_out<=12; text_out++)
        {
            // Main printing part

            delay();
            EUSCI_A0->TXBUF = text[text_out];
            delay();

            // Main printing part ends
        }

        // Setting array for the duty cycle based on the current pwm value

        if(duty_out == 10)
        {
            pwm[0] = '1';
            pwm[2] = '0';
        }
        else
        {
            pwm[0] = duty_out + '0';
            pwm[2] = ' ';
        }

        // Output of the duty cycle value in terms of percentage
        for(pwm_out=0; pwm_out<=3; pwm_out++)
        {
            // Main printing part

            delay();
            EUSCI_A0->TXBUF = pwm[pwm_out];
            delay();

            // Main printing part ends
        }

    }
}

void echo_char(void)
{
    EUSCI_A0->TXBUF = EUSCI_A0->RXBUF;  // Echoing received information
}

void new_line(void)
{
    EUSCI_A0->TXBUF = 10;               // New-line function
}

void car_return(void)
{
    EUSCI_A0->TXBUF = 13;               // Carriage return function
}

void new_par(void)
{
    delay();
    new_line();
    delay();
    car_return();
}
