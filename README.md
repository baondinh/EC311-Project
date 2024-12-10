# EC311-Project 
# Tilt Encoder
### Yuxuan Chen, Phyliss Darko, Bao Dinh, Kelsey Sweeney

## Link to Project Demo Video



## Overview of the Project
This project involves using switch inputs to write letters onto a screen and tilt inputs from an accelerometer to select the location of the lettering. The system integrates an accelerometer and VGA display to provide interactive feedback and visualization.


## How to Run Project
1. Add all source files (vga_top.v, accelerometer_SPI.v, letter_decoder.v, etc.) to your Vivado project.
2. Set vga_top.v as the top module.
3. Program the FPGA using the provided bitstream file.
4. Use the 6 switch inputs to write letters onto the VGA screen.
5. Tilt the FPGA board to adjust the location of the letters using accelerometer input.
6. Press enable button (N17) to display character to screen
7. To delete character, press delete button (P18).
8. To reset screen, press M18.


## Overview of the code structure (what code does what and any important notes)
| Module Name        | Description                                                                 | Important Notes                                                        |
| ------------------ | --------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `vga_top`          | The top-level module that integrates all components.                        | Handles VGA output, SPI interface, and tilt detection logic.          |
| `clk_divider`      | Divides the input clock from 100MHz to 25MHz for VGA synchronization.       | Ensures timing compatibility with VGA display and sequential logic.   |
| `accelerometer_SPI`| Uses SPI bus to communicate with the ADXL362 accelerometer. Processes raw accelerometer data and decodes it into 2-bit tilt values. | The first bit is the sign bit of the axis, the second bit is determined by magnitude. |
| `debouncer`        | Debounces push-button inputs to prevent repeating noise signals.            | Used for stable `en` and `del` logic signals.                          |
| `letter_decoder`   | Decodes switch inputs and tilt data into letters and positions on the screen. | Hardcoded letter output and updates display position based on tilt.   |
| `vga_controller`   | Manages VGA timing and pixel rendering for the screen display.              | Handles the drawing of letters and background color logic.            |


## Sources and Citations
FPGADude - Accelerometer SPI Master and Top module

[Accelerometer YouTube Video](https://www.youtube.com/watch?v=7b3YwQWwvXM)

[Accelerometer GitHub](https://github.com/FPGADude/Digital-Design/tree/main/FPGA%20Projects/Nexys%20A7%203-Axis%20Accelerometer%20SPI)

FPGADude - ASCII ROM
ASCII ROM code provided 


Project F
Modeled code that magnified smaller bitmap off of "Racing the Beam" project

[Project F](https://projectf.io/posts/racing-the-beam/)



## Feature 
### Overall System Workflow management: 
Clock Generation: The clk_divider provides a 25 MHz clock for timing-sensitive modules. 
Input Handling: Button presses (en and del) are debounced. Accelerometer SPI processes input data. Switch and tilt inputs are decoded into letters.
Letter Display: The letter_decoder updates the three-letter storage (letter1, letter2, letter3) based on user input. 
Visual Output: The vga_controller uses the updated letters to render them on the display, with specific color configurations for letters and background.

### Accelerometer iInput 
The tilt detection logic determines the direction and magnitude of tilt based on accelerometer data. The tilt information is used to update the position of the letters dynamically on the VGA screen.
#### Key Component: 




### Letter Typing System 
Using the onboard switches, users can type characters and send them to the VGA screen. The switches select letters, while debounce buttons confirm the selection or delete the last input. Characters are displayed at the tilt-determined position.
#### Key Component: 
Letter Management Logic: The system maintains three letter slots (letter1, letter2, letter3), each capable of holding a single letter.The switch_input is mapped to letters using a case statement. Each 6-bit combination corresponds to a specific letter (or blank space by default). The selected letter is temporarily stored in letter_buffer.
Enable and delete signal:  The en signal triggers the addition of a new letter to the next available slot. When a letter is added, the current_position shifts to the next slot, cycling between the three available positions. A flag (flagEN) ensures only one letter is added per press. The del signal removes the letter in the slot pointed to by last_inserted_position. The last_inserted_position register keeps track of the most recently modified slot.
Reset logic: Reset Logic Clear State: Asserting the rst signal resets all letters (letter1, letter2, letter3) to a blank state (6'b111111). Position Reset: The current_position and last_inserted_position are reset to their initial values, ensuring the system starts fresh.

### VGA Display 
The VGA takes in three 6’bit encoding inputs and outputs information for the VGA display including; h_sync, v_sync and logic for when a pixel should be on or off.

### Key Component:
Enable logic: There are three sections of the screen; one for each of the letters that can be displayed. A for loop iterates over each pixel coordinate. When the current pixel coordinate is located within one of three Bitmap enable regions, the specific character that should be displayed there is stored in curr_letter_sel and the pixel is reported as on or off. 
Expanding Letter Logic:
Alphabet Bitmap: Depending on which letter is passed to the vga_controller, the 6 bit representation of that letter is matched with one of twenty-six case statements and reported to curr_letter_sel. 

## Letter Index:
| 6-bit Input | Letter | ASCII Value |
| ----------- | ------ | ----------- |
| 6'b000000   | a      | 97          |
| 6'b000001   | b      | 98          |
| 6'b000010   | c      | 99          |
| 6'b000011   | d      | 100         |
| 6'b000100   | e      | 101         |
| 6'b000101   | f      | 102         |
| 6'b000110   | g      | 103         |
| 6'b000111   | h      | 104         |
| 6'b001000   | i      | 105         |
| 6'b001001   | j      | 106         |
| 6'b001010   | k      | 107         |
| 6'b001011   | l      | 108         |
| 6'b001100   | m      | 109         |
| 6'b001101   | n      | 110         |
| 6'b001110   | o      | 111         |
| 6'b001111   | p      | 112         |
| 6'b010000   | q      | 113         |
| 6'b010001   | r      | 114         |
| 6'b010010   | s      | 115         |
| 6'b010011   | t      | 116         |
| 6'b010100   | u      | 117         |
| 6'b010101   | v      | 118         |
| 6'b010110   | w      | 119         |
| 6'b010111   | x      | 120         |
| 6'b011000   | y      | 121         |
| 6'b011001   | z      | 122         |
| Default     |  (Space)| 32          |

## Main Components: 
- Nexys A7 FPGA
  - https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual?srsltid=AfmBOooTf9fmbBJXkkVbX3Q9yLxFQurI2v2I_xBizHjNdD6rqfFJyH4J 
- Accelerometer (ADXL362)
  - https://www.analog.com/en/products/adxl362.html#part-details
 

Google Doc: https://docs.google.com/document/d/1mrcgrb-qavMLpFS8MXbVEAYGh_ys5Jjrv_TpArgGm4I/edit?usp=sharing


