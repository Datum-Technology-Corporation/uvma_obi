// Copyright 2021 Datum Technology Corporation
// Copyright 2021 Silicon Labs
// Copyright 2021 OpenHW Group
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_OBI_ST_CONSTANTS_SV__
`define __UVMT_OBI_ST_CONSTANTS_SV__


const int unsigned uvmt_obi_st_default_clk_period          =    10_000; //  10 ns (100 Mhz)
const int unsigned uvmt_obi_st_default_reset_period        =       333; // 333 ns ( ~3 Mhz)
const int unsigned uvmt_obi_st_default_startup_timeout     =   100_000; //  .1 us
const int unsigned uvmt_obi_st_default_heartbeat_period    =     2_000; //  .02 us
const int unsigned uvmt_obi_st_default_simulation_timeout  =   500_000; // .5 ms


`endif // __UVMT_OBI_ST_CONSTANTS_SV__
