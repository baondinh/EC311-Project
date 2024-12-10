# EC311-Project 
# Tilt Encoder
### Yuxuan Chen, Phyliss Darko, Bao Dinh, Kelsey Sweeney

## Link to Project Demo Video



## Overview of the Project
This project involves using switch inputs to write letters onto a screen and tilt inputs from an accelerometer to select the location of the lettering. The system integrates an accelerometer and VGA display to provide interactive feedback and visualization.


## How to Run Project
1. Connect the Nexys A7 FPGA to your computer.
2. Program the FPGA using the provided bitstream file.
3. Use the 6 switch inputs to write letters onto the VGA screen.
4. Tilt the FPGA board to adjust the location of the letters using accelerometer input.





## Overview of the code structure (what code does what and any important notes)
| Module Name | Description | Important Notes |
| ------------|-------------|-----------------|

vga_top  The top-level module that integrates all components.  Handles VGA output, SPI interface, and tilt detection logic.

clk_divide  Divides the input clock from 100MHz to 25MHz for VGA synchronization.  Ensures timing compatibility with VGA display and sequential logic.


accelerometer_SPI   Use SPI bus to communication with the ADXL362 accelerometer.  Processes raw accelerometer data and decode it into a 2 bits tilt values.The first bit is sign bit of the axis, the second bit is determined by magitude.
* comment on directionality of FPGA tilts


debouncer  Debounces push-button inputs to prevent repeating noise signals.  Used for stable en and del logic signals.


letter_decoder  Decodes switch inputs and tilt data into letters and positions on the screen.  Hardcoded letter output and updates display position based on tilt.



vga_controller   Manages VGA timing and pixel rendering for the screen display.  Handles the drawing of letters and background color logic.

## Accelerometer Tilt Detection
The tilt detection logic determines the direction and magnitude of tilt based on accelerometer data. The tilt information is used to update the position of the letters dynamically on the VGA screen.

## Sources and Citations
FPGADude - Accelerometer SPI Master and Top module
https://www.youtube.com/watch?v=7b3YwQWwvXM
https://github.com/FPGADude/Digital-Design/tree/main/FPGA%20Projects/Nexys%20A7%203-Axis%20Accelerometer%20SPI

FPGADude - ASCII ROM
ASCII ROM code provided 


Project F
Modeled code that magnified smaller bitmap off of "Racing the Beam" project
https://projectf.io/posts/racing-the-beam/


## Anything else you feel is relevant


## Main Components: 
- Nexys A7 FPGA
  - https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual?srsltid=AfmBOooTf9fmbBJXkkVbX3Q9yLxFQurI2v2I_xBizHjNdD6rqfFJyH4J 
- Accelerometer (ADXL362)
  - https://www.analog.com/en/products/adxl362.html#part-details
 

Google Doc: https://docs.google.com/document/d/1mrcgrb-qavMLpFS8MXbVEAYGh_ys5Jjrv_TpArgGm4I/edit?usp=sharing
