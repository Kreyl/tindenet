EESchema Schematic File Version 2
LIBS:Antennas_kl
LIBS:Connectors_kl
LIBS:pcb_details
LIBS:power
LIBS:Power_kl
LIBS:st_kl
LIBS:Tittar_kl
LIBS:Transistors_kl
LIBS:RF ICs
LIBS:memory
LIBS:UsbHost-cache
EELAYER 27 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date "23 nov 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 1350 6700 0    60   Italic 12
Debug port
Text Notes 1250 5400 0    60   Italic 12
Programming
Text Notes 5050 700  0    60   Italic 12
CPU
Text Notes 1800 9900 0    60   ~ 12
Indication
Text Notes 7800 8850 0    60   ~ 12
Power
Text Label 3650 1300 2    60   ~ 0
LED1
Text Label 3650 1400 2    60   ~ 0
LED2
$Comp
L GND #PWR01
U 1 1 5149BCE1
P 3700 4200
F 0 "#PWR01" H 3790 4180 30  0001 C CNN
F 1 "GND" H 3700 4120 30  0001 C CNN
F 2 "" H 3700 4200 60  0001 C CNN
F 3 "" H 3700 4200 60  0001 C CNN
	1    3700 4200
	1    0    0    -1  
$EndComp
$Comp
L REFPOINT RP2
U 1 1 5149B6EB
P 14050 9750
F 0 "RP2" H 14750 9750 60  0000 C CNN
F 1 "REFPOINT" H 14400 9750 60  0000 C CNN
F 2 "" H 14050 9750 60  0001 C CNN
F 3 "" H 14050 9750 60  0001 C CNN
	1    14050 9750
	1    0    0    -1  
$EndComp
$Comp
L REFPOINT RP1
U 1 1 5149B6E8
P 14050 9500
F 0 "RP1" H 14750 9500 60  0000 C CNN
F 1 "REFPOINT" H 14400 9500 60  0000 C CNN
F 2 "" H 14050 9500 60  0001 C CNN
F 3 "" H 14050 9500 60  0001 C CNN
	1    14050 9500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5149A586
P 1950 6150
F 0 "#PWR02" H 2040 6130 30  0001 C CNN
F 1 "GND" H 1950 6070 30  0001 C CNN
F 2 "" H 1950 6150 60  0001 C CNN
F 3 "" H 1950 6150 60  0001 C CNN
	1    1950 6150
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR03
U 1 1 5149A57E
P 1950 5950
F 0 "#PWR03" H 1950 5910 30  0001 C CNN
F 1 "+3.3V" H 2030 5980 30  0000 C CNN
F 2 "" H 1950 5950 60  0001 C CNN
F 3 "" H 1950 5950 60  0001 C CNN
	1    1950 5950
	1    0    0    -1  
$EndComp
Text Label 1950 5750 0    60   ~ 0
SWCLK
Text Label 1950 5850 0    60   ~ 0
SWDIO
Text Label 6650 2700 0    60   ~ 0
SWCLK
Text Label 6650 2600 0    60   ~ 0
SWDIO
$Comp
L GND #PWR04
U 1 1 5149A472
P 5050 4200
F 0 "#PWR04" H 5140 4180 30  0001 C CNN
F 1 "GND" H 5050 4120 30  0001 C CNN
F 2 "" H 5050 4200 60  0001 C CNN
F 3 "" H 5050 4200 60  0001 C CNN
	1    5050 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5149A46C
P 3450 4200
F 0 "#PWR05" H 3540 4180 30  0001 C CNN
F 1 "GND" H 3450 4120 30  0001 C CNN
F 2 "" H 3450 4200 60  0001 C CNN
F 3 "" H 3450 4200 60  0001 C CNN
	1    3450 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5149A469
P 3150 4200
F 0 "#PWR06" H 3240 4180 30  0001 C CNN
F 1 "GND" H 3150 4120 30  0001 C CNN
F 2 "" H 3150 4200 60  0001 C CNN
F 3 "" H 3150 4200 60  0001 C CNN
	1    3150 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5149A467
P 2650 4200
F 0 "#PWR07" H 2740 4180 30  0001 C CNN
F 1 "GND" H 2650 4120 30  0001 C CNN
F 2 "" H 2650 4200 60  0001 C CNN
F 3 "" H 2650 4200 60  0001 C CNN
	1    2650 4200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR08
U 1 1 5149A44F
P 3100 3350
F 0 "#PWR08" H 3100 3310 30  0001 C CNN
F 1 "+3.3V" H 3180 3380 30  0000 C CNN
F 2 "" H 3100 3350 60  0001 C CNN
F 3 "" H 3100 3350 60  0001 C CNN
	1    3100 3350
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR09
U 1 1 5149A448
P 2350 3150
F 0 "#PWR09" H 2350 3110 30  0001 C CNN
F 1 "+3.3V" H 2430 3180 30  0000 C CNN
F 2 "" H 2350 3150 60  0001 C CNN
F 3 "" H 2350 3150 60  0001 C CNN
	1    2350 3150
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR010
U 1 1 5149A441
P 3400 3650
F 0 "#PWR010" H 3400 3610 30  0001 C CNN
F 1 "+3.3V" H 3480 3680 30  0000 C CNN
F 2 "" H 3400 3650 60  0001 C CNN
F 3 "" H 3400 3650 60  0001 C CNN
	1    3400 3650
	-1   0    0    1   
