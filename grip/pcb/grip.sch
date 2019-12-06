EESchema Schematic File Version 4
LIBS:grip-cache
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
L Display_Character:MAN71A U1
U 1 1 5DB5FD5E
P 9100 5600
F 0 "U1" H 9100 6267 50  0000 C CNN
F 1 "MAN71A" H 9100 6176 50  0000 C CNN
F 2 "grip:CAI3191AH" H 8600 4900 50  0001 L CNN
F 3 "https://www.digchip.com/datasheets/parts/datasheet/161/MAN3640A-pdf.php" H 9110 5940 50  0001 L CNN
	1    9100 5600
	1    0    0    -1  
$EndComp
$Comp
L Display_Character:MAN71A U2
U 1 1 5DB5EAD7
P 7550 5600
F 0 "U2" H 7550 6267 50  0000 C CNN
F 1 "MAN71A" H 7550 6176 50  0000 C CNN
F 2 "grip:CAI3191AH" H 7050 4900 50  0001 L CNN
F 3 "https://www.digchip.com/datasheets/parts/datasheet/161/MAN3640A-pdf.php" H 7560 5940 50  0001 L CNN
	1    7550 5600
	1    0    0    -1  
$EndComp
$Comp
L MCU_Module:Arduino_Nano_v2.x A1
U 1 1 5DB6812A
P 4900 5600
F 0 "A1" H 4900 6800 50  0000 C CNN
F 1 "Arduino_Nano_v2.x" H 4900 6700 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5050 4650 50  0001 L CNN
F 3 "https://www.arduino.cc/en/uploads/Main/ArduinoNanoManual23.pdf" H 4900 4600 50  0001 C CNN
	1    4900 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5DB753D4
P 7850 6000
F 0 "#PWR0101" H 7850 5750 50  0001 C CNN
F 1 "GND" H 7855 5827 50  0000 C CNN
F 2 "" H 7850 6000 50  0001 C CNN
F 3 "" H 7850 6000 50  0001 C CNN
	1    7850 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5DB76090
P 4900 6600
F 0 "#PWR0102" H 4900 6350 50  0001 C CNN
F 1 "GND" H 4905 6427 50  0000 C CNN
F 2 "" H 4900 6600 50  0001 C CNN
F 3 "" H 4900 6600 50  0001 C CNN
	1    4900 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5DB76900
P 9400 6000
F 0 "#PWR0103" H 9400 5750 50  0001 C CNN
F 1 "GND" H 9405 5827 50  0000 C CNN
F 2 "" H 9400 6000 50  0001 C CNN
F 3 "" H 9400 6000 50  0001 C CNN
	1    9400 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 5900 7850 6000
Connection ~ 7850 6000
Text GLabel 4400 5200 0    50   Input ~ 0
unit_A
Text GLabel 4400 5300 0    50   Input ~ 0
unit_B
Text GLabel 4400 5400 0    50   Input ~ 0
unit_C
Text GLabel 4400 5500 0    50   Input ~ 0
unit_D
Text GLabel 4400 5600 0    50   Input ~ 0
unit_E
Text GLabel 4400 5700 0    50   Input ~ 0
unit_F
Text GLabel 4400 5800 0    50   Input ~ 0
unit_G
Text GLabel 4400 6300 0    50   Input ~ 0
deci_A
Text GLabel 5400 5600 2    50   Input ~ 0
deci_B
Text GLabel 5400 5700 2    50   Input ~ 0
deci_C
Text GLabel 4400 5900 0    50   Input ~ 0
deci_D
Text GLabel 4400 6000 0    50   Input ~ 0
deci_E
Text GLabel 4400 6100 0    50   Input ~ 0
deci_F
Text GLabel 4400 6200 0    50   Input ~ 0
deci_G
Text GLabel 8800 5200 0    50   Input ~ 0
unit_A
Text GLabel 8800 5300 0    50   Input ~ 0
unit_B
Text GLabel 8800 5400 0    50   Input ~ 0
unit_C
Text GLabel 8800 5500 0    50   Input ~ 0
unit_D
Text GLabel 8800 5600 0    50   Input ~ 0
unit_E
Text GLabel 8800 5700 0    50   Input ~ 0
unit_F
Text GLabel 8800 5800 0    50   Input ~ 0
unit_G
Text GLabel 7250 5200 0    50   Input ~ 0
deci_A
Text GLabel 7250 5300 0    50   Input ~ 0
deci_B
Text GLabel 7250 5400 0    50   Input ~ 0
deci_C
Text GLabel 7250 5500 0    50   Input ~ 0
deci_D
Text GLabel 7250 5600 0    50   Input ~ 0
deci_E
Text GLabel 7250 5700 0    50   Input ~ 0
deci_F
Text GLabel 7250 5800 0    50   Input ~ 0
deci_G
Wire Wire Line
	9400 5900 9400 6000
Connection ~ 9400 6000
$Comp
L Device:R R1
U 1 1 5DB636F7
P 5900 5950
F 0 "R1" H 5970 5996 50  0000 L CNN
F 1 "1k" H 5970 5905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5830 5950 50  0001 C CNN
F 3 "~" H 5900 5950 50  0001 C CNN
	1    5900 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5DB67B47
P 5900 6100
F 0 "#PWR0104" H 5900 5850 50  0001 C CNN
F 1 "GND" H 5905 5927 50  0000 C CNN
F 2 "" H 5900 6100 50  0001 C CNN
F 3 "" H 5900 6100 50  0001 C CNN
	1    5900 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5800 5900 5800
Wire Wire Line
	5000 6600 4900 6600
Connection ~ 4900 6600
$EndSCHEMATC
