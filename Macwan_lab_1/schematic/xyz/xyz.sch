EESchema Schematic File Version 4
LIBS:xyz-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Regulator_Linear:L7805 V_Regulator
U 1 1 5C7C0FB4
P 3350 1550
F 0 "V_Regulator" H 3350 1792 50  0000 C CNN
F 1 "7805ACT" H 3350 1701 50  0000 C CNN
F 2 "" H 3375 1400 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 3350 1500 50  0001 C CNN
	1    3350 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D6
U 1 1 5C7C1190
P 5200 2100
F 0 "D6" V 5238 1982 50  0000 R CNN
F 1 "RED_LED" V 5147 1982 50  0000 R CNN
F 2 "" H 5200 2100 50  0001 C CNN
F 3 "~" H 5200 2100 50  0001 C CNN
	1    5200 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5C7C1246
P 5200 1800
F 0 "R1" H 5270 1846 50  0000 L CNN
F 1 "390" H 5270 1755 50  0000 L CNN
F 2 "" V 5130 1800 50  0001 C CNN
F 3 "~" H 5200 1800 50  0001 C CNN
	1    5200 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial_Power J?
U 1 1 5C7C1B59
P 800 1200
F 0 "J?" H 888 1196 50  0001 L CNN
F 1 "J1" H 720 1150 50  0000 R CNN
F 2 "" H 800 1150 50  0001 C CNN
F 3 "~" H 800 1150 50  0001 C CNN
	1    800  1200
	1    0    0    1   
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 5C7C1C00
P 1250 800
F 0 "SW1" H 1250 1035 50  0000 C CNN
F 1 "SPST" H 1250 944 50  0000 C CNN
F 2 "" H 1250 800 50  0001 C CNN
F 3 "" H 1250 800 50  0001 C CNN
	1    1250 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  1000 800  800 
Wire Wire Line
	800  800  1050 800 
$Comp
L pspice:DIODE IN4003
U 1 1 5C7C1E2D
P 1800 1350
F 0 "IN4003" H 1800 1615 50  0000 C CNN
F 1 "D1" H 1800 1524 50  0000 C CNN
F 2 "" H 1800 1350 50  0001 C CNN
F 3 "~" H 1800 1350 50  0001 C CNN
	1    1800 1350
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE IN4003
U 1 1 5C7C1E7B
P 2350 1350
F 0 "IN4003" H 2350 1615 50  0000 C CNN
F 1 "D2" H 2350 1524 50  0000 C CNN
F 2 "" H 2350 1350 50  0001 C CNN
F 3 "~" H 2350 1350 50  0001 C CNN
	1    2350 1350
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE IN4003
U 1 1 5C7C1EC1
P 1800 1750
F 0 "IN4003" H 1800 2015 50  0000 C CNN
F 1 "D3" H 1800 1924 50  0000 C CNN
F 2 "" H 1800 1750 50  0001 C CNN
F 3 "~" H 1800 1750 50  0001 C CNN
	1    1800 1750
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE IN4003
U 1 1 5C7C1F03
P 2350 1750
F 0 "IN4003" H 2350 2015 50  0000 C CNN
F 1 "D4" H 2350 1924 50  0000 C CNN
F 2 "" H 2350 1750 50  0001 C CNN
F 3 "~" H 2350 1750 50  0001 C CNN
	1    2350 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1350 2100 1350
Wire Wire Line
	1450 800  2100 800 
Wire Wire Line
	2100 800  2100 1350
Connection ~ 2100 1350
Wire Wire Line
	2100 1350 2150 1350
Wire Wire Line
	2000 1750 2100 1750
Wire Wire Line
	2100 1750 2100 1900
Wire Wire Line
	2100 1900 800  1900
Wire Wire Line
	800  1900 800  1300
Connection ~ 2100 1750
Wire Wire Line
	2100 1750 2150 1750