$EndComp
$Comp
L C C13
U 1 1 5149A42D
P 2650 3900
F 0 "C13" H 2550 3800 50  0000 L CNN
F 1 "0.1u" H 2550 4000 50  0000 L CNN
F 2 "CAP_0402" V 2750 3750 28  0000 C BNN
F 3 "" H 2650 3900 60  0001 C CNN
	1    2650 3900
	1    0    0    -1  
$EndComp
$Comp
L C C14
U 1 1 5149A385
P 3150 3900
F 0 "C14" H 3050 3800 50  0000 L CNN
F 1 "0.1u" H 3050 4000 50  0000 L CNN
F 2 "CAP_0402" V 3250 3750 28  0000 C BNN
F 3 "" H 3150 3900 60  0001 C CNN
	1    3150 3900
	1    0    0    -1  
$EndComp
$Comp
L C C16
U 1 1 5149A370
P 3700 3900
F 0 "C16" H 3600 3800 50  0000 L CNN
F 1 "1u" H 3600 4000 50  0000 L CNN
F 2 "CAP_0402" V 3800 3750 28  0000 C BNN
F 3 "" H 3700 3900 60  0001 C CNN
	1    3700 3900
	1    0    0    -1  
$EndComp
$Comp
L C C15
U 1 1 5149A36D
P 3450 3900
F 0 "C15" H 3350 3800 50  0000 L CNN
F 1 "10n" H 3350 4000 50  0000 L CNN
F 2 "CAP_0402" V 3550 3750 28  0000 C BNN
F 3 "" H 3450 3900 60  0001 C CNN
	1    3450 3900
	1    0    0    -1  
$EndComp
NoConn ~ 3800 3000
Text Label 6650 2200 0    60   ~ 0
UART_TX
$Comp
L GND #PWR011
U 1 1 5149A28E
P 1600 7300
F 0 "#PWR011" H 1690 7280 30  0001 C CNN
F 1 "GND" H 1600 7220 30  0001 C CNN
F 2 "" H 1600 7300 60  0001 C CNN
F 3 "" H 1600 7300 60  0001 C CNN
	1    1600 7300
	-1   0    0    -1  
$EndComp
$Comp
L ST_SWD XL1
U 1 1 51499E97
P 1500 5900
F 0 "XL1" H 1350 6200 60  0000 C CNN
F 1 "ST_SWD" H 1700 6200 60  0000 C CNN
F 2 "" H 1500 5900 60  0001 C CNN
F 3 "" H 1500 5900 60  0001 C CNN
	1    1500 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 525CF187
P 2400 4200
F 0 "#PWR012" H 2490 4180 30  0001 C CNN
F 1 "GND" H 2400 4120 30  0001 C CNN
F 2 "" H 2400 4200 60  0001 C CNN
F 3 "" H 2400 4200 60  0001 C CNN
	1    2400 4200
	1    0    0    -1  
$EndComp
$Comp
L C C12
U 1 1 525CF18D
P 2400 3900
F 0 "C12" H 2300 3800 50  0000 L CNN
F 1 "10u" H 2300 4000 50  0000 L CNN
F 2 "CAP_0603" V 2500 3750 28  0000 C BNN
F 3 "" H 2400 3900 60  0001 C CNN
	1    2400 3900
	1    0    0    -1  
$EndComp
Text Notes 11150 1400 0    60   ~ 0
Radio
$Comp
L CRYSTAL_H XTAL1
U 1 1 5265B349
P 9300 3150
F 0 "XTAL1" H 9250 3450 60  0000 C CNN
F 1 "27MHz" H 9300 3350 60  0000 C CNN
F 2 "03225" H 9325 3275 39  0000 C CNN
F 3 "" H 9300 3150 60  0001 C CNN
	1    9300 3150
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 5265B34F
P 9550 3400
F 0 "C10" H 9450 3300 50  0000 L CNN
F 1 "10pF" H 9450 3500 50  0000 L CNN
F 2 "CAP_0402" V 9650 3250 28  0000 C BNN
F 3 "" H 9550 3400 60  0001 C CNN
	1    9550 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 5265B355
P 9550 3700
F 0 "#PWR013" H 9640 3680 30  0001 C CNN
F 1 "GND" H 9550 3620 30  0001 C CNN
F 2 "" H 9550 3700 60  0001 C CNN
F 3 "" H 9550 3700 60  0001 C CNN
	1    9550 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5265B35B
P 9050 3700
F 0 "#PWR014" H 9140 3680 30  0001 C CNN
F 1 "GND" H 9050 3620 30  0001 C CNN
F 2 "" H 9050 3700 60  0001 C CNN
F 3 "" H 9050 3700 60  0001 C CNN
	1    9050 3700
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 5265B361
P 9050 3400
F 0 "C9" H 8950 3300 50  0000 L CNN
F 1 "10pF" H 8950 3500 50  0000 L CNN
F 2 "CAP_0402" V 9150 3250 28  0000 C BNN
F 3 "" H 9050 3400 60  0001 C CNN
	1    9050 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 5265B367
P 9300 3700
F 0 "#PWR015" H 9390 3680 30  0001 C CNN
F 1 "GND" H 9300 3620 30  0001 C CNN
F 2 "" H 9300 3700 60  0001 C CNN
F 3 "" H 9300 3700 60  0001 C CNN
	1    9300 3700
	1    0    0    -1  
$EndComp
Text Label 9650 2500 0    60   ~ 0
CC_GDO2
$Comp
L +3.3V #PWR016
U 1 1 5265B39E
P 11750 2800
F 0 "#PWR016" H 11750 2760 30  0001 C CNN
F 1 "+3.3V" H 11830 2830 30  0000 C CNN
F 2 "" H 11750 2800 60  0001 C CNN
F 3 "" H 11750 2800 60  0001 C CNN
	1    11750 2800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR017
