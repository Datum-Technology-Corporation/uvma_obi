# Home Page

## [Get Latest Release](https://mooreio.com/packages/uvma_obi.tgz)
### [View Documentation online](https://mooreio.com/packages/uvma_obi/dox_out/)

----------------

## About
The [Moore.io](https://www.mooreio.com) UVM [Open Bus Interface (OBI)](https://github.com/openhwgroup/core-v-docs/tree/master/cores/obi) Agent is a pure-UVM, [sequence-based implementation](https://www.linkedin.com/pulse/advanced-uvm-brian-hunter/) of the open standard that can act as either an active `mstr`/`slv` or as a purely passive Monitor. 

> Sequences for programmable error injection and error detection extensions to the stock Monitor Virtual Sequences will soon be commercially available from [Datum](https://datumtc.ca/).

These features, along with all bus widths, are configurable in simulation via constrained-random `cfg` object handles. A sample library of `slv` 'Handler' Virtual Sequences are provided to demonstrate how the Moore.io UVM OBI Agent can easily operate as an 'Active `slv`' and reproduce just about any business logic.

In addition, it can operate in 'Transport' mode where the Virtual Sequencer receives sequence items from an upstream Sequencer. On the flip side, it an operate in `bypass` mode, where the Virtual Interface (`vif`) is ignored and the Agent can be used to drive another Agent in 'Transport' mode.

This project consists of the agent (`uvma_obi_pkg`), the UVM Memory Model (`uvml_mem`), the self-testing UVM environment (`uvme_obi_st_pkg`) and the test bench (`uvmt_obi_st_pkg`) to verify the agent against itself.


## Management

| **[Issues](https://github.com/Datum-Technology-Corporation/uvma_obi/issues)** | **[Discussions](https://github.com/Datum-Technology-Corporation/uvma_obi/discussions)** |
| **[Sub-Projects](https://github.com/Datum-Technology-Corporation/uvma_obi/projects)** | **[Wiki](https://github.com/Datum-Technology-Corporation/uvma_obi/wiki)** |


## Downloads

| Latest Release (v1.0 Beta 0) | Stable (Nightly) | Stable (Weekly) |
| --------------------- | ---------------- | --------------- |
| [Source Code](https://mooreio.com/packages/uvma_obi.tgz) | Source Code (Coming Soon) | Source Code (Coming Soon) |
| [Documentation](https://mooreio.com/packages/uvma_obi/dox_out/) | Documentation (Coming Soon) | Documentation (Coming Soon) |

> **View All Releases (Coming Soon)**



## Metrics

| Latest Release (v1.0 Beta 0) | Stable (Nightly) | Stable (Weekly) |
| --------------------- | ---------------- | --------------- |
| Functional Coverage Report (Coming Soon) | Functional Coverage Report (Coming Soon) | Functional Coverage Report (Coming Soon) |
| [Release Regression Test Report](https://mooreio.com/packages/uvma_obi/sim/results.html) | Regression Test Report (Coming Soon) | Regression Test Report (Coming Soon) |


----------------


## News
### 2021/10/22 - Hello, World!
The Moore.io Core Libraries are being brought online for the very first time. Watch this space in the near future!