$Comp
L power:GND GND
U 1 1 5C7C2207
P 1350 1550
F 0 "GND" H 1438 1513 50  0001 L CNN
F 1 "GND" H 1438 1513 50  0001 L CNN
F 2 "" H 1350 1550 50  0001 C CNN
F 3 "" H 1350 1550 50  0001 C CNN
	1    1350 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1350 1600 1550
Wire Wire Line
	1600 1550 1350 1550
Wire Wire Line
	1600 1750 1600 1550
Connection ~ 1600 1550
Wire Wire Line
	2550 1350 2550 1550
Wire Wire Line
	2550 1550 2850 1550
Connection ~ 2550 1550
Wire Wire Line
	2550 1550 2550 1750
$Comp
L pspice:DIODE IN4003
U 1 1 5C7C29C5
P 3300 1000
F 0 "IN4003" H 3300 1265 50  0000 C CNN
F 1 "D5" H 3300 1174 50  0000 C CNN
F 2 "" H 3300 1000 50  0001 C CNN
F 3 "~" H 3300 1000 50  0001 C CNN
	1    3300 1000
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C7C2C3D
P 3350 2050
F 0 "#PWR?" H 3350 1800 50  0001 C CNN
F 1 "GND" H 3355 1877 50  0001 C CNN
F 2 "" H 3350 2050 50  0001 C CNN
F 3 "" H 3350 2050 50  0001 C CNN
	1    3350 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5C7C2DB2
P 2850 1650
F 0 "C1" H 2942 1696 50  0000 L CNN
F 1 "0.1uF" H 2942 1605 50  0000 L CNN
F 2 "" H 2850 1650 50  0001 C CNN
F 3 "~" H 2850 1650 50  0001 C CNN
	1    2850 1650
	1    0    0    -1  
$EndComp
Connection ~ 2850 1550
Wire Wire Line
	2850 1550 3050 1550
$Comp
L Device:C_Small C2
U 1 1 5C7C3081
P 3900 1650
F 0 "C2" H 3992 1696 50  0000 L CNN
F 1 "10uF" H 3992 1605 50  0000 L CNN
F 2 "" H 3900 1650 50  0001 C CNN
F 3 "~" H 3900 1650 50  0001 C CNN
	1    3900 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1550 3900 1550
Wire Wire Line
	3350 1850 3350 1900
Wire Wire Line
	2850 1750 2850 1900
Wire Wire Line
	2850 1900 3350 1900
Connection ~ 3350 1900
Wire Wire Line
	3350 1900 3350 2050
Wire Wire Line
	3900 1750 3900 1900
Wire Wire Line
	3900 1900 3350 1900
Wire Wire Line
	3100 1000 2850 1000
Wire Wire Line
	2850 1000 2850 1550
Wire Wire Line
	3500 1000 3900 1000
Wire Wire Line
	3900 1000 3900 1550
Connection ~ 3900 1550
Text Notes 7000 6800 0    118  ~ 24
Author - Rushi James Macwan
Text Notes 7400 7500 0    79   ~ 0
8051 Basic Circuit (Lab-1)\n
Text Notes 8200 7650 0    59   ~ 0
3rd March 2019
Text Notes 10650 7650 0    59   ~ 0
001
Text Notes 7000 7100 0    79   ~ 0
ECEN 5613 - Embedded System Design \nLab-1 Circuit Schematics
$Comp
L Device:Crystal Y1
U 1 1 5C7C5D3D
P 1750 4800
F 0 "Y1" V 1704 4931 50  0000 L CNN
F 1 "11.0592 MHz" V 1795 4931 50  0000 L CNN
F 2 "" H 1750 4800 50  0001 C CNN
F 3 "~" H 1750 4800 50  0001 C CNN
	1    1750 4800
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5C7C6639
P 1250 4950
F 0 "C6" V 1021 4950 50  0000 C CNN
F 1 "27pF" V 1112 4950 50  0000 C CNN
F 2 "" H 1250 4950 50  0001 C CNN
F 3 "~" H 1250 4950 50  0001 C CNN
	1    1250 4950
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5C7C66E3
P 1250 4450
F 0 "C5" V 1021 4450 50  0000 C CNN
F 1 "27pF" V 1112 4450 50  0000 C CNN
F 2 "" H 1250 4450 50  0001 C CNN
F 3 "~" H 1250 4450 50  0001 C CNN
	1    1250 4450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C7C6A4F