U 1 1 5265B3A4
P 12000 2700
F 0 "#PWR017" H 12000 2660 30  0001 C CNN
F 1 "+3.3V" H 12080 2730 30  0000 C CNN
F 2 "" H 12000 2700 60  0001 C CNN
F 3 "" H 12000 2700 60  0001 C CNN
	1    12000 2700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR018
U 1 1 5265B3AA
P 12250 2600
F 0 "#PWR018" H 12250 2560 30  0001 C CNN
F 1 "+3.3V" H 12330 2630 30  0000 C CNN
F 2 "" H 12250 2600 60  0001 C CNN
F 3 "" H 12250 2600 60  0001 C CNN
	1    12250 2600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR019
U 1 1 5265B3B0
P 12500 2500
F 0 "#PWR019" H 12500 2460 30  0001 C CNN
F 1 "+3.3V" H 12580 2530 30  0000 C CNN
F 2 "" H 12500 2500 60  0001 C CNN
F 3 "" H 12500 2500 60  0001 C CNN
	1    12500 2500
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR020
U 1 1 5265B3B6
P 12750 2400
F 0 "#PWR020" H 12750 2360 30  0001 C CNN
F 1 "+3.3V" H 12830 2430 30  0000 C CNN
F 2 "" H 12750 2400 60  0001 C CNN
F 3 "" H 12750 2400 60  0001 C CNN
	1    12750 2400
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR021
U 1 1 5265B3BC
P 13000 2300
F 0 "#PWR021" H 13000 2260 30  0001 C CNN
F 1 "+3.3V" H 13080 2330 30  0000 C CNN
F 2 "" H 13000 2300 60  0001 C CNN
F 3 "" H 13000 2300 60  0001 C CNN
	1    13000 2300
	1    0    0    -1  
$EndComp
Text Label 9650 2400 0    60   ~ 0
CC_GDO0
Text Label 9650 2200 0    60   ~ 0
CC_CS
Text Label 9650 1900 0    60   ~ 0
CC_SCK
Text Label 9650 2100 0    60   ~ 0
CC_MISO
Text Label 9650 2000 0    60   ~ 0
CC_MOSI
$Comp
L CC1101 DD2
U 1 1 5265B3C7
P 10900 2550
F 0 "DD2" H 10450 3350 60  0000 C CNN
F 1 "CC1101" H 11200 3350 60  0000 C CNN
F 2 "" H 10900 2550 60  0001 C CNN
F 3 "" H 10900 2550 60  0001 C CNN
	1    10900 2550
	1    0    0    -1  
$EndComp
Text Label 12400 2100 0    60   ~ 0
RF2
Text Label 12400 1900 0    60   ~ 0
RF1
$Comp
L GND #PWR022
U 1 1 5265B3CF
P 12950 3300
F 0 "#PWR022" H 13040 3280 30  0001 C CNN
F 1 "GND" H 12950 3220 30  0001 C CNN
F 2 "" H 12950 3300 60  0001 C CNN
F 3 "" H 12950 3300 60  0001 C CNN
	1    12950 3300
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 5265B3D5
P 12950 3050
F 0 "C8" H 12850 3150 50  0000 L CNN
F 1 "220pF" H 12850 2950 50  0000 L CNN
F 2 "" H 12950 3050 60  0001 C CNN
F 3 "" H 12950 3050 60  0001 C CNN
	1    12950 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 5265B3DB
P 12450 3300
F 0 "#PWR023" H 12540 3280 30  0001 C CNN
F 1 "GND" H 12450 3220 30  0001 C CNN
F 2 "" H 12450 3300 60  0001 C CNN
F 3 "" H 12450 3300 60  0001 C CNN
	1    12450 3300
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 5265B3E1
P 12450 3050
F 0 "C6" H 12350 3150 50  0000 L CNN
F 1 "10n" H 12350 2900 50  0000 L CNN
F 2 "" H 12450 3050 60  0001 C CNN
F 3 "" H 12450 3050 60  0001 C CNN
	1    12450 3050
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 5265B3E7
P 12700 3050
F 0 "C7" H 12600 3150 50  0000 L CNN
F 1 "0.1u" H 12600 2950 50  0000 L CNN
F 2 "" H 12700 3050 60  0001 C CNN
F 3 "" H 12700 3050 60  0001 C CNN
	1    12700 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 5265B3ED
P 12700 3300
F 0 "#PWR024" H 12790 3280 30  0001 C CNN
F 1 "GND" H 12700 3220 30  0001 C CNN
F 2 "" H 12700 3300 60  0001 C CNN
F 3 "" H 12700 3300 60  0001 C CNN
	1    12700 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 5265B3F3
P 12200 3300
F 0 "#PWR025" H 12290 3280 30  0001 C CNN
F 1 "GND" H 12200 3220 30  0001 C CNN
F 2 "" H 12200 3300 60  0001 C CNN
F 3 "" H 12200 3300 60  0001 C CNN
	1    12200 3300
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 5265B3F9
P 12200 3050
F 0 "C5" H 12100 3150 50  0000 L CNN
F 1 "3.3pF" H 12100 2950 50  0000 L CNN
F 2 "" H 12200 3050 60  0001 C CNN
F 3 "" H 12200 3050 60  0001 C CNN
	1    12200 3050
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 5265B3FF
P 11950 3050
F 0 "C4" H 11850 3150 50  0000 L CNN
F 1 "10n" H 11850 2900 50  0000 L CNN
F 2 "" H 11950 3050 60  0001 C CNN
F 3 "" H 11950 3050 60  0001 C CNN
	1    11950 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 5265B405
