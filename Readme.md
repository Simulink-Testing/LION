# Live Block Mutation of CPS Models for Detecting Simulink Compiler Bugs

We are investigating live block mutation of commercial cyber-physical system development tool chains (e.g. MATLAB/Simulink). We present following three independant tools in this repository:

- [CPS Profiling](+covexp/)
- [CPS Mutation](+NewMutator/)
- [Differential Testing](+difftest/)


## Requirements

MATLAB R2021b with default Simulink toolboxes

## Installation

Please use `git` to properly install all third-party dependencies:

    git clone <REPO URL>
    cd <REPO>
    git submodule update --init
    matlab # Opens MATLAB

## Hello, World!
### CPS Profiling  
First, you need to put the available SLforge model into the reproduce folder and enter the following statement on the MATLAB command line   
    setenv('SLSFCORPUS','<YOUR LION PROJECT URL>/reproduce')
    setenv('COVEXPEXPLORE','<YOUR LION PROJECT URL>//reproduce')   
Before the official profiling, you can modify the parameters according to your own needs in the covcfg.m file,then use command:   
    covexp.covcollect()
To Profiling the CPS.
### CPS Mutation 
The details of variant generation are set in the +emi/cfg.m file. After setting, use the
    emi.go() 
statement to generate variants
### Differential Testing 
Use 
    emi.report 
to view the EMI differential test results of the variant model and the original model.
If you need to check out the mutation in EMI different mode result , use
    accfinddiff
and wait for the result in folder <YOUR LION PROJECT URL>/bugsave
    

## Randomly Generated Seed Models And Compare In EMI Mode

We use the open source *SLforge* tool to generate valid Simulink models. 

We use the open source *SLEMI* tool to compare Simulink models in EMI mode. 

Although we initially forked from the project, our current version is independant of SLEMI and its predecessor SLforge.

### SLforge: Automatically Finding Bugs in a Commercial Cyber-Physical Systems Development Tool

Check out [SLforge homepage](https://github.com/verivital/slsf_randgen/wiki) for latest news, running the tools and to contribute.

### SLEMI: EMI-based Validation of Cyber-Physical System Development Tool Chain

Check out [SLEMI homepage](https://github.com/shafiul/slemi/wiki) for latest news, running the tools and to contribute.