P 900 4800
F 0 "#PWR?" H 900 4550 50  0001 C CNN
F 1 "GND" H 905 4627 50  0001 C CNN
F 2 "" H 900 4800 50  0001 C CNN
F 3 "" H 900 4800 50  0001 C CNN
	1    900  4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4950 1350 4950
Wire Wire Line
	1750 4450 1350 4450
Wire Wire Line
	900  4650 900  4800
$Comp
L Switch:SW_Push SW2
U 1 1 5C7C89B7
P 750 3100
F 0 "SW2" V 750 3052 50  0000 R CNN
F 1 "SW_Push" V 795 3052 50  0001 R CNN
F 2 "" H 750 3300 50  0001 C CNN
F 3 "" H 750 3300 50  0001 C CNN
	1    750  3100
	0    -1   1    0   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5C7C91EE
P 1050 2700
F 0 "#PWR?" H 1050 2550 50  0001 C CNN
F 1 "VCC" H 1067 2873 50  0001 C CNN
F 2 "" H 1050 2700 50  0001 C CNN
F 3 "" H 1050 2700 50  0001 C CNN
	1    1050 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5C7C9FB4
P 1300 3100
F 0 "C3" H 1208 3054 50  0000 R CNN
F 1 "10uF" H 1208 3145 50  0000 R CNN
F 2 "" H 1300 3100 50  0001 C CNN
F 3 "~" H 1300 3100 50  0001 C CNN
	1    1300 3100
	-1   0    0    1   
$EndComp
$Comp
L pspice:DIODE IN4148
U 1 1 5C7CAFF9
P 750 3800
F 0 "IN4148" V 796 3928 50  0000 L CNN
F 1 "D7" V 705 3928 50  0000 L CNN
F 2 "" H 750 3800 50  0001 C CNN
F 3 "~" H 750 3800 50  0001 C CNN
	1    750  3800
	0    1    -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5C7CC0CD
P 1300 3800
F 0 "R3" H 1370 3846 50  0000 L CNN
F 1 "10K" H 1370 3755 50  0000 L CNN
F 2 "" V 1230 3800 50  0001 C CNN
F 3 "~" H 1300 3800 50  0001 C CNN
	1    1300 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 2700 1050 2900
Wire Wire Line
	1050 2900 750  2900
Wire Wire Line
	1300 3000 1300 2900
Wire Wire Line
	1300 2900 1050 2900
Connection ~ 1050 2900
Wire Wire Line
	750  3300 750  3450
Wire Wire Line
	750  4000 1000 4000
Wire Wire Line
	1300 4000 1300 3950
$Comp
L power:GND #PWR?
U 1 1 5C7CE6EC
P 1000 4100
F 0 "#PWR?" H 1000 3850 50  0001 C CNN
F 1 "GND" H 1005 3927 50  0001 C CNN
F 2 "" H 1000 4100 50  0001 C CNN
F 3 "" H 1000 4100 50  0001 C CNN
	1    1000 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 4000 1000 4100
Connection ~ 1000 4000
Wire Wire Line
	1000 4000 1300 4000
Wire Wire Line
	750  3450 1300 3450
Wire Wire Line
	1300 3200 1300 3450
Connection ~ 750  3450
Wire Wire Line
	750  3450 750  3600
Connection ~ 1300 3450
Wire Wire Line
	1300 3450 1300 3550
Connection ~ 1300 3550
Wire Wire Line
	1300 3550 1300 3650
Text Notes 650  1350 0    39   ~ 0
GND
Text Notes 650  1000 0    39   ~ 0
PWR
Text Notes 3600 1700 0    79   ~ 0
5V
Text Notes 2850 1500 0    79   ~ 0
7.8V
Text Notes 1350 3500 0    59   ~ 0
RST
Wire Wire Line
	1750 4450 1750 4600