P 11950 3300
F 0 "#PWR026" H 12040 3280 30  0001 C CNN
F 1 "GND" H 11950 3220 30  0001 C CNN
F 2 "" H 11950 3300 60  0001 C CNN
F 3 "" H 11950 3300 60  0001 C CNN
	1    11950 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 5265B40B
P 11700 3300
F 0 "#PWR027" H 11790 3280 30  0001 C CNN
F 1 "GND" H 11700 3220 30  0001 C CNN
F 2 "" H 11700 3300 60  0001 C CNN
F 3 "" H 11700 3300 60  0001 C CNN
	1    11700 3300
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5265B411
P 11700 3050
F 0 "C3" H 11600 3150 50  0000 L CNN
F 1 "220pF" H 11600 2950 50  0000 L CNN
F 2 "" H 11700 3050 60  0001 C CNN
F 3 "" H 11700 3050 60  0001 C CNN
	1    11700 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 5265B417
P 11550 3300
F 0 "#PWR028" H 11640 3280 30  0001 C CNN
F 1 "GND" H 11550 3220 30  0001 C CNN
F 2 "" H 11550 3300 60  0001 C CNN
F 3 "" H 11550 3300 60  0001 C CNN
	1    11550 3300
	1    0    0    -1  
$EndComp
$Comp
L TESTPOINT TP1
U 1 1 5265B41D
P 9500 2400
F 0 "TP1" V 9500 2600 60  0000 C CNN
F 1 "TESTPOINT" H 9475 2625 60  0001 C CNN
F 2 "" H 9500 2400 60  0001 C CNN
F 3 "" H 9500 2400 60  0001 C CNN
	1    9500 2400
	0    -1   -1   0   
$EndComp
$Comp
L TESTPOINT TP2
U 1 1 5265B423
P 9500 2500
F 0 "TP2" V 9500 2700 60  0000 C CNN
F 1 "TESTPOINT" H 9475 2725 60  0001 C CNN
F 2 "" H 9500 2500 60  0001 C CNN
F 3 "" H 9500 2500 60  0001 C CNN
	1    9500 2500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR029
U 1 1 5265B429
P 10850 3700
F 0 "#PWR029" H 10940 3680 30  0001 C CNN
F 1 "GND" H 10850 3620 30  0001 C CNN
F 2 "" H 10850 3700 60  0001 C CNN
F 3 "" H 10850 3700 60  0001 C CNN
	1    10850 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 5265B42F
P 9850 3700
F 0 "#PWR030" H 9940 3680 30  0001 C CNN
F 1 "GND" H 9850 3620 30  0001 C CNN
F 2 "" H 9850 3700 60  0001 C CNN
F 3 "" H 9850 3700 60  0001 C CNN
	1    9850 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 5265B435
P 10100 3700
F 0 "#PWR031" H 10190 3680 30  0001 C CNN
F 1 "GND" H 10100 3620 30  0001 C CNN
F 2 "" H 10100 3700 60  0001 C CNN
F 3 "" H 10100 3700 60  0001 C CNN
	1    10100 3700
	1    0    0    -1  
$EndComp
$Comp
L C C11
U 1 1 5265B43B
P 9850 3400
F 0 "C11" H 9850 3500 50  0000 L CNN
F 1 "0.1u" H 9850 3300 50  0000 L CNN
F 2 "" H 9850 3400 60  0001 C CNN
F 3 "" H 9850 3400 60  0001 C CNN
	1    9850 3400
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5265B441
P 10100 3400
F 0 "R2" V 10180 3400 50  0000 C CNN
F 1 "56k" V 10100 3400 50  0000 C CNN
F 2 "" H 10100 3400 60  0001 C CNN
F 3 "" H 10100 3400 60  0001 C CNN
	1    10100 3400
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5265B45F
P 14450 2400
F 0 "C2" H 14500 2500 50  0000 L CNN
F 1 "1.8pF" H 14500 2300 50  0000 L CNN
F 2 "" H 14450 2400 60  0001 C CNN
F 3 "" H 14450 2400 60  0001 C CNN
	1    14450 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 5265B465
P 14450 2650
F 0 "#PWR032" H 14540 2630 30  0001 C CNN
F 1 "GND" H 14450 2570 30  0001 C CNN
F 2 "" H 14450 2650 60  0001 C CNN
F 3 "" H 14450 2650 60  0001 C CNN
	1    14450 2650
	1    0    0    -1  
$EndComp
Text Notes 13150 1400 0    60   ~ 0
Matching circuit
Text Label 6550 1500 0    60   ~ 0
CC_GDO2
Text Label 6550 1600 0    60   ~ 0
CC_GDO0
Text Label 6550 1700 0    60   ~ 0
CC_CS
Text Label 6550 1800 0    60   ~ 0
CC_SCK
Text Label 6550 1900 0    60   ~ 0
CC_MISO
Text Label 6550 2000 0    60   ~ 0
CC_MOSI
$Comp
L BALUN868JOHANSON BLN1
U 1 1 526657F6
P 13400 2000
F 0 "BLN1" H 13150 2350 60  0000 C CNN
F 1 "0896BM15A0001" H 13400 2250 60  0000 C CNN
F 2 "" H 13400 2000 60  0000 C CNN
F 3 "" H 13400 2000 60  0000 C CNN
	1    13400 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR033
