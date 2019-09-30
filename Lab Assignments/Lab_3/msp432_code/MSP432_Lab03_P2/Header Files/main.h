#include "ti/devices/msp432p4xx/inc/msp.h"

/**************************************************************
 * MACROS & #Define Statements
 * ************************************************************
 */

// Constants to store the ADC temperature reference calibration value

    // Read the ADC temperature reference calibration value from the datasheet

    /* Datasheet provided
     * ADC calibration data - Not functional with required accuracy
     * adcRefTempCal_1_2v_30 = TLV->ADC14_REF1P2V_TS30C;
     * adcRefTempCal_1_2v_85 = TLV->ADC14_REF1P2V_TS85C;
     *
     * These instructions have been replaced with an appropriately
     * tested value for temperature calibration
     *
     * The below values are tested and reliable calibration values
     */

#define adcRefTempCal_1_2v_30 17500     // ADC raw output for 1.2V reference value at 30 degree Celsius temperature
#define adcRefTempCal_1_2v_85 49500     // ADC raw output for 1.2V reference value at 85 degree Celsius temperature
#define start_duty 10               // Enter an initial value between 0-100 corresponding to duty cycles of 0-100%

/**************************************************************
 * Shared global variables across source files
 * ************************************************************
 */

// Temperature Sensor associated global variables
extern volatile long temp;                     // Raw temperature output in degree Celsius from the ADC
extern volatile float IntDegF;                 // Temperature converted in degree Fahrenheit
extern volatile float IntDegC;                 // Temperature converted in degree Celsius

// PWM associated global variables
extern int MODE;                        // variable that decides print mode to the terminal emulator
extern int duty_cycle;                  // Main variable that calculates duty cycle
extern int duty_out;                    // variable that is used to print duty cycle

/**************************************************************
 * FUNCTION PROTOTYPES
 * ************************************************************
 */

// Initialization function prototype
void init(void);            // Main initialization function

// Initialization function elements and their prototypes
void adc_set(void);         // Setting ADC for temperature sensing
void temp_refresh(void);    // ADC - temperature sensor refresh function
void ports_set(void);       // Setting port pins
void pwm_set(void);         // Setting clocks for PWM features
void uart_set(void);        // Setting UART for Serial Communication
void timer_set(void);       // Setting Timers for generating PWM

// Terminal Emulator Print Function Prototypes
void delay(void);           // Delay function for efficient serial communication
void print_duty(void);      // Print function to print duty cycle
void print_temp(void);      // Print function to print temperature reading
void print_tempC(void);     // Print function to print temperature in degree Celsius
void print_tempF(void);     // Print function to print temperature in degree Fahrenheit
void new_line(void);        // New-line Print Function
void car_return(void);      // Carriage return Print Function
void echo_char(void);       // Function to echo characters
void new_par(void);         // Function to begin new paragraph for printing

// IRQ Handler function prototypes
void IRQ_set(void);                 // Function to enable interrupts in NVIC module
void ADC14_IRQHandler(void);        // ADC14 IRQ Handler - Related to temperature sensor
void PORT1_IRQHandler(void);        // Port-1 IRQ Handler
void EUSCIA0_IRQHandler(void);      // Serial Communication IRQ Handler

