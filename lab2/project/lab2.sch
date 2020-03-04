EESchema Schematic File Version 4
EELAYER 30 0
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
L Transistor_BJT:2N2219 Q?
U 1 1 5E4B1913
P 2550 1850
F 0 "Q?" H 2741 1850 50  0001 L CNN
F 1 "2N2219" H 2740 1805 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-39-3" H 2750 1775 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 2550 1850 50  0001 L CNN
	1    2550 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1550 1350 1450
Wire Wire Line
	2650 1300 2650 1650
Wire Wire Line
	2350 1850 2100 1850
Wire Wire Line
	2100 1850 2100 1300
Wire Wire Line
	2100 1300 2650 1300
Wire Wire Line
	2650 2050 2650 2350
Wire Wire Line
	2650 2350 2000 2350
Wire Wire Line
	1350 2350 1350 2250
$Comp
L power:GND #PWR?
U 1 1 5E4B3070
P 2000 2450
F 0 "#PWR?" H 2000 2200 50  0001 C CNN
F 1 "GND" H 2005 2277 50  0000 C CNN
F 2 "" H 2000 2450 50  0001 C CNN
F 3 "" H 2000 2450 50  0001 C CNN
	1    2000 2450
	1    0    0    -1  
$EndComp
Connection ~ 2000 2350
Wire Wire Line
	2000 2350 1350 2350
Wire Wire Line
	2000 2450 2000 2400
$Comp
L circuits:I_source I?
U 1 1 5E4B3D86
P 1350 1850
F 0 "I?" H 917 1850 50  0001 R CNN
F 1 "I_source" H 918 1895 50  0001 R CNN
F 2 "" H 1350 1850 50  0001 C CNN
F 3 "" H 1350 1850 50  0001 C CNN
	1    1350 1850
	-1   0    0    1   
$EndComp
Text GLabel 1750 2500 0    50   Input ~ 0
5V_Black
Wire Wire Line
	1750 2500 1850 2500
Wire Wire Line
	1850 2500 1850 2400
Wire Wire Line
	1850 2400 2000 2400
Connection ~ 2000 2400
Wire Wire Line
	2000 2400 2000 2350
Text GLabel 1250 1450 0    50   Input ~ 0
Ch1_Red
Wire Wire Line
	1250 1450 1350 1450
Connection ~ 1350 1450
Wire Wire Line
	1350 1450 1350 1300
Text GLabel 1250 2250 0    50   Input ~ 0
Ch1_Black
Wire Wire Line
	1250 2250 1350 2250
Connection ~ 1350 2250
Wire Wire Line
	1350 2250 1350 2150
$Comp
L Transistor_BJT:2N2219 Q?
U 1 1 5E4B7C2E
P 4900 1850
F 0 "Q?" H 5091 1850 50  0001 L CNN
F 1 "2N2219" H 5090 1805 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-39-3" H 5100 1775 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 4900 1850 50  0001 L CNN
	1    4900 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1550 3700 1450
Wire Wire Line
	5000 1300 5000 1650
Wire Wire Line
	4700 1850 4450 1850
Wire Wire Line
	4450 1850 4450 1300
Wire Wire Line
	4450 1300 5000 1300
Wire Wire Line
	5000 2050 5000 2350
Wire Wire Line
	5000 2350 4350 2350
Wire Wire Line
	3700 2350 3700 2250
$Comp
L power:GND #PWR?
U 1 1 5E4B7C3E
P 4350 2450
F 0 "#PWR?" H 4350 2200 50  0001 C CNN
F 1 "GND" H 4355 2277 50  0000 C CNN
F 2 "" H 4350 2450 50  0001 C CNN
F 3 "" H 4350 2450 50  0001 C CNN
	1    4350 2450
	1    0    0    -1  
$EndComp
Connection ~ 4350 2350
Wire Wire Line
	4350 2350 3700 2350
Wire Wire Line
	4350 2450 4350 2400
Text GLabel 4100 2500 0    50   Input ~ 0
5V_Black
Wire Wire Line
	4100 2500 4200 2500
Wire Wire Line
	4200 2500 4200 2400
Wire Wire Line
	4200 2400 4350 2400
Connection ~ 4350 2400
Wire Wire Line
	4350 2400 4350 2350
Text GLabel 3600 1450 0    50   Input ~ 0
Ch1_Red
Wire Wire Line
	3600 1450 3700 1450
Connection ~ 3700 1450
Wire Wire Line
	3700 1450 3700 1300
Text GLabel 3600 2250 0    50   Input ~ 0
Ch1_Black
Wire Wire Line
	3600 2250 3700 2250
Connection ~ 3700 2250
Wire Wire Line
	3700 2250 3700 2150
$Comp
L circuits:v_source V?
U 1 1 5E4B82FE
P 3700 1850
F 0 "V?" H 3928 1850 50  0001 L CNN
F 1 "v_source" H 3928 1805 50  0001 L CNN
F 2 "" H 3700 1850 50  0001 C CNN
F 3 "" H 3700 1850 50  0001 C CNN
	1    3700 1850
	1    0    0    -1  
$EndComp
Text Notes 2400 950  0    146  ~ 0
Experiment 2
$Comp
L Device:R_US R?
U 1 1 5E4C5C3C
P 1700 1300
F 0 "R?" V 1495 1300 50  0001 C CNN
F 1 "R" V 1587 1300 50  0000 C CNN
F 2 "" V 1740 1290 50  0001 C CNN
F 3 "~" H 1700 1300 50  0001 C CNN
	1    1700 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 1300 1550 1300
Wire Wire Line
	1850 1300 2100 1300
Connection ~ 2100 1300
$Comp
L Device:R_US R?
U 1 1 5E4CB322
P 4050 1300
F 0 "R?" V 3845 1300 50  0001 C CNN
F 1 "R" V 3937 1300 50  0000 C CNN
F 2 "" V 4090 1290 50  0001 C CNN
F 3 "~" H 4050 1300 50  0001 C CNN
	1    4050 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 1300 3900 1300
Wire Wire Line
	4200 1300 4450 1300
Connection ~ 4450 1300
$EndSCHEMATC