U 1 1 52665933
P 13500 2500
F 0 "#PWR033" H 13590 2480 30  0001 C CNN
F 1 "GND" H 13500 2420 30  0001 C CNN
F 2 "" H 13500 2500 60  0001 C CNN
F 3 "" H 13500 2500 60  0001 C CNN
	1    13500 2500
	1    0    0    -1  
$EndComp
$Comp
L L L1
U 1 1 52665AF6
P 14200 1900
F 0 "L1" V 14100 1760 40  0000 C CNN
F 1 "5.6nH" V 14100 1900 40  0000 C CNN
F 2 "IND_0402" V 14260 1910 40  0000 C CNN
F 3 "~" H 14200 1900 60  0000 C CNN
	1    14200 1900
	0    1    1    0   
$EndComp
Text Notes 13750 2100 0    60   ~ 0
L-07C5N6SV4
Text Notes 13700 2550 0    60   ~ 0
500R07S1R8BV4
$Comp
L GND #PWR034
U 1 1 5266DE3E
P 2850 10300
F 0 "#PWR034" H 2940 10280 30  0001 C CNN
F 1 "GND" H 2850 10220 30  0001 C CNN
F 2 "" H 2850 10300 60  0001 C CNN
F 3 "" H 2850 10300 60  0001 C CNN
	1    2850 10300
	0    -1   -1   0   
$EndComp
$Comp
L R R9
U 1 1 5266DE50
P 1950 10800
F 0 "R9" V 2030 10650 50  0000 C CNN
F 1 "51R" V 1950 10800 50  0000 C CNN
F 2 "RES_0603" V 2030 10900 28  0000 C CNN
F 3 "" H 1950 10800 60  0001 C CNN
	1    1950 10800
	0    -1   -1   0   
$EndComp
$Comp
L R R8
U 1 1 5266DE56
P 1950 10300
F 0 "R8" V 2030 10150 50  0000 C CNN
F 1 "51R" V 1950 10300 50  0000 C CNN
F 2 "RES_0603" V 2030 10400 28  0000 C CNN
F 3 "" H 1950 10300 60  0001 C CNN
	1    1950 10300
	0    -1   -1   0   
$EndComp
Text Label 6650 2300 0    60   ~ 0
UART_RX
Text Label 1850 7050 0    60   ~ 0
UART_TX
Text Label 1850 6950 0    60   ~ 0
UART_RX
$Comp
L CONN_3 XL2
U 1 1 526728AC
P 1400 7050
F 0 "XL2" V 1350 7050 40  0000 C CNN
F 1 "CONN_3" V 1450 7050 40  0000 C CNN
F 2 "~" H 1400 7050 60  0000 C CNN
F 3 "~" H 1400 7050 60  0000 C CNN
	1    1400 7050
	1    0    0    1   
$EndComp
NoConn ~ 6450 2100
NoConn ~ 3800 1700
$Comp
L GND #PWR035
U 1 1 526E3E25
P 2900 4200
F 0 "#PWR035" H 2990 4180 30  0001 C CNN
F 1 "GND" H 2900 4120 30  0001 C CNN
F 2 "" H 2900 4200 60  0001 C CNN
F 3 "" H 2900 4200 60  0001 C CNN
	1    2900 4200
	1    0    0    -1  
$EndComp
$Comp
L C C18
U 1 1 526E3E2B
P 2900 3900
F 0 "C18" H 2800 3800 50  0000 L CNN
F 1 "0.1u" H 2800 4000 50  0000 L CNN
F 2 "CAP_0402" V 3000 3750 28  0000 C BNN
F 3 "" H 2900 3900 60  0001 C CNN
	1    2900 3900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR036
U 1 1 526E3E32
P 2850 3250
F 0 "#PWR036" H 2850 3210 30  0001 C CNN
F 1 "+3.3V" H 2930 3280 30  0000 C CNN
F 2 "" H 2850 3250 60  0001 C CNN
F 3 "" H 2850 3250 60  0001 C CNN
	1    2850 3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	1950 6150 1950 6050
Wire Wire Line
	1950 6050 1850 6050
Wire Wire Line
	1950 5750 1850 5750
Wire Wire Line
	6450 2600 6650 2600
Wire Wire Line
	3700 4100 3700 4200
Wire Wire Line
	2650 4100 2650 4200
Wire Wire Line
	6450 2200 6650 2200
Wire Wire Line
	1600 7150 1600 7300
Wire Wire Line
	3150 4100 3150 4200
Wire Wire Line
	3450 4100 3450 4200
Wire Wire Line
	6450 2700 6650 2700
Wire Wire Line
	1850 5850 1950 5850
Wire Wire Line
	1850 5950 1950 5950
Wire Wire Line
	1600 6950 1850 6950
Wire Wire Line
	2400 4100 2400 4200
Wire Wire Line
	9550 3200 9550 2800
Wire Wire Line
	9550 2800 10150 2800
Wire Wire Line
	10150 2700 9050 2700
Wire Wire Line
	9050 2700 9050 3200
Wire Wire Line
	9550 3600 9550 3700
Connection ~ 9550 3150
Wire Wire Line
	9150 3150 9050 3150
Connection ~ 9050 3150
Wire Wire Line
	10150 2200 9650 2200
Wire Wire Line
	10150 2000 9650 2000
Connection ~ 12950 2300
Wire Wire Line
	12950 2300 12950 2850
Connection ~ 12700 2400
Wire Wire Line
	12700 2400 12700 2850
