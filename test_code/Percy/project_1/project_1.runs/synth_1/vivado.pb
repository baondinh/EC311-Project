
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental X:/EC311-Project/test_code/Percy/project_1/project_1.srcs/utils_1/imports/synth_1/acctop_module.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2e
cX:/EC311-Project/test_code/Percy/project_1/project_1.srcs/utils_1/imports/synth_1/acctop_module.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
i
Command: %s
53*	vivadotcl28
6synth_design -top acctop_module -part xc7a100tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7a100tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7a100tZ17-349h px� 
E
Loading part %s157*device2
xc7a100tcsg324-1Z21-403h px� 
[
$Part: %s does not have CEAM library.966*device2
xc7a100tcsg324-1Z21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
33260Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 1499.957 ; gain = 448.199
h px� 
�
synthesizing module '%s'%s4497*oasys2
acctop_module2
 2c
_X:/EC311-Project/test_code/Percy/SundayProject/SundayProject.srcs/sources_1/new/acctop_module.v2
238@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
accelerometer2
 2@
<X:/EC311-Project/test_code/Bao/accelerometer/accelerometer.v2
458@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys2@
<X:/EC311-Project/test_code/Bao/accelerometer/accelerometer.v2
1988@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
accelerometer2
 2
02
12@
<X:/EC311-Project/test_code/Bao/accelerometer/accelerometer.v2
458@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
acl_data_decoder2
 2f
bX:/EC311-Project/test_code/Percy/SundayProject/SundayProject.srcs/sources_1/new/acl_data_decoder.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
acl_data_decoder2
 2
02
12f
bX:/EC311-Project/test_code/Percy/SundayProject/SundayProject.srcs/sources_1/new/acl_data_decoder.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
acctop_module2
 2
02
12c
_X:/EC311-Project/test_code/Percy/SundayProject/SundayProject.srcs/sources_1/new/acctop_module.v2
238@Z8-6155h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
acl_data[14]2
acl_data_decoderZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
acl_data[13]2
acl_data_decoderZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
acl_data[12]2
acl_data_decoderZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
acl_data[11]2
acl_data_decoderZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
acl_data[10]2
acl_data_decoderZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
acl_data[4]2
acl_data_decoderZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
acl_data[3]2
acl_data_decoderZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
acl_data[2]2
acl_data_decoderZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
acl_data[1]2
acl_data_decoderZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
acl_data[0]2
acl_data_decoderZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 1617.777 ; gain = 566.020
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 1617.777 ; gain = 566.020
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 1617.777 ; gain = 566.020
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0092

1617.7772
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2H
DX:/EC311-Project/test_code/Bao/accelerometer/const_accelerometer.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2H
DX:/EC311-Project/test_code/Bao/accelerometer/const_accelerometer.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2F
DX:/EC311-Project/test_code/Bao/accelerometer/const_accelerometer.xdc2!
.Xil/acctop_module_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1693.3482
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0092

1693.3482
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7a100tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
u
3inferred FSM for state register '%s' in module '%s'802*oasys2
state_reg_reg2
accelerometerZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                POWER_UP |                          0000000 |                          0000000
h p
x
� 
y
%s
*synth2a
_              BEGIN_SPIW |                          0000001 |                          0000001
h p
x
� 
y
%s
*synth2a
_              SEND_WCMD7 |                          0000010 |                          0000010
h p
x
� 
y
%s
*synth2a
_              SEND_WCMD6 |                          0000011 |                          0000011
h p
x
� 
y
%s
*synth2a
_              SEND_WCMD5 |                          0000100 |                          0000100
h p
x
� 
y
%s
*synth2a
_              SEND_WCMD4 |                          0000101 |                          0000101
h p
x
� 
y
%s
*synth2a
_              SEND_WCMD3 |                          0000110 |                          0000110
h p
x
� 
y
%s
*synth2a
_              SEND_WCMD2 |                          0000111 |                          0000111
h p
x
� 
y
%s
*synth2a
_              SEND_WCMD1 |                          0001000 |                          0001000
h p
x
� 
y
%s
*synth2a
_              SEND_WCMD0 |                          0001001 |                          0001001
h p
x
� 
y
%s
*synth2a
_             SEND_WADDR7 |                          0001010 |                          0001010
h p
x
� 
y
%s
*synth2a
_             SEND_WADDR6 |                          0001011 |                          0001011
h p
x
� 
y
%s
*synth2a
_             SEND_WADDR5 |                          0001100 |                          0001100
h p
x
� 
y
%s
*synth2a
_             SEND_WADDR4 |                          0001101 |                          0001101
h p
x
� 
y
%s
*synth2a
_             SEND_WADDR3 |                          0001110 |                          0001110
h p
x
� 
y
%s
*synth2a
_             SEND_WADDR2 |                          0001111 |                          0001111
h p
x
� 
y
%s
*synth2a
_             SEND_WADDR1 |                          0010000 |                          0010000
h p
x
� 
y
%s
*synth2a
_             SEND_WADDR0 |                          0010001 |                          0010001
h p
x
� 
y
%s
*synth2a
_              SEND_BYTE7 |                          0010010 |                          0010010
h p
x
� 
y
%s
*synth2a
_              SEND_BYTE6 |                          0010011 |                          0010011
h p
x
� 
y
%s
*synth2a
_              SEND_BYTE5 |                          0010100 |                          0010100
h p
x
� 
y
%s
*synth2a
_              SEND_BYTE4 |                          0010101 |                          0010101
h p
x
� 
y
%s
*synth2a
_              SEND_BYTE3 |                          0010110 |                          0010110
h p
x
� 
y
%s
*synth2a
_              SEND_BYTE2 |                          0010111 |                          0010111
h p
x
� 
y
%s
*synth2a
_              SEND_BYTE1 |                          0011000 |                          0011000
h p
x
� 
y
%s
*synth2a
_              SEND_BYTE0 |                          0011001 |                          0011001
h p
x
� 
y
%s
*synth2a
_                    WAIT |                          0011010 |                          0011010
h p
x
� 
y
%s
*synth2a
_              BEGIN_SPIR |                          0011011 |                          0011011
h p
x
� 
y
%s
*synth2a
_              SEND_RCMD7 |                          0011100 |                          0011100
h p
x
� 
y
%s
*synth2a
_              SEND_RCMD6 |                          0011101 |                          0011101
h p
x
� 
y
%s
*synth2a
_              SEND_RCMD5 |                          0011110 |                          0011110
h p
x
� 
y
%s
*synth2a
_              SEND_RCMD4 |                          0011111 |                          0011111
h p
x
� 
y
%s
*synth2a
_              SEND_RCMD3 |                          0100000 |                          0100000
h p
x
� 
y
%s
*synth2a
_              SEND_RCMD2 |                          0100001 |                          0100001
h p
x
� 
y
%s
*synth2a
_              SEND_RCMD1 |                          0100010 |                          0100010
h p
x
� 
y
%s
*synth2a
_              SEND_RCMD0 |                          0100011 |                          0100011
h p
x
� 
y
%s
*synth2a
_             SEND_RADDR7 |                          0100100 |                          0100100
h p
x
� 
y
%s
*synth2a
_             SEND_RADDR6 |                          0100101 |                          0100101
h p
x
� 
y
%s
*synth2a
_             SEND_RADDR5 |                          0100110 |                          0100110
h p
x
� 
y
%s
*synth2a
_             SEND_RADDR4 |                          0100111 |                          0100111
h p
x
� 
y
%s
*synth2a
_             SEND_RADDR3 |                          0101000 |                          0101000
h p
x
� 
y
%s
*synth2a
_             SEND_RADDR2 |                          0101001 |                          0101001
h p
x
� 
y
%s
*synth2a
_             SEND_RADDR1 |                          0101010 |                          0101010
h p
x
� 
y
%s
*synth2a
_             SEND_RADDR0 |                          0101011 |                          0101011
h p
x
� 
y
%s
*synth2a
_               REC_XLSB7 |                          0101100 |                          0101100
h p
x
� 
y
%s
*synth2a
_               REC_XLSB6 |                          0101101 |                          0101101
h p
x
� 
y
%s
*synth2a
_               REC_XLSB5 |                          0101110 |                          0101110
h p
x
� 
y
%s
*synth2a
_               REC_XLSB4 |                          0101111 |                          0101111
h p
x
� 
y
%s
*synth2a
_               REC_XLSB3 |                          0110000 |                          0110000
h p
x
� 
y
%s
*synth2a
_               REC_XLSB2 |                          0110001 |                          0110001
h p
x
� 
y
%s
*synth2a
_               REC_XLSB1 |                          0110010 |                          0110010
h p
x
� 
y
%s
*synth2a
_               REC_XLSB0 |                          0110011 |                          0110011
h p
x
� 
y
%s
*synth2a
_               REC_XMSB7 |                          0110100 |                          0110100
h p
x
� 
y
%s
*synth2a
_               REC_XMSB6 |                          0110101 |                          0110101
h p
x
� 
y
%s
*synth2a
_               REC_XMSB5 |                          0110110 |                          0110110
h p
x
� 
y
%s
*synth2a
_               REC_XMSB4 |                          0110111 |                          0110111
h p
x
� 
y
%s
*synth2a
_               REC_XMSB3 |                          0111000 |                          0111000
h p
x
� 
y
%s
*synth2a
_               REC_XMSB2 |                          0111001 |                          0111001
h p
x
� 
y
%s
*synth2a
_               REC_XMSB1 |                          0111010 |                          0111010
h p
x
� 
y
%s
*synth2a
_               REC_XMSB0 |                          0111011 |                          0111011
h p
x
� 
y
%s
*synth2a
_               REC_YLSB7 |                          0111100 |                          0111100
h p
x
� 
y
%s
*synth2a
_               REC_YLSB6 |                          0111101 |                          0111101
h p
x
� 
y
%s
*synth2a
_               REC_YLSB5 |                          0111110 |                          0111110
h p
x
� 
y
%s
*synth2a
_               REC_YLSB4 |                          0111111 |                          0111111
h p
x
� 
y
%s
*synth2a
_               REC_YLSB3 |                          1000000 |                          1000000
h p
x
� 
y
%s
*synth2a
_               REC_YLSB2 |                          1000001 |                          1000001
h p
x
� 
y
%s
*synth2a
_               REC_YLSB1 |                          1000010 |                          1000010
h p
x
� 
y
%s
*synth2a
_               REC_YLSB0 |                          1000011 |                          1000011
h p
x
� 
y
%s
*synth2a
_               REC_YMSB7 |                          1000100 |                          1000100
h p
x
� 
y
%s
*synth2a
_               REC_YMSB6 |                          1000101 |                          1000101
h p
x
� 
y
%s
*synth2a
_               REC_YMSB5 |                          1000110 |                          1000110
h p
x
� 
y
%s
*synth2a
_               REC_YMSB4 |                          1000111 |                          1000111
h p
x
� 
y
%s
*synth2a
_               REC_YMSB3 |                          1001000 |                          1001000
h p
x
� 
y
%s
*synth2a
_               REC_YMSB2 |                          1001001 |                          1001001
h p
x
� 
y
%s
*synth2a
_               REC_YMSB1 |                          1001010 |                          1001010
h p
x
� 
y
%s
*synth2a
_               REC_YMSB0 |                          1001011 |                          1001011
h p
x
� 
y
%s
*synth2a
_               REC_ZLSB7 |                          1001100 |                          1001100
h p
x
� 
y
%s
*synth2a
_               REC_ZLSB6 |                          1001101 |                          1001101
h p
x
� 
y
%s
*synth2a
_               REC_ZLSB5 |                          1001110 |                          1001110
h p
x
� 
y
%s
*synth2a
_               REC_ZLSB4 |                          1001111 |                          1001111
h p
x
� 
y
%s
*synth2a
_               REC_ZLSB3 |                          1010000 |                          1010000
h p
x
� 
y
%s
*synth2a
_               REC_ZLSB2 |                          1010001 |                          1010001
h p
x
� 
y
%s
*synth2a
_               REC_ZLSB1 |                          1010010 |                          1010010
h p
x
� 
y
%s
*synth2a
_               REC_ZLSB0 |                          1010011 |                          1010011
h p
x
� 
y
%s
*synth2a
_               REC_ZMSB7 |                          1010100 |                          1010100
h p
x
� 
y
%s
*synth2a
_               REC_ZMSB6 |                          1010101 |                          1010101
h p
x
� 
y
%s
*synth2a
_               REC_ZMSB5 |                          1010110 |                          1010110
h p
x
� 
y
%s
*synth2a
_               REC_ZMSB4 |                          1010111 |                          1010111
h p
x
� 
y
%s
*synth2a
_               REC_ZMSB3 |                          1011000 |                          1011000
h p
x
� 
y
%s
*synth2a
_               REC_ZMSB2 |                          1011001 |                          1011001
h p
x
� 
y
%s
*synth2a
_               REC_ZMSB1 |                          1011010 |                          1011010
h p
x
� 
y
%s
*synth2a
_               REC_ZMSB0 |                          1011011 |                          1011011
h p
x
� 
y
%s
*synth2a
_                 END_SPI |                          1011100 |                          1011100
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
state_reg_reg2

sequential2
accelerometerZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:11 ; elapsed = 00:00:15 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit       Adders := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	               15 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 5     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	  93 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  93 Input   16 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	  93 Input    7 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  93 Input    1 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 2     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:16 ; elapsed = 00:00:22 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:20 ; elapsed = 00:00:26 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:26 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:20 ; elapsed = 00:00:26 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:23 ; elapsed = 00:00:29 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:23 ; elapsed = 00:00:29 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:23 ; elapsed = 00:00:29 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:23 ; elapsed = 00:00:29 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:23 ; elapsed = 00:00:29 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:23 ; elapsed = 00:00:29 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |BUFG   |     1|
h px� 
2
%s*synth2
|2     |CARRY4 |     8|
h px� 
2
%s*synth2
|3     |LUT1   |     1|
h px� 
2
%s*synth2
|4     |LUT2   |    19|
h px� 
2
%s*synth2
|5     |LUT3   |     6|
h px� 
2
%s*synth2
|6     |LUT4   |    18|
h px� 
2
%s*synth2
|7     |LUT5   |    16|
h px� 
2
%s*synth2
|8     |LUT6   |    63|
h px� 
2
%s*synth2
|9     |FDRE   |    48|
h px� 
2
%s*synth2
|10    |IBUF   |     2|
h px� 
2
%s*synth2
|11    |OBUF   |     5|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:23 ; elapsed = 00:00:29 . Memory (MB): peak = 1693.348 ; gain = 641.590
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:18 ; elapsed = 00:00:28 . Memory (MB): peak = 1693.348 ; gain = 566.020
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:23 ; elapsed = 00:00:29 . Memory (MB): peak = 1693.348 ; gain = 641.590
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0022

1693.3482
0.000Z17-268h px� 
S
-Analyzing %s Unisim elements for replacement
17*netlist2
8Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1693.3482
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

2f22b3bcZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
312
112
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:262

00:00:332

1693.3482

1060.492Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0072

1693.3482
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2U
SX:/EC311-Project/test_code/Percy/project_1/project_1.runs/synth_1/acctop_module.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2e
creport_utilization -file acctop_module_utilization_synth.rpt -pb acctop_module_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sun Dec  8 18:43:06 2024Z17-206h px� 


End Record