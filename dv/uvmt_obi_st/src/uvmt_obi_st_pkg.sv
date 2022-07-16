// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_OBI_ST_PKG_SV__
`define __UVMT_OBI_ST_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvml_ral_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvma_obi_macros.svh"
`include "uvme_obi_st_macros.svh"
`include "uvmt_obi_st_macros.svh"

// Time units and precision for this test bench
timeunit       1ns;
timeprecision  1ps;

// Interface(s)
`include "uvmt_obi_st_clknrst_gen_if.sv"


/**
 * Encapsulates all the types and test cases for self-testing the Open Bus Interface (OBI) UVM Agent.
 */
package uvmt_obi_st_pkg;

   import uvm_pkg        ::*;
   import uvml_pkg       ::*;
   import uvml_logs_pkg  ::*;
   import uvml_ral_pkg   ::*;
   import uvml_sb_pkg    ::*;
   import uvma_obi_pkg   ::*;
   import uvme_obi_st_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_obi_st_tdefs.sv"
   `include "uvmt_obi_st_constants.sv"

   // Virtual sequence library
   `include "uvmt_obi_st_vseq_lib.sv"

   // Base test
   `include "uvmt_obi_st_test_cfg.sv"
   `include "uvmt_obi_st_base_test.sv"

   // Tests
   `include "uvmt_obi_st_reads_test.sv"
   `include "uvmt_obi_st_writes_test.sv"
   `include "uvmt_obi_st_all_access_test.sv"
   `include "uvmt_obi_st_print_test.sv"

endpackage : uvmt_obi_st_pkg


// Module(s) / Checker(s)
`include "uvmt_obi_st_dut_wrap.sv"
`include "uvmt_obi_st_dut_chkr.sv"
`include "uvmt_obi_st_tb.sv"


`endif // __UVMT_OBI_ST_PKG_SV__