Connection ~ 12450 2500
Wire Wire Line
	12450 2500 12450 2850
Connection ~ 12200 2600
Wire Wire Line
	12250 2600 11500 2600
Connection ~ 11950 2700
Wire Wire Line
	12000 2700 11500 2700
Wire Wire Line
	12950 3250 12950 3300
Wire Wire Line
	12450 3250 12450 3300
Wire Wire Line
	12700 3250 12700 3300
Wire Wire Line
	12200 3250 12200 3300
Wire Wire Line
	11950 3250 11950 3300
Connection ~ 11700 2800
Wire Wire Line
	11750 2800 11500 2800
Wire Wire Line
	11550 3300 11550 3000
Connection ~ 11550 3100
Wire Wire Line
	11500 3100 11550 3100
Wire Wire Line
	10150 2400 9500 2400
Wire Wire Line
	10850 3550 10850 3700
Wire Wire Line
	9850 3600 9850 3700
Wire Wire Line
	10150 3000 9850 3000
Wire Wire Line
	9850 3000 9850 3200
Wire Wire Line
	10100 3150 10100 3100
Wire Wire Line
	10100 3100 10150 3100
Wire Wire Line
	10100 3650 10100 3700
Wire Wire Line
	11550 3000 11500 3000
Wire Wire Line
	11700 3250 11700 3300
Wire Wire Line
	11700 2850 11700 2800
Wire Wire Line
	11950 2850 11950 2700
Wire Wire Line
	12200 2850 12200 2600
Wire Wire Line
	11500 2500 12500 2500
Wire Wire Line
	11500 2400 12750 2400
Wire Wire Line
	13000 2300 11500 2300
Wire Wire Line
	9650 1900 10150 1900
Wire Wire Line
	9650 2100 10150 2100
Wire Wire Line
	9500 2500 10150 2500
Wire Wire Line
	9050 3600 9050 3700
Wire Wire Line
	9300 3300 9300 3700
Wire Wire Line
	9450 3150 9550 3150
Wire Wire Line
	14450 1900 14450 2200
Wire Wire Line
	14450 2600 14450 2650
Wire Wire Line
	6550 1600 6450 1600
Wire Wire Line
	6450 1700 6550 1700
Wire Wire Line
	6550 1800 6450 1800
Wire Wire Line
	6450 1900 6550 1900
Wire Wire Line
	6550 2000 6450 2000
Wire Wire Line
	6450 1500 6550 1500
Wire Wire Line
	12950 1900 11500 1900
Wire Wire Line
	11500 2100 12950 2100
Wire Wire Line
	13500 2500 13500 2350
Wire Wire Line
	13400 2350 13400 2400
Wire Wire Line
	13400 2400 13600 2400
Connection ~ 13500 2400
Wire Wire Line
	13600 2400 13600 2350
Wire Wire Line
	14000 1900 13850 1900
Wire Wire Line
	3650 1300 3800 1300
Wire Wire Line
	3800 1400 3650 1400
Wire Notes Line
	450  4900 16050 4900
Wire Notes Line
	4150 4900 4150 11200
Wire Notes Line
	4150 8600 16000 8600
Wire Wire Line
	6650 2300 6450 2300
Wire Wire Line
	1850 7050 1600 7050
Connection ~ 3450 3650
Connection ~ 3700 3650
Connection ~ 3150 3350
Wire Wire Line
	14400 1900 14600 1900
Connection ~ 14450 1900
Wire Wire Line
	3800 3650 3400 3650
Wire Wire Line
	3450 3700 3450 3650
Wire Wire Line
	3700 3500 3700 3700
Wire Wire Line
	3150 3700 3150 3350
Wire Wire Line
	2900 4100 2900 4200
Wire Wire Line
	2900 3700 2900 3250
Wire Wire Line
	2850 3250 3800 3250
Connection ~ 2900 3250
Wire Wire Line
	3800 3150 2350 3150
Wire Wire Line
	2400 3700 2400 3150
Connection ~ 2400 3150
Wire Wire Line
	2650 3700 2650 3150
Connection ~ 2650 3150
$Comp
L ANT_PCB_MONO ANT1
U 1 1 527152AC
P 14800 1900
F 0 "ANT1" H 14600 2150 60  0000 C CNN
F 1 "ANT_PCB_MONO" H 14850 2050 60  0000 C CNN
F 2 "~" H 14800 1900 60  0000 C CNN
F 3 "~" H 14800 1900 60  0000 C CNN
	1    14800 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4200 5050 3950
Wire Wire Line
	4850 3950 4850 4050
Wire Wire Line
	4850 4050 5300 4050
Connection ~ 5050 4050
Wire Wire Line
	4950 3950 4950 4050
Connection ~ 4950 4050
Wire Wire Line
	5150 4050 5150 3950
Wire Wire Line
	5300 4050 5300 3950
Connection ~ 5150 4050
Wire Wire Line
	3800 3350 3100 3350
Wire Wire Line
	3800 3500 3700 3500
NoConn ~ 6450 1400
NoConn ~ 3800 1500
NoConn ~ 3800 2300
NoConn ~ 3800 2400
NoConn ~ 3800 2500
NoConn ~ 3800 2600
NoConn ~ 3800 2700
NoConn ~ 3800 2800
NoConn ~ 6450 2800
$Comp
L STM32L151CXTX DD1
U 1 1 52A19E0D
P 5100 2500
F 0 "DD1" H 4600 3850 60  0000 C CNN
F 1 "STM32L151CXTX" H 5250 3850 60  0000 C CNN
F 2 "~" H 5100 2500 60  0000 C CNN
F 3 "~" H 5100 2500 60  0000 C CNN
	1    5100 2500
	1    0    0    -1  
