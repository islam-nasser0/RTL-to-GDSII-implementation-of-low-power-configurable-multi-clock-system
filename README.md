# RTL-to-GDSII-implementation-of-low-power-configurable-multi-clock-system


# work flow :

 ## I write the RTL in Verilog , 
 ## simulate on modelSim througn testbench to check the functionality 
 ## then go ASIC Flow

# Technology node: 130nm


## the block diagram for all the system 

![system](https://user-images.githubusercontent.com/111699435/209229222-9930fb92-f732-47b5-abad-f26a671a6741.PNG)

### CAD Tools used in ASIC : 

Synopsis design compiler, 
Formality, 
DFT compiler, 
INNOVUS (Cadence), 
TCL.
 

### ASIC Phases: 

-Set constrains to the design (system clock at 50Mhz and UART clock at 912khz)

![image](https://github.com/islam-nasser0/RTL-to-GDSII-implementation-of-low-power-configurable-multi-clock-system/assets/111699435/4e4ff8d0-f0b2-4a34-8a0c-555c93b411fa)

-Run synthesis (no setup violation, hold can fix in CTS)

![image](https://github.com/islam-nasser0/RTL-to-GDSII-implementation-of-low-power-configurable-multi-clock-system/assets/111699435/cad3bd2c-4d25-47a7-bbf5-78aa498e6e00)

-Run Formal verification (netlist same RTL)

![image](https://github.com/islam-nasser0/RTL-to-GDSII-implementation-of-low-power-configurable-multi-clock-system/assets/111699435/f9ea9758-a754-4acd-9e8d-058cbe5f766f)


-Run DFT (edit RTL to add scan mode)

-Run floor planning and power mesh (check DRCs)

![image](https://github.com/islam-nasser0/RTL-to-GDSII-implementation-of-low-power-configurable-multi-clock-system/assets/111699435/259e1f97-84e6-4f93-a2bc-b0ac36d5061e)


-Run placement (Coarse and detailed), build CTS (fix all hold violations)

![image](https://github.com/islam-nasser0/RTL-to-GDSII-implementation-of-low-power-configurable-multi-clock-system/assets/111699435/303a018f-0647-42a9-8e2f-32e0570bf2ba)

-Run global and detailed routing and STA to close the timing then DRCs

![image](https://github.com/islam-nasser0/RTL-to-GDSII-implementation-of-low-power-configurable-multi-clock-system/assets/111699435/96e4758d-24e6-46f2-a019-f8384589f6e6)


