// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_OBI_ST_PKG_SV__
`define __UVME_OBI_ST_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvma_obi_macros.svh"
`include "uvme_obi_st_macros.svh"

// Interface(s) / Module(s) / Checker(s)
`ifdef UVME_OBI_ST_INC_CHKR
`include "uvme_obi_st_chkr.sv"
`endif


 /**
 * Encapsulates all the types needed for the Moore.io UVM environment capable of self-testing the Open Bus Interface
 * (OBI) UVM Agent.
 */
package uvme_obi_st_pkg;

   import uvm_pkg      ::*;
   import uvml_pkg     ::*;
   import uvml_logs_pkg::*;
   import uvml_sb_pkg  ::*;
   import uvma_obi_pkg ::*;
   import uvml_mem_pkg ::*;

   // Constants / Structs / Enums
   `include "uvme_obi_st_tdefs.sv"
   `include "uvme_obi_st_constants.sv"

   // Objects
   `include "uvme_obi_st_cfg.sv"
   `include "uvme_obi_st_cntxt.sv"
   `include "uvme_obi_st_e2e_mon_trn.sv"
   `include "uvme_obi_st_mstr_mon_trn.sv"
   `include "uvme_obi_st_slv_mon_trn.sv"

   // Environment components
   `include "uvme_obi_st_cov_model.sv"
   `include "uvme_obi_st_prd.sv"
   `include "uvme_obi_st_vsqr.sv"
   `include "uvme_obi_st_env.sv"

   // Virtual Sequences
   `include "uvme_obi_st_vseq_lib.sv"

endpackage : uvme_obi_st_pkg


`endif // __UVME_OBI_ST_PKG_SV__