$EndComp
Connection ~ 7850 3050
Wire Wire Line
	7750 3050 7850 3050
Connection ~ 7350 3050
Wire Wire Line
	7350 3100 7350 3050
Wire Wire Line
	7850 3500 7850 3550
Wire Wire Line
	7350 3500 7350 3550
Wire Wire Line
	7850 2950 7850 3100
Wire Wire Line
	7600 3550 7600 3200
Wire Wire Line
	7200 3050 7450 3050
$Comp
L R R1
U 1 1 547211EF
P 6950 3050
F 0 "R1" V 7030 2900 50  0000 C CNN
F 1 "220R" V 6950 3050 50  0000 C CNN
F 2 "RES_0603" V 6800 3050 28  0000 C CNN
F 3 "" H 6950 3050 60  0001 C CNN
	1    6950 3050
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR038
U 1 1 547211F5
P 7600 3550
F 0 "#PWR038" H 7690 3530 30  0001 C CNN
F 1 "GND" H 7600 3470 30  0001 C CNN
F 2 "" H 7600 3550 60  0001 C CNN
F 3 "" H 7600 3550 60  0001 C CNN
	1    7600 3550
	-1   0    0    -1  
$EndComp
$Comp
L C C20
U 1 1 547211FB
P 7850 3300
F 0 "C20" H 7750 3200 50  0000 L CNN
F 1 "20pF" H 7750 3400 50  0000 L CNN
F 2 "CAP_0603" V 7950 3150 28  0000 C BNN
F 3 "" H 7850 3300 60  0001 C CNN
	1    7850 3300
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR039
U 1 1 54721201
P 7850 3550
F 0 "#PWR039" H 7940 3530 30  0001 C CNN
F 1 "GND" H 7850 3470 30  0001 C CNN
F 2 "" H 7850 3550 60  0001 C CNN
F 3 "" H 7850 3550 60  0001 C CNN
	1    7850 3550
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR040
U 1 1 54721207
P 7350 3550
F 0 "#PWR040" H 7440 3530 30  0001 C CNN
F 1 "GND" H 7350 3470 30  0001 C CNN
F 2 "" H 7350 3550 60  0001 C CNN
F 3 "" H 7350 3550 60  0001 C CNN
	1    7350 3550
	-1   0    0    -1  
$EndComp
$Comp
L C C17
U 1 1 5472120D
P 7350 3300
F 0 "C17" H 7250 3200 50  0000 L CNN
F 1 "20pF" H 7250 3400 50  0000 L CNN
F 2 "CAP_0603" V 7450 3150 28  0000 C BNN
F 3 "" H 7350 3300 60  0001 C CNN
	1    7350 3300
	-1   0    0    -1  
$EndComp
$Comp
L CRYSTAL_H XTAL2
U 1 1 54721213
P 7600 3050
F 0 "XTAL2" H 7550 3350 60  0000 C CNN
F 1 "12.0MHz" H 7600 3250 60  0000 C CNN
F 2 "0532" H 7625 3175 39  0000 C CNN
F 3 "" H 7600 3050 60  0001 C CNN
	1    7600 3050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6450 2950 7850 2950
Wire Wire Line
	6700 3050 6450 3050
NoConn ~ 3800 1600
NoConn ~ 3800 1800
NoConn ~ 3800 1900
NoConn ~ 3800 2000
NoConn ~ 3800 2100
NoConn ~ 3800 2200
$Comp
L NCP583SQ DA1
U 1 1 54721BD5
P 8450 10050
F 0 "DA1" H 8300 10400 60  0000 C CNN
F 1 "NCP583SQ" H 8450 10300 60  0000 C CNN
F 2 "" H 8450 10050 60  0001 C CNN
F 3 "" H 8450 10050 60  0001 C CNN
	1    8450 10050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR041
U 1 1 54721BDB
P 9350 9950
F 0 "#PWR041" H 9350 9910 30  0001 C CNN
F 1 "+3.3V" H 9430 9980 30  0000 C CNN
F 2 "" H 9350 9950 60  0001 C CNN
F 3 "" H 9350 9950 60  0001 C CNN
	1    9350 9950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR042
U 1 1 54721BE1
P 8850 10500
F 0 "#PWR042" H 8940 10480 30  0001 C CNN
F 1 "GND" H 8850 10420 30  0001 C CNN
F 2 "" H 8850 10500 60  0001 C CNN
F 3 "" H 8850 10500 60  0001 C CNN
	1    8850 10500
	1    0    0    -1  
$EndComp
Text Notes 7700 9250 0    60   ~ 0
3.3V 150mA power regulator
$Comp
L GND #PWR043
U 1 1 54721BE8
P 7550 10500
F 0 "#PWR043" H 7640 10480 30  0001 C CNN
F 1 "GND" H 7550 10420 30  0001 C CNN
F 2 "" H 7550 10500 60  0001 C CNN
F 3 "" H 7550 10500 60  0001 C CNN
	1    7550 10500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR044
U 1 1 54721BEE
P 9050 10500
F 0 "#PWR044" H 9140 10480 30  0001 C CNN
F 1 "GND" H 9050 10420 30  0001 C CNN
F 2 "" H 9050 10500 60  0001 C CNN
F 3 "" H 9050 10500 60  0001 C CNN
	1    9050 10500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR045