Wire Wire Line
	900  4650 1150 4650
Wire Wire Line
	1150 4450 1150 4650
Connection ~ 1150 4650
Wire Wire Line
	1150 4650 1150 4950
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 5C7D86F0
P 4550 1350
F 0 "J6" V 4516 1430 50  0000 L CNN
F 1 "HEADER2_0" V 4425 1430 50  0000 L CNN
F 2 "" H 4550 1350 50  0001 C CNN
F 3 "~" H 4550 1350 50  0001 C CNN
	1    4550 1350
	0    1    -1   0   
$EndComp
Wire Wire Line
	3900 1550 4450 1550
$Comp
L power:VCC #PWR?
U 1 1 5C7DB66C
P 5200 1100
F 0 "#PWR?" H 5200 950 50  0001 C CNN
F 1 "VCC" H 5217 1273 50  0001 C CNN
F 2 "" H 5200 1100 50  0001 C CNN
F 3 "" H 5200 1100 50  0001 C CNN
	1    5200 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1550 5200 1550
Connection ~ 5200 1550
Wire Wire Line
	5200 1550 5200 1650
$Comp
L power:GND #PWR?
U 1 1 5C7E3196
P 5200 2450
F 0 "#PWR?" H 5200 2200 50  0001 C CNN
F 1 "GND" H 5205 2277 50  0000 C CNN
F 2 "" H 5200 2450 50  0001 C CNN
F 3 "" H 5200 2450 50  0001 C CNN
	1    5200 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J10
U 1 1 5C7E6A7E
P 6750 1300
F 0 "J10" H 6829 1292 50  0000 L CNN
F 1 "PwrHdr3" H 6829 1201 50  0000 L CNN
F 2 "" H 6750 1300 50  0001 C CNN
F 3 "~" H 6750 1300 50  0001 C CNN
	1    6750 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5C7E7809
P 6750 1800
F 0 "J3" H 6829 1792 50  0000 L CNN
F 1 "PwrHdr2" H 6829 1701 50  0000 L CNN
F 2 "" H 6750 1800 50  0001 C CNN
F 3 "~" H 6750 1800 50  0001 C CNN
	1    6750 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5C7E78F2
P 6750 2250
F 0 "J2" H 6829 2242 50  0000 L CNN
F 1 "PwrHdr1" H 6829 2151 50  0000 L CNN
F 2 "" H 6750 2250 50  0001 C CNN
F 3 "~" H 6750 2250 50  0001 C CNN
	1    6750 2250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J11
U 1 1 5C7E863B
P 7700 1300
F 0 "J11" H 7779 1292 50  0000 L CNN
F 1 "PwrHdr4" H 7779 1201 50  0000 L CNN
F 2 "" H 7700 1300 50  0001 C CNN
F 3 "~" H 7700 1300 50  0001 C CNN
	1    7700 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J12
U 1 1 5C7E9345
P 7700 1750
F 0 "J12" H 7779 1742 50  0000 L CNN
F 1 "PwrHdr5" H 7779 1651 50  0000 L CNN
F 2 "" H 7700 1750 50  0001 C CNN
F 3 "~" H 7700 1750 50  0001 C CNN
	1    7700 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J13
U 1 1 5C7EAD9E
P 7700 2250
F 0 "J13" H 7779 2242 50  0000 L CNN
F 1 "PwrHdr6" H 7779 2151 50  0000 L CNN
F 2 "" H 7700 2250 50  0001 C CNN
F 3 "~" H 7700 2250 50  0001 C CNN
	1    7700 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1300 6500 1300
Wire Wire Line
	6400 1300 6400 1800
Wire Wire Line
	6400 2250 6550 2250
Wire Wire Line
	6550 1800 6400 1800
Connection ~ 6400 1800
Wire Wire Line
	6400 1800 6400 2250
Wire Wire Line
	6550 1400 6250 1400
Wire Wire Line
	6250 1400 6250 1900
Wire Wire Line
	6250 2350 6400 2350
Wire Wire Line
	6550 1900 6250 1900
