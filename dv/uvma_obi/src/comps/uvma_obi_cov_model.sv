// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_OBI_COV_MODEL_SV__
`define __UVMA_OBI_COV_MODEL_SV__


/**
 * Component encapsulating Open Bus Interface functional coverage model.
 */
class uvma_obi_cov_model_c extends uvm_component;
   
   // Objects
   uvma_obi_cfg_c       cfg  ; ///< 
   uvma_obi_cntxt_c     cntxt; ///< 
   
   // Covergroup variables
   uvma_obi_mon_trn_c          mon_trn        ; ///< 
   uvma_obi_mstr_a_mon_trn_c   mstr_a_mon_trn ; ///< 
   uvma_obi_mstr_r_mon_trn_c   mstr_r_mon_trn ; ///< 
   uvma_obi_slv_a_mon_trn_c    slv_a_mon_trn  ; ///< 
   uvma_obi_slv_r_mon_trn_c    slv_r_mon_trn  ; ///< 
   uvma_obi_seq_item_c         seq_item       ; ///< 
   uvma_obi_mstr_a_seq_item_c  mstr_a_seq_item; ///< 
   uvma_obi_mstr_r_seq_item_c  mstr_r_seq_item; ///< 
   uvma_obi_slv_a_seq_item_c   slv_a_seq_item ; ///< 
   uvma_obi_slv_r_seq_item_c   slv_r_seq_item ; ///< 
   
   // TLM
   uvm_tlm_analysis_fifo#(uvma_obi_mon_trn_c        )  mon_trn_fifo        ; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_mstr_a_mon_trn_c )  mstr_a_mon_trn_fifo ; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_mstr_r_mon_trn_c )  mstr_r_mon_trn_fifo ; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_slv_a_mon_trn_c  )  slv_a_mon_trn_fifo  ; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_slv_r_mon_trn_c  )  slv_r_mon_trn_fifo  ; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_seq_item_c       )  seq_item_fifo       ; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_mstr_a_seq_item_c)  mstr_a_seq_item_fifo; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_mstr_r_seq_item_c)  mstr_r_seq_item_fifo; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_slv_a_seq_item_c )  slv_a_seq_item_fifo ; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_slv_r_seq_item_c )  slv_r_seq_item_fifo ; ///< 
   
   
   `uvm_component_utils_begin(uvma_obi_cov_model_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_cov_model", uvm_component parent=null);
   
   /**
    * 1. Ensures cfg & cntxt handles are not null.
    * 2. Builds fifos.
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * Forks all sampling loops
    */
   extern virtual task run_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_cfg()
    */
   extern virtual function void sample_cfg();
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_cntxt()
    */
   extern virtual function void sample_cntxt();
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_mon_trn()
    */
   extern virtual function void sample_mon_trn();
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_mstr_mon_a_trn()
    */
   extern virtual function void sample_mstr_a_mon_trn();
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_mstr_mon_r_trn()
    */
   extern virtual function void sample_mstr_r_mon_trn();
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_slv_a_mon_trn()
    */
   extern virtual function void sample_slv_a_mon_trn();
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_slv_r_mon_trn()
    */
   extern virtual function void sample_slv_r_mon_trn();
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_seq_item()
    */
   extern virtual function void sample_seq_item();
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_mstr_a_seq_item()
    */
   extern virtual function void sample_mstr_a_seq_item();
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_mstr_r_seq_item()
    */
   extern virtual function void sample_mstr_r_seq_item();
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_slv_a_seq_item()
    */
   extern virtual function void sample_slv_a_seq_item();
   
   /**
    * TODO Describe uvma_obi_cov_model_c::sample_slv_r_seq_item()
    */
   extern virtual function void sample_slv_r_seq_item();
   
endclass : uvma_obi_cov_model_c


function uvma_obi_cov_model_c::new(string name="uvma_obi_cov_model", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvma_obi_cov_model_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvma_obi_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvma_obi_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
   mon_trn_fifo         = new("mon_trn_fifo"        , this);
   mstr_a_mon_trn_fifo  = new("mstr_a_mon_trn_fifo" , this);
   mstr_r_mon_trn_fifo  = new("mstr_r_mon_trn_fifo" , this);
   slv_a_mon_trn_fifo   = new("slv_a_mon_trn_fifo"  , this);
   slv_r_mon_trn_fifo   = new("slv_r_mon_trn_fifo"  , this);
   seq_item_fifo        = new("seq_item_fifo"       , this);
   mstr_a_seq_item_fifo = new("mstr_a_seq_item_fifo", this);
   mstr_r_seq_item_fifo = new("mstr_r_seq_item_fifo", this);
   slv_a_seq_item_fifo  = new("slv_a_seq_item_fifo" , this);
   slv_r_seq_item_fifo  = new("slv_r_seq_item_fifo" , this);
   
endfunction : build_phase


task uvma_obi_cov_model_c::run_phase(uvm_phase phase);
   
   super.run_phase(phase);
   
   if (cfg.enabled && cfg.cov_model_enabled) begin
      fork
         // Configuration
         forever begin
            cntxt.sample_cfg_e.wait_trigger();
            sample_cfg();
         end
         
         // Context
         forever begin
            cntxt.sample_cntxt_e.wait_trigger();
            sample_cntxt();
         end
         
         // Monitor transactions
         forever begin
            mon_trn_fifo.get(mon_trn);
            sample_mon_trn();
         end
         
         // Monitor mstr_a transactions
         forever begin
            mstr_a_mon_trn_fifo.get(mstr_a_mon_trn);
            sample_mstr_a_mon_trn();
         end
         
         // Monitor mstr_r transactions
         forever begin
            mstr_r_mon_trn_fifo.get(mstr_r_mon_trn);
            sample_mstr_r_mon_trn();
         end
         
         // Monitor slv_a transactions
         forever begin
            slv_a_mon_trn_fifo.get(slv_a_mon_trn);
            sample_slv_a_mon_trn();
         end
         
         // Monitor slv_r transactions
         forever begin
            slv_r_mon_trn_fifo.get(slv_r_mon_trn);
            sample_slv_r_mon_trn();
         end
         
         // Sequence items
         forever begin
            seq_item_fifo.get(seq_item);
            sample_seq_item();
         end
         
         // Sequence mstr_a items
         forever begin
            mstr_a_seq_item_fifo.get(mstr_a_seq_item);
            sample_mstr_a_seq_item();
         end
         
         // Sequence mstr_r items
         forever begin
            mstr_r_seq_item_fifo.get(mstr_r_seq_item);
            sample_mstr_r_seq_item();
         end
         
         // Sequence slv_a items
         forever begin
            slv_a_seq_item_fifo.get(slv_a_seq_item);
            sample_slv_a_seq_item();
         end
         
         // Sequence slv_r items
         forever begin
            slv_r_seq_item_fifo.get(slv_r_seq_item);
            sample_slv_r_seq_item();
         end
      join_none
   end
   
endtask : run_phase


function void uvma_obi_cov_model_c::sample_cfg();
   
   // TODO Implement uvma_obi_cov_model_c::sample_cfg();
   
endfunction : sample_cfg


function void uvma_obi_cov_model_c::sample_cntxt();
   
   // TODO Implement uvma_obi_cov_model_c::sample_cntxt();
   
endfunction : sample_cntxt


function void uvma_obi_cov_model_c::sample_mon_trn();
   
   // TODO Implement uvma_obi_cov_model_c::sample_mon_trn();
   
endfunction : sample_mon_trn


function void uvma_obi_cov_model_c::sample_mstr_a_mon_trn();
   
   // TODO Implement uvma_obi_cov_model_c::sample_mstr_a_mon_trn();
   
endfunction : sample_mstr_a_mon_trn


function void uvma_obi_cov_model_c::sample_mstr_r_mon_trn();
   
   // TODO Implement uvma_obi_cov_model_c::sample_mstr_r_mon_trn();
   
endfunction : sample_mstr_r_mon_trn


function void uvma_obi_cov_model_c::sample_slv_a_mon_trn();
   
   // TODO Implement uvma_obi_cov_model_c::sample_slv_a_mon_trn();
   
endfunction : sample_slv_a_mon_trn


function void uvma_obi_cov_model_c::sample_slv_r_mon_trn();
   
   // TODO Implement uvma_obi_cov_model_c::sample_slv_r_mon_trn();
   
endfunction : sample_slv_r_mon_trn


function void uvma_obi_cov_model_c::sample_seq_item();
   
   // TODO Implement uvma_obi_cov_model_c::sample_seq_item();
   
endfunction : sample_seq_item


function void uvma_obi_cov_model_c::sample_mstr_a_seq_item();
   
   // TODO Implement uvma_obi_cov_model_c::sample_mstr_a_seq_item();
   
endfunction : sample_mstr_a_seq_item


function void uvma_obi_cov_model_c::sample_mstr_r_seq_item();
   
   // TODO Implement uvma_obi_cov_model_c::sample_mstr_r_seq_item();
   
endfunction : sample_mstr_r_seq_item


function void uvma_obi_cov_model_c::sample_slv_a_seq_item();
   
   // TODO Implement uvma_obi_cov_model_c::sample_slv_a_seq_item();
   
endfunction : sample_slv_a_seq_item


function void uvma_obi_cov_model_c::sample_slv_r_seq_item();
   
   // TODO Implement uvma_obi_cov_model_c::sample_slv_r_seq_item();
   
endfunction : sample_slv_r_seq_item


`endif // __UVMA_OBI_COV_MODEL_SV__
