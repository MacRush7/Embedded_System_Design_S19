#include "ti/devices/msp432p4xx/inc/msp.h"
#include "Header Files/main.h"
#include <stdint.h>

/**************************************************************
 * Function Definitions for temperature sensing
 * ************************************************************
 */

void temp_refresh(void)
{

    //Storing the temperature value obtained in degree Celsius in a variable
        IntDegC = (float)(((float)temp - (float)(adcRefTempCal_1_2v_30)) * (85.0f - 30.0f) / ((float)(adcRefTempCal_1_2v_85) - (float)(adcRefTempCal_1_2v_30))) + 30.0f;

    //Storing the temperature value obtained in degree Fahrenheit in a variable
        IntDegF = (float)((9.0f * IntDegC) / 5.0f) + 32.0f;

}
