# Epic-Heat
An epic heating system for Computer Architecture and Operating Systems mid project

Description:

- A verilog that simulates a finate state machine for air conditioner. It will heat the temperature until the designated temperature, it will turn idle until a certain threshold and start heating again till the designated temperature. Vice versa for cooling 

# Prerequisite
Have ModelSim installed.
This will be use for simulating the machine.
```bash
https://fpgasoftware.intel.com/
```

Clone repository 
```bash
git clone https://github.com/n1c0201/epic-heat.git
cd Web-Stack
```

Instructions:

- step 1 : Open ModelSim 
- Step 2 : Create new project
- Step 3 : Add existing file, the verilog files that has been cloned (cooling_tb.v, hear_dut.v, heating_tb.v)
- step 4 : compile all
- step 5 : Start simulation 
- step 6 : open the work directory, choose one of the testbench you want (cooling_tb or heating_tb)
- step 7 : select all objects> right click> add wave
- step 8 : click run and enjoy the outputs


Notes:

- The difference between the cooling and the heating testbench are the I1(target temperature), I2(current room temperature), ambientRate(the cooling/heating of the room naturally have)
- For the ambient rate in cooling_tb, we set it to + value since the room is naturally hot. 
- For the ambient rate in heating_tb, we set it to - value since the room is naturally cold 