Connection ~ 6250 1900
Wire Wire Line
	6250 1900 6250 2350
Wire Wire Line
	6500 1300 6500 1200
Wire Wire Line
	6500 1200 7350 1200
Wire Wire Line
	7350 1200 7350 1300
Wire Wire Line
	7350 2250 7500 2250
Connection ~ 6500 1300
Wire Wire Line
	6500 1300 6400 1300
Wire Wire Line
	7500 1300 7350 1300
Connection ~ 7350 1300
Wire Wire Line
	7500 1750 7350 1750
Wire Wire Line
	7350 1300 7350 1750
Connection ~ 7350 1750
Wire Wire Line
	7350 1750 7350 2250
Wire Wire Line
	7500 1400 7300 1400
Wire Wire Line
	7300 1400 7300 1850
Wire Wire Line
	7300 2500 6400 2500
Wire Wire Line
	6400 2500 6400 2350
Connection ~ 6400 2350
Wire Wire Line
	6400 2350 6550 2350
Wire Wire Line
	7500 1850 7300 1850
Connection ~ 7300 1850
Wire Wire Line
	7300 1850 7300 2350
Wire Wire Line
	7500 2350 7300 2350
Connection ~ 7300 2350
Wire Wire Line
	7300 2350 7300 2500
Wire Wire Line
	6250 2350 5200 2350
Connection ~ 6250 2350
Wire Wire Line
	6400 1300 5200 1300
Connection ~ 6400 1300
Connection ~ 5200 1300
Connection ~ 5200 2350
Wire Wire Line
	5200 2350 5200 2450
Wire Wire Line
	5200 2250 5200 2350
Wire Wire Line
	5200 1300 5200 1550
Wire Wire Line
	5200 1100 5200 1300
Wire Notes Line
	6100 1000 6100 2700
$Comp
L 74xx:74LS373 U3
U 1 1 5C80DE0E
P 6400 3800
F 0 "U3" H 6400 4778 50  0000 C CNN
F 1 "74LS373" H 6400 4687 50  0000 C CNN
F 2 "" H 6400 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS373" H 6400 3800 50  0001 C CNN
	1    6400 3800
	-1   0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 5C80E547
P 800 5350
F 0 "TP7" H 858 5424 50  0000 L CNN
F 1 "TestPoint" H 858 5379 50  0001 L CNN
F 2 "" H 1000 5350 50  0001 C CNN
F 3 "~" H 1000 5350 50  0001 C CNN
	1    800  5350
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 5C80E5FD
P 1400 5350
F 0 "TP8" H 1458 5424 50  0000 L CNN
F 1 "TestPoint" H 1458 5379 50  0001 L CNN
F 2 "" H 1600 5350 50  0001 C CNN
F 3 "~" H 1600 5350 50  0001 C CNN
	1    1400 5350
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 5C810319
P 1100 5650
F 0 "SW3" H 1100 5843 50  0000 C CNN
F 1 "SW_Push" V 1145 5602 50  0001 R CNN
F 2 "" H 1100 5850 50  0001 C CNN
F 3 "" H 1100 5850 50  0001 C CNN
	1    1100 5650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	800  5350 800  5650
Wire Wire Line
	800  5650 900  5650
Wire Wire Line
	1400 5650 1300 5650
Wire Wire Line
	1400 5350 1400 5650
Wire Notes Line
	700  5150 700  5750
Wire Notes Line
	700  5750 1650 5750
Wire Notes Line
	1650 5750 1650 5150
Wire Notes Line
	1650 5150 700  5150
Wire Notes Line
	6100 1000 8100 1000
Wire Notes Line
	6100 2700 8100 2700
Wire Notes Line
	8100 1000 8100 2700
$Comp
L xyz-rescue:8051-8051-schematic U1
U 1 1 5C7D168F
P 3300 3900
F 0 "U1" H 3300 5417 50  0000 C CNN
F 1 "8051" H 3300 5326 50  0000 C CNN
F 2 "" H 3300 4100 50  0001 C CNN
F 3 "" H 3300 4100 50  0001 C CNN
	1    3300 3900
	1    0    0    -1  
