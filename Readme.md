# Live Block Mutation of CPS Models for Detecting Simulink Compiler Bugs

We are investigating automated _Equivalence Modulo Input (EMI)_-based testing of commercial cyber-physical system development tool chains (e.g. MATLAB/Simulink). We present following three independant tools in this repository:

- [Rapid Experimentation Framework](+covexp/)
- [Mutant Generator](+emi/)
- [Differential Tester](+difftest/)


## Requirements

MATLAB R2021b with default Simulink toolboxes

## Installation

Please use `git` to properly install all third-party dependencies:

    git clone <REPO URL>
    cd <REPO>
    git submodule update --init
    matlab # Opens MATLAB

## Hello, World!

[Check out](notes/icse/) tutorials to get started!

## Randomly Generated Seed Models And Compare In EMI Mode

We use the open source *SLforge* tool to generate valid Simulink models. 

We use the open source *SLEMI* tool to compare Simulink models in EMI mode. 

Although we initially forked from the project, our current version is independant of SLEMI and its predecessor SLforge.

### SLforge: Automatically Finding Bugs in a Commercial Cyber-Physical Systems Development Tool

Check out [SLforge homepage](https://github.com/verivital/slsf_randgen/wiki) for latest news, running the tools and to contribute.

### SLEMI: EMI-based Validation of Cyber-Physical System Development Tool Chain

Check out [SLEMI homepage](https://github.com/shafiul/slemi/wiki) for latest news, running the tools and to contribute.



