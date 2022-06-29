// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_OBI_CNTXT_SV__
`define __UVMA_OBI_CNTXT_SV__


typedef class uvma_obi_mstr_a_mon_trn_c;


/**
 * Object encapsulating all state variables for all Open Bus Interface agent (uvma_obi_agent_c) components.
 */
class uvma_obi_cntxt_c extends uvm_object;
   
   virtual uvma_obi_if               vif                     ; ///< Handle to agent interface
   uvml_reset_state_enum             reset_state             ; ///< TODO Describe uvma_obi_cntxt_c::reset_state
   uvma_obi_mstr_a_mon_trn_c         mon_outstanding_q[$]    ; ///< TODO Describe uvma_obi_cntxt_c::mon_outstanding_q
   uvma_obi_mstr_a_mon_trn_c         drv_slv_outstanding_q[$]; ///< TODO Describe uvma_obi_cntxt_c::mon_outstanding_q
   uvml_mem_model_c                  memory                  ; ///< Handle to memory model for active slaves
   uvma_obi_slv_handler_base_vseq_c  slv_handlers[$]         ; ///< Queue of sequences that can respond to read/write from mstr
   
   uvm_sequence_base  mon_vseq     ; ///< 
   uvm_sequence_base  idle_vseq    ; ///< 
   uvm_sequence_base  mstr_drv_vseq; ///< 
   uvm_sequence_base  slv_drv_vseq ; ///< 
   
   // Events
   uvm_event  mstr_a_req_e  ; ///< 
   uvm_event  sample_cfg_e  ; ///< 
   uvm_event  sample_cntxt_e; ///< 
   
   
   `uvm_object_utils_begin(uvma_obi_cntxt_c)
      `uvm_field_enum        (uvml_reset_state_enum, reset_state               , UVM_DEFAULT)
      //`uvm_field_queue_object(                       mon_outstanding_q, UVM_DEFAULT)
      `uvm_field_object      (                       memory                    , UVM_DEFAULT)
      //`uvm_field_queue_object(                       slv_handlers              , UVM_DEFAULT)
      
      `uvm_field_event(mstr_a_req_e  , UVM_DEFAULT)
      `uvm_field_event(sample_cfg_e  , UVM_DEFAULT)
      `uvm_field_event(sample_cntxt_e, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Builds events.
    */
   extern function new(string name="uvma_obi_cntxt");
   
   /**
    * TODO Describe uvma_obi_cntxt_c::reset()
    */
   extern function void reset();
   
endclass : uvma_obi_cntxt_c


function uvma_obi_cntxt_c::new(string name="uvma_obi_cntxt");
   
   super.new(name);
   reset_state    = UVML_RESET_STATE_PRE_RESET;
   memory         = uvml_mem_model_c::type_id::create("memory");
   mstr_a_req_e   = new("mstr_a_req_e"  );
   sample_cfg_e   = new("sample_cfg_e"  );
   sample_cntxt_e = new("sample_cntxt_e");
   
endfunction : new


function void uvma_obi_cntxt_c::reset();
   
   mon_outstanding_q    .delete();
   drv_slv_outstanding_q.delete();
   
endfunction : reset


`endif // __UVMA_OBI_CNTXT_SV__
