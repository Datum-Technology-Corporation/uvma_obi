# About
## [Home Page](https://datum-technology-corporation.github.io/uvma_obi/)
The [Moore.io](https://www.mooreio.com) UVM Open Bus Interface (OBI) Agent is a pure-UVM, sequence-based implementation of the open standard that can act as either an active Master/Slave or purely passive monitor.
This project consists of the agent (`uvma_obi_pkg`), a small memory modeling library (`uvml_mem`), the self-testing UVM environment (`uvme_obi_st_pkg`) and the test bench (`uvmt_obi_st_pkg`) to verify the agent against itself.

## IP
* DV
> * uvma_obi
> * uvml_mem
> * uvme_obi_st
> * uvmt_obi_st
* RTL
* Tools


# Simulation
**1. Change directory to 'sim'**

This is from where all jobs will be launched.
```
cd ./sim
```

**2. Project Setup**

Only needs to be done once, or when libraries must be updated. This will pull in dependencies from the web.
```
./setup_project.py
```

**3. Terminal Setup**

This must be done per terminal. The script included in this project is for bash:

```
export VIVADO=/path/to/vivado/bin # Set locaton of Vivado installation
source ./setup_terminal.sh
```

**4. Launch**

All jobs for simulation are performed via `mio`.

> At any time, you can invoke its built-in documentation:

```
mio --help
```

> To run test 'all_access' with seed '1' and wave capture enabled:

```
clear && mio all uvmt_obi_st -t all_access -s 1 -w
```
