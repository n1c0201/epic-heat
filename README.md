# Epic-Heat
An epic heating system for Computer Architecture and Operating Systems mid exam project

<p align="center">
   <img width="300" height="300" src="https://user-images.githubusercontent.com/56817655/115108349-32250900-9f9a-11eb-93d3-794afd30ad1d.jpg">
</p>


### Description:

A verilog project that simulates a finite state machine for air conditioner. It will output commands to heat/cool the room until the designated ambient temperature. After reaching the target temperature, it will idle until a certain threshold and start heating/cooling again until the designated temperature. Vice versa for cooling 



# Prerequisite
Have ModelSim installed.
This will be use for simulating the machine.

```bash
https://fpgasoftware.intel.com/
```

Clone repository 
```bash
git clone https://github.com/n1c0201/epic-heat.git
```

Instructions:

- Step 1 : Open ModelSim 
- Step 2 : File > New > Project..
- Step 3 : Add existing file > Add all the Verilog files that has been cloned (cooling_tb.v, heat_dut.v, heating_tb.v)
- step 4 : Compile > Compile All
- step 5 : Simulation > Start simulation...
- step 6 : Open the 'work' directory and choose one of the test benches (cool_tb or heat_tb)
- step 7 : On the right select all in the new 'Objects' tab > Right click > Add wave
- step 8 : Click 'run' (in top bar, with paper and arrow going down icon) to incrementally see the result and enjoy.

Current ambient room temperature will be shown in `/*/I2` wave, and target temperature shown in `/*/I1` . If`/*/B` is HIGH, then the system is working; LOW means that the system is idling.


Notes:

- The difference between the cooling and the heating test bench are `I1`(target temperature), `I2`(current room temperature), `ambientRate`(the cooling/heating of the room naturally have)
- For the ambient rate in cooling_tb, we set it to + value since the room is naturally hot. 
- For the ambient rate in heating_tb, we set it to - value since the room is naturally cold 