U 1 1 54721BFA
P 7200 9950
F 0 "#PWR045" H 7200 9910 30  0001 C CNN
F 1 "+5V" H 7280 9980 30  0000 C CNN
F 2 "~" H 7200 9950 60  0000 C CNN
F 3 "~" H 7200 9950 60  0000 C CNN
	1    7200 9950
	-1   0    0    -1  
$EndComp
$Comp
L C C19
U 1 1 54721C00
P 7550 10250
F 0 "C19" H 7450 10150 50  0000 L CNN
F 1 "1u" H 7450 10350 50  0000 L CNN
F 2 "CAP_0603" V 7650 10100 28  0000 C BNN
F 3 "~" H 7550 10250 60  0000 C CNN
	1    7550 10250
	1    0    0    -1  
$EndComp
$Comp
L C C21
U 1 1 54721C06
P 9050 10250
F 0 "C21" H 8950 10150 50  0000 L CNN
F 1 "1u" H 8950 10350 50  0000 L CNN
F 2 "CAP_0603" V 9150 10100 28  0000 C BNN
F 3 "~" H 9050 10250 60  0000 C CNN
	1    9050 10250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 9950 9350 9950
Connection ~ 9050 9950
Wire Wire Line
	9050 10050 9050 9950
Connection ~ 7550 9950
Wire Wire Line
	8850 10150 8850 10500
Wire Wire Line
	9050 10450 9050 10500
Wire Wire Line
	7550 10450 7550 10500
Wire Wire Line
	7200 9950 8050 9950
Wire Wire Line
	8050 10150 8000 10150
Wire Wire Line
	8000 10150 8000 9950
Connection ~ 8000 9950
Text Label 1500 10300 2    60   ~ 0
LED1
Text Label 1500 10800 2    60   ~ 0
LED2
Wire Wire Line
	1500 10300 1700 10300
Wire Wire Line
	1700 10800 1500 10800
$Comp
L LED D1
U 1 1 54721D6E
P 2500 10300
F 0 "D1" H 2600 10440 50  0000 C CNN
F 1 "LED" H 2420 10440 50  0000 C CNN
F 2 "~" H 2500 10300 60  0000 C CNN
F 3 "~" H 2500 10300 60  0000 C CNN
	1    2500 10300
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 54721D7D
P 2500 10800
F 0 "D2" H 2600 10940 50  0000 C CNN
F 1 "LED" H 2420 10940 50  0000 C CNN
F 2 "~" H 2500 10800 60  0000 C CNN
F 3 "~" H 2500 10800 60  0000 C CNN
	1    2500 10800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR046
U 1 1 54721D8A
P 2850 10800
F 0 "#PWR046" H 2940 10780 30  0001 C CNN
F 1 "GND" H 2850 10720 30  0001 C CNN
F 2 "" H 2850 10800 60  0001 C CNN
F 3 "" H 2850 10800 60  0001 C CNN
	1    2850 10800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2200 10300 2300 10300
Wire Wire Line
	2200 10800 2300 10800
Wire Wire Line
	2700 10300 2850 10300
Wire Wire Line
	2700 10800 2850 10800
Text Notes 1300 7900 0    60   ~ 0
USB
Text Label 2050 8450 0    60   ~ 0
USB_DP
Text Label 2050 8350 0    60   ~ 0
USB_DM
$Comp
L GND #PWR047
U 1 1 5472291D
P 1900 9050
F 0 "#PWR047" H 1990 9030 30  0001 C CNN
F 1 "GND" H 1900 8970 30  0001 C CNN
F 2 "" H 1900 9050 60  0001 C CNN
F 3 "" H 1900 9050 60  0001 C CNN
	1    1900 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 8550 1900 8550
Wire Wire Line
	1900 8550 1900 9050
Wire Wire Line
	1800 8350 2050 8350
Wire Wire Line
	1800 8250 2750 8250
Wire Wire Line
	1800 8450 2050 8450
Text Label 6700 2500 0    60   ~ 0
USB_DP
Text Label 6700 2400 0    60   ~ 0
USB_DM
Wire Wire Line
	6450 2400 6700 2400
Wire Wire Line
	6450 2500 6700 2500
$Comp
L +5V #PWR049
U 1 1 54722946
P 2750 8250
F 0 "#PWR049" H 2750 8210 30  0001 C CNN
F 1 "+5V" H 2830 8280 30  0000 C CNN
F 2 "~" H 2750 8250 60  0000 C CNN
F 3 "~" H 2750 8250 60  0000 C CNN
	1    2750 8250
	1    0    0    -1  
$EndComp
$Comp
L USB_A XL3
U 1 1 54722A91
P 1600 8450
F 0 "XL3" H 1400 8900 60  0000 C CNN
F 1 "USB_A" H 1500 8800 60  0000 C CNN
F 2 "~" H 1600 8450 60  0000 C CNN
F 3 "~" H 1600 8450 60  0000 C CNN
	1    1600 8450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR050
U 1 1 54722A9E
P 1450 9050
F 0 "#PWR050" H 1540 9030 30  0001 C CNN
F 1 "GND" H 1450 8970 30  0001 C CNN
F 2 "" H 1450 9050 60  0001 C CNN
F 3 "" H 1450 9050 60  0001 C CNN
	1    1450 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 8850 1450 9050
NoConn ~ 6450 1300
Wire Wire Line
	7550 10050 7550 9950
NoConn ~ 6450 3200
NoConn ~ 6450 3300
NoConn ~ 6450 3400
$EndSCHEMATC
