# LION-Live Block Mutation of CPS Models for Detecting Simulink Compiler Bugs

We are investigating automated _Equivalence Modulo Input (EMI)_-based testing of commercial cyber-physical system development tool chains (e.g. MATLAB/Simulink). We present following three independant tools in this repository:

- [Rapid Experimentation Framework](+covexp/)
- [Mutant Generator](+emi/)
- [Differential Tester](+difftest/)

## Recent News

Our SLEMI paper has been accepted at the prestigious 42th International Conference on Software Engineering (ICSE 2020, CORE: A*, acceptance rate: 20.3%)! 

- [ICSE 2020 Data and Bugs](notes/icse/)

## Requirements

MATLAB R2018a with default Simulink toolboxes

## Installation

Please use `git` to properly install all third-party dependencies:

    git clone <REPO URL>
    cd <REPO>
    git submodule update --init
    matlab # Opens MATLAB

## Hello, World!

[Check out](notes/icse/) tutorials to get started!

## Randomly Generated Seed Models

We use the open source *SLforge* tool to generate valid Simulink models. 
Although we initially forked from the project, our current version is independant of SLforge and its predecessor CyFuzz

### SLforge: Automatically Finding Bugs in a Commercial Cyber-Physical Systems Development Tool

Check out [SLforge homepage](https://github.com/verivital/slsf_randgen/wiki) for latest news, running the tools and to contribute.


## Acknowledgement 