$EndComp
Entry Wire Line
	4000 2900 4100 3000
Entry Wire Line
	4000 3000 4100 3100
Entry Wire Line
	4000 3100 4100 3200
Entry Wire Line
	4000 3200 4100 3300
Entry Wire Line
	4000 3300 4100 3400
Entry Wire Line
	4000 3400 4100 3500
Entry Wire Line
	4000 3500 4100 3600
Entry Wire Line
	4000 3600 4100 3700
Text GLabel 4100 3350 2    50   Input ~ 0
AD0-AD7
$Comp
L Device:R_Network10_US RN4
U 1 1 5C837FD4
P 4800 3200
F 0 "RN4" V 4083 3200 50  0000 C CNN
F 1 "10K" V 4174 3200 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP11" V 5375 3200 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4800 3200 50  0001 C CNN
	1    4800 3200
	0    -1   1    0   
$EndComp
Entry Wire Line
	5000 2800 5100 2900
Entry Wire Line
	5000 2900 5100 3000
Entry Wire Line
	5000 3000 5100 3100
Entry Wire Line
	5000 3100 5100 3200
Entry Wire Line
	5000 3200 5100 3300
Entry Wire Line
	5000 3300 5100 3400
Entry Wire Line
	5000 3400 5100 3500
Entry Wire Line
	5000 3500 5100 3600
Text GLabel 5100 3200 2    50   Input ~ 0
AD0-AD7
$Comp
L power:GND #PWR?
U 1 1 5C804747
P 5000 3850
F 0 "#PWR?" H 5000 3600 50  0001 C CNN
F 1 "GND" H 5005 3677 50  0001 C CNN
F 2 "" H 5000 3850 50  0001 C CNN
F 3 "" H 5000 3850 50  0001 C CNN
	1    5000 3850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5C806D7C
P 4150 2700
F 0 "#PWR?" H 4150 2550 50  0001 C CNN
F 1 "VCC" H 4167 2873 50  0001 C CNN
F 2 "" H 4150 2700 50  0001 C CNN
F 3 "" H 4150 2700 50  0001 C CNN
	1    4150 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2700 4150 2700
Wire Wire Line
	5000 2700 5000 2450
Wire Wire Line
	5000 2450 4600 2450
Wire Wire Line
	4600 2450 4600 2700
$Comp
L power:VCC #PWR?
U 1 1 5C81E953
P 4400 2700
F 0 "#PWR?" H 4400 2550 50  0001 C CNN
F 1 "VCC" H 4417 2873 50  0001 C CNN
F 2 "" H 4400 2700 50  0001 C CNN
F 3 "" H 4400 2700 50  0001 C CNN
	1    4400 2700
	0    -1   1    0   
$EndComp
Wire Wire Line
	4400 2700 4600 2700
Connection ~ 4600 2700
Wire Wire Line
	2650 4600 2650 4750
Connection ~ 1750 4600
Wire Wire Line
	1750 4600 1750 4650
Connection ~ 1750 4950
Wire Wire Line
	1300 3550 2600 3550
Entry Wire Line
	6900 3300 7000 3400
Entry Wire Line
	6900 3400 7000 3500
Entry Wire Line
	6900 3500 7000 3600
Entry Wire Line
	6900 3600 7000 3700
Entry Wire Line
	6900 3700 7000 3800
Entry Wire Line
	6900 3800 7000 3900
Entry Wire Line
	6900 3900 7000 4000
Entry Wire Line
	6900 4000 7000 4100
Text GLabel 7000 3750 2    50   Input ~ 0
AD0-AD7
Text GLabel 4450 4750 0    50   Input ~ 0
A15
Text GLabel 5450 5150 2    50   Input ~ 0
A14
Text GLabel 5450 5250 2    50   Input ~ 0
A13
Text GLabel 5450 5350 2    50   Input ~ 0
A12
Text GLabel 4400 4900 0    50   Input ~ 0
~RD~
Text GLabel 5800 4850 2    50   Input ~ 0
~PSEN~
Wire Wire Line
	5450 4850 5800 4850
