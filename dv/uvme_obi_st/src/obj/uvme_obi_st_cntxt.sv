// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_OBI_ST_CNTXT_SV__
`define __UVME_OBI_ST_CNTXT_SV__


/**
 * Object encapsulating all state variables for Open Bus Interface VIP Self-Testing environment (uvme_obi_st_env_c)
 * components.
 */
class uvme_obi_st_cntxt_c extends uvm_object;
   
   // Agent context handles
   uvma_obi_cntxt_c  mstr_cntxt; ///< 
   uvma_obi_cntxt_c  slv_cntxt ; ///< 
   
   // Scoreboard context handle
   uvml_sb_simplex_cntxt_c  sb_e2e_cntxt ; ///< 
   uvml_sb_simplex_cntxt_c  sb_mstr_cntxt; ///< 
   uvml_sb_simplex_cntxt_c  sb_slv_cntxt ; ///< 
   
   // Events
   uvm_event  sample_cfg_e  ; ///< 
   uvm_event  sample_cntxt_e; ///< 
   
   
   `uvm_object_utils_begin(uvme_obi_st_cntxt_c)
      `uvm_field_object(mstr_cntxt, UVM_DEFAULT)
      `uvm_field_object(slv_cntxt , UVM_DEFAULT)
      
      `uvm_field_object(sb_e2e_cntxt , UVM_DEFAULT)
      `uvm_field_object(sb_mstr_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_slv_cntxt , UVM_DEFAULT)
      
      `uvm_field_event(sample_cfg_e  , UVM_DEFAULT)
      `uvm_field_event(sample_cntxt_e, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Builds events and sub-context objects.
    */
   extern function new(string name="uvme_obi_st_cntxt");
   
endclass : uvme_obi_st_cntxt_c


function uvme_obi_st_cntxt_c::new(string name="uvme_obi_st_cntxt");
   
   super.new(name);
   
   mstr_cntxt = uvma_obi_cntxt_c::type_id::create("mstr_cntxt");
   slv_cntxt  = uvma_obi_cntxt_c::type_id::create("slv_cntxt" );
   slv_cntxt.memory.mem_default = UVML_MEM_DEFAULT_VAL_INCR;
   
   sb_e2e_cntxt  = uvml_sb_simplex_cntxt_c::type_id::create("sb_e2e_cntxt" );
   sb_mstr_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("sb_mstr_cntxt");
   sb_slv_cntxt  = uvml_sb_simplex_cntxt_c::type_id::create("sb_slv_cntxt" );
   
   sample_cfg_e   = new("sample_cfg_e"  );
   sample_cntxt_e = new("sample_cntxt_e");
   
endfunction : new


`endif // __UVME_OBI_ST_CNTXT_SV__
