# RTL-to-GDSII-implementation-of-low-power-configurable-multi-clock-system

![system](https://user-images.githubusercontent.com/111699435/209229222-9930fb92-f732-47b5-abad-f26a671a6741.PNG)
## the block diagram for all the system 

Tools: Synopsis design compiler, Formality, DFT compiler, INNOVUS (Cadence), TCL.
phases: 
-Set constrains to the design (system clock at 50Mhz and UART clock at 912khz)
-Run synthesis (no setup violation, hold can fix in CTS)
-Run Formal verification (netlist same RTL)
-Run DFT (edit RTL to add scan mode)
-Run floor planning and power mesh (check DRCs)
-Run placement (Coarse and detailed), build CTS (fix all hold violations)
-Run global and detailed routing and STA to close the timing then DRCs
Technology node: 130nm


![056591dff08a7634554127f99e6716b2](https://github.com/islam-nasser0/RTL-to-GDSII-implementation-of-low-power-configurable-multi-clock-system/assets/111699435/ec9675db-ae7a-4793-bedd-46e6f670473b)