Text GLabel 6200 4750 2    50   Input ~ 0
~READ~
Text GLabel 5450 4650 2    50   Input ~ 0
~CSPERIPH~
Wire Wire Line
	4600 4450 4950 4450
Text GLabel 4000 4100 2    50   Input ~ 0
~PSEN~
Text GLabel 4000 4550 2    50   Input ~ 0
A14
Wire Wire Line
	4450 4850 4450 4900
Wire Wire Line
	4450 4900 4400 4900
Text GLabel 4000 4650 2    50   Input ~ 0
A13
Text GLabel 4000 4750 2    50   Input ~ 0
A12
Text GLabel 2600 4450 0    50   Input ~ 0
~RD~
$Comp
L Logic_Programmable:ATF16V8C U2
U 1 1 5C8BA6CA
P 4950 5150
F 0 "U2" H 4950 6028 50  0000 C CNN
F 1 "ATF16V8C" H 4950 5937 50  0000 C CNN
F 2 "" H 4950 5150 50  0001 C CNN
F 3 "" H 4950 5150 50  0001 C CNN
	1    4950 5150
	1    0    0    -1  
$EndComp
$Comp
L Connector:RS232_connector J5
U 1 1 5C8E71D3
P 1650 6950
F 0 "J5" V 1654 7504 50  0000 L CNN
F 1 "DB9" V 1745 7504 50  0000 L CNN
F 2 "" H 1650 6950 50  0001 C CNN
F 3 " ~" H 1650 6950 50  0001 C CNN
	1    1650 6950
	0    1    1    0   
$EndComp
Entry Wire Line
	1250 6650 1350 6550
Entry Wire Line
	1450 6650 1550 6550
Entry Wire Line
	1650 6650 1750 6550
Entry Wire Line
	1850 6650 1950 6550
Entry Wire Line
	2050 6650 2150 6550
Entry Wire Line
	1350 7350 1450 7450
Entry Wire Line
	1650 7350 1750 7450
Entry Wire Line
	1950 7350 2050 7450
Wire Bus Line
	1050 6550 1050 7450
Text GLabel 1050 7000 0    50   Input ~ 0
J5P1-J5P8
$Comp
L Connector_Generic:Conn_01x08 J4
U 1 1 5C9013A2
P 2500 7000
F 0 "J4" H 2420 7517 50  0000 C CNN
F 1 "Header9" H 2420 7426 50  0000 C CNN
F 2 "" H 2500 7000 50  0001 C CNN
F 3 "~" H 2500 7000 50  0001 C CNN
	1    2500 7000
	-1   0    0    -1  
$EndComp
Entry Wire Line
	2700 6700 2800 6800
Entry Wire Line
	2700 6800 2800 6900
Entry Wire Line
	2700 6900 2800 7000
Entry Wire Line
	2700 7000 2800 7100
Entry Wire Line
	2700 7100 2800 7200
Entry Wire Line
	2700 7200 2800 7300
Entry Wire Line
	2700 7300 2800 7400
Entry Wire Line
	2700 7400 2800 7500
Text GLabel 2800 7100 2    50   Input ~ 0
J5P1-J5P8
Wire Notes Line
	550  6400 550  7550
Wire Notes Line
	550  7550 3350 7550
Wire Notes Line
	3350 7550 3350 6400
Wire Notes Line
	3350 6400 550  6400
Text Notes 4400 8000 0    51   ~ 0
This schematic has been created by Rushi James Macwan. Credits and Courtesy to the class slides provided by Prof. McClure and the help & guidance received from the TAs.
Text Notes 650  6350 0    59   ~ 0
This is the connection for the RS-232 communication.
Text Notes 700  5900 0    59   ~ 0
Test-points connected through a push-button.
Wire Wire Line
	1750 4600 2650 4600
Wire Wire Line
	1750 4950 2650 4950
Wire Notes Line
	750  4200 2400 4200
Wire Notes Line
	2400 4200 2400 5050
