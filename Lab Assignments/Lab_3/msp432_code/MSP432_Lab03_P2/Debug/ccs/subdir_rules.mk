################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
ccs/%.obj: ../ccs/%.c $(GEN_OPTS) | $(GEN_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-arm_18.1.5.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/Users/rualjim/workspace_v8/MSP432_Lab03_P2" --include_path="C:/ti/simplelink_msp432p4_sdk_2_40_00_10/source" --include_path="C:/ti/simplelink_msp432p4_sdk_2_40_00_10/source/third_party/CMSIS/Include" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-arm_18.1.5.LTS/include" --advice:power=none --define=__MSP432P401R__ --define=DeviceFamily_MSP432P401x -g --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --preproc_with_compile --preproc_dependency="ccs/$(basename $(<F)).d_raw" --obj_directory="ccs" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

