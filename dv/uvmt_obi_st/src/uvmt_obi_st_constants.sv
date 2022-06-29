// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_OBI_ST_CONSTANTS_SV__
`define __UVMT_OBI_ST_CONSTANTS_SV__


const int unsigned uvmt_obi_st_default_clk_period          =    10_000; //  10 ns (100 Mhz)
const int unsigned uvmt_obi_st_default_reset_period        =       333; // 333 ns ( ~3 Mhz)
const int unsigned uvmt_obi_st_default_startup_timeout     =   100_000; //  .1 us
const int unsigned uvmt_obi_st_default_heartbeat_period    =     2_000; //  .02 us
const int unsigned uvmt_obi_st_default_simulation_timeout  =   500_000; // .5 ms


`endif // __UVMT_OBI_ST_CONSTANTS_SV__