Wire Notes Line
	2400 5050 750  5050
Wire Notes Line
	750  5050 750  4200
Text Notes 1100 4150 0    39   ~ 0
Crystal Oscillator circuit with decoupling caps.
Wire Notes Line
	600  2550 1600 2550
Wire Notes Line
	1600 2550 1600 4050
Wire Notes Line
	1600 4050 600  4050
Wire Notes Line
	600  4050 600  2550
Text Notes 750  2500 0    39   ~ 0
Reset Circuitry
Text Notes 4450 6000 0    79   ~ 0
SPLD
Text Notes 5450 4350 0    79   ~ 0
373 LATCH
Text Notes 5150 3450 0    31   ~ 0
Resistor-bridge\nNetwork
Text Notes 2750 2500 0    79   ~ 0
MCU
Wire Notes Line
	2700 1000 2700 1950
Wire Notes Line
	2700 1950 1200 1950
Wire Notes Line
	1200 1950 1200 1000
Wire Notes Line
	1200 1000 2700 1000
Text Notes 1200 2050 0    59   ~ 0
Diode bridge rectifier circuit
Text Notes 3600 950  0    59   ~ 0
Voltage Regulator\nCircuit
Text Notes 6850 950  0    59   ~ 0
Power-Headers
Text Notes 4600 2150 0    59   ~ 0
Power LED
Wire Wire Line
	5450 4750 6200 4750
Text GLabel 4000 4450 2    50   Input ~ 0
A15
Wire Wire Line
	5000 3600 5000 3850
$Comp
L power:GND #PWR?
U 1 1 5C7FE0C9
P 4950 5950
F 0 "#PWR?" H 4950 5700 50  0001 C CNN
F 1 "GND" H 4955 5777 50  0001 C CNN
F 2 "" H 4950 5950 50  0001 C CNN
F 3 "" H 4950 5950 50  0001 C CNN
	1    4950 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5850 4950 5950
$Comp
L power:GND #PWR?
U 1 1 5C80294E
P 7100 4300
F 0 "#PWR?" H 7100 4050 50  0001 C CNN
F 1 "GND" H 7105 4127 50  0001 C CNN
F 2 "" H 7100 4300 50  0001 C CNN
F 3 "" H 7100 4300 50  0001 C CNN
	1    7100 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4300 7100 4300
Wire Wire Line
	6400 3000 6700 3000
$Comp
L power:VCC #PWR?
U 1 1 5C813FF7
P 6700 3000
F 0 "#PWR?" H 6700 2850 50  0001 C CNN
F 1 "VCC" H 6717 3173 50  0001 C CNN
F 2 "" H 6700 3000 50  0001 C CNN
F 3 "" H 6700 3000 50  0001 C CNN
	1    6700 3000
	0    1    -1   0   
$EndComp
Wire Wire Line
	6400 4600 6900 4600
Wire Wire Line
	6900 4600 6900 4300
Connection ~ 6900 4300
$Comp
L power:VCC #PWR?
U 1 1 5C81E6DA
P 4600 4450
F 0 "#PWR?" H 4600 4300 50  0001 C CNN
F 1 "VCC" H 4617 4623 50  0001 C CNN
F 2 "" H 4600 4450 50  0001 C CNN
F 3 "" H 4600 4450 50  0001 C CNN
	1    4600 4450
	0    -1   1    0   
$EndComp
Wire Wire Line
	4450 5550 4450 5850
Wire Wire Line
	4450 5850 4950 5850
Wire Bus Line
	1050 7450 2050 7450
Wire Bus Line
	1050 6550 2150 6550
Wire Bus Line
	4100 3000 4100 3700
Wire Bus Line
	5100 2900 5100 3600
Wire Bus Line
	7000 3400 7000 4100
Wire Bus Line
	2800 6800 2800 7500
Connection ~ 4950 5850
Text GLabel 4000 3950 2    50   Input ~ 0
ALE
Text GLabel 6900 4200 2    50   Input ~ 0
ALE
$EndSCHEMATC
