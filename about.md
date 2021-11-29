# About the IP

> Virtual Sequences for programmable error injection and error detection will soon be commercially available from [Datum](https://datumtc.ca/).

All protocol options, along with all bus widths, are configurable in simulation via constrained-random `cfg` object handles. A sample library of `slv` 'Handler' Virtual Sequences are provided to demonstrate how the Moore.io UVM OBI Agent can easily operate as an 'Active `slv`' and reproduce just about any business logic.

In addition, it can operate in 'Transport' mode where the Virtual Sequencer receives Sequence Items from an upstream Sequencer. On the flip side, it can operate in `bypass` mode, where the Virtual Interface (`vif`) is ignored and the Agent can be used to drive another Agent which is in 'Transport' mode.

[![Block Diagram](assets/img/agent_block_diagram.svg)](assets/img/agent_block_diagram.svg)
