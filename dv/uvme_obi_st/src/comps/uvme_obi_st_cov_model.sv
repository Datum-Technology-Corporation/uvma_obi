// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_OBI_ST_COV_MODEL_SV__
`define __UVME_OBI_ST_COV_MODEL_SV__


/**
 * Component encapsulating OBI Agent Self-Test Environment functional coverage model.
 */
class uvme_obi_st_cov_model_c extends uvma_obi_cov_model_c;
   
   `uvm_component_utils(uvme_obi_st_cov_model_c)
   
   
   covergroup obi_st_cfg_cg;
      // TODO Implement obi_st_cfg_cg
   endgroup : obi_st_cfg_cg
   
   covergroup obi_st_cntxt_cg;
      // TODO Implement obi_st_cntxt_cg
   endgroup : obi_st_cntxt_cg
   
   covergroup obi_st_mon_trn_cg;
      // TODO Implement obi_st_mon_trn_cg
   endgroup : obi_st_mon_trn_cg
   
   covergroup obi_st_mstr_a_mon_trn_cg;
      // TODO Implement obi_st_mstr_a_mon_trn_cg
   endgroup : obi_st_mstr_a_mon_trn_cg
   
   covergroup obi_st_mstr_r_mon_trn_cg;
      // TODO Implement obi_st_mstr_r_mon_trn_cg
   endgroup : obi_st_mstr_r_mon_trn_cg
   
   covergroup obi_st_slv_a_mon_trn_cg;
      // TODO Implement obi_st_slv_a_mon_trn_cg
   endgroup : obi_st_slv_a_mon_trn_cg
   
   covergroup obi_st_slv_r_mon_trn_cg;
      // TODO Implement obi_st_slv_r_mon_trn_cg
   endgroup : obi_st_slv_r_mon_trn_cg
   
   covergroup obi_st_seq_item_cg;
      // TODO Implement obi_st_seq_item_cg
   endgroup : obi_st_seq_item_cg
   
   covergroup obi_st_mstr_a_seq_item_cg;
      // TODO Implement obi_st_mstr_a_seq_item_cg
   endgroup : obi_st_mstr_a_seq_item_cg
   
   covergroup obi_st_mstr_r_seq_item_cg;
      // TODO Implement obi_st_mstr_r_seq_item_cg
   endgroup : obi_st_mstr_r_seq_item_cg
   
   covergroup obi_st_slv_a_seq_item_cg;
      // TODO Implement obi_st_slv_a_seq_item_cg
   endgroup : obi_st_slv_a_seq_item_cg
   
   covergroup obi_st_slv_r_seq_item_cg;
      // TODO Implement obi_st_slv_r_seq_item_cg
   endgroup : obi_st_slv_r_seq_item_cg
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_obi_st_cov_model", uvm_component parent=null);
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_cfg()
    */
   extern virtual function void sample_cfg();
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_cntxt()
    */
   extern virtual function void sample_cntxt();
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_mon_trn()
    */
   extern virtual function void sample_mon_trn();
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_mstr_mon_a_trn()
    */
   extern virtual function void sample_mstr_a_mon_trn();
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_mstr_mon_r_trn()
    */
   extern virtual function void sample_mstr_r_mon_trn();
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_slv_a_mon_trn()
    */
   extern virtual function void sample_slv_a_mon_trn();
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_slv_r_mon_trn()
    */
   extern virtual function void sample_slv_r_mon_trn();
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_seq_item()
    */
   extern virtual function void sample_seq_item();
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_mstr_a_seq_item()
    */
   extern virtual function void sample_mstr_a_seq_item();
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_mstr_r_seq_item()
    */
   extern virtual function void sample_mstr_r_seq_item();
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_slv_a_seq_item()
    */
   extern virtual function void sample_slv_a_seq_item();
   
   /**
    * TODO Describe uvme_obi_st_cov_model_c::sample_slv_r_seq_item()
    */
   extern virtual function void sample_slv_r_seq_item();
   
endclass : uvme_obi_st_cov_model_c


function uvme_obi_st_cov_model_c::new(string name="uvme_obi_st_cov_model", uvm_component parent=null);
   
   super.new(name, parent);
   
   obi_st_cfg_cg             = new();
   obi_st_cntxt_cg           = new();
   obi_st_mon_trn_cg         = new();
   obi_st_mstr_a_mon_trn_cg  = new();
   obi_st_mstr_r_mon_trn_cg  = new();
   obi_st_slv_a_mon_trn_cg   = new();
   obi_st_slv_r_mon_trn_cg   = new();
   obi_st_seq_item_cg        = new();
   obi_st_mstr_a_seq_item_cg = new();
   obi_st_mstr_r_seq_item_cg = new();
   obi_st_slv_a_seq_item_cg  = new();
   obi_st_slv_r_seq_item_cg  = new();
   
endfunction : new


function void uvme_obi_st_cov_model_c::sample_cfg();
   
   obi_st_cfg_cg.sample();
   
endfunction : sample_cfg


function void uvme_obi_st_cov_model_c::sample_cntxt();
   
   obi_st_cntxt_cg.sample();
   
endfunction : sample_cntxt


function void uvme_obi_st_cov_model_c::sample_mon_trn();
   
   obi_st_mon_trn_cg.sample();
   
endfunction : sample_mon_trn


function void uvme_obi_st_cov_model_c::sample_mstr_a_mon_trn();
   
   obi_st_mstr_a_mon_trn_cg.sample();
   
endfunction : sample_mstr_a_mon_trn


function void uvme_obi_st_cov_model_c::sample_mstr_r_mon_trn();
   
   obi_st_mstr_r_mon_trn_cg.sample();
   
endfunction : sample_mstr_r_mon_trn


function void uvme_obi_st_cov_model_c::sample_slv_a_mon_trn();
   
   obi_st_slv_a_mon_trn_cg.sample();
   
endfunction : sample_slv_a_mon_trn


function void uvme_obi_st_cov_model_c::sample_slv_r_mon_trn();
   
   obi_st_slv_r_mon_trn_cg.sample();
   
endfunction : sample_slv_r_mon_trn


function void uvme_obi_st_cov_model_c::sample_seq_item();
   
   obi_st_seq_item_cg.sample();
   
endfunction : sample_seq_item


function void uvme_obi_st_cov_model_c::sample_mstr_a_seq_item();
   
   obi_st_mstr_a_seq_item_cg.sample();
   
endfunction : sample_mstr_a_seq_item


function void uvme_obi_st_cov_model_c::sample_mstr_r_seq_item();
   
   obi_st_mstr_r_seq_item_cg.sample();
   
endfunction : sample_mstr_r_seq_item


function void uvme_obi_st_cov_model_c::sample_slv_a_seq_item();
   
   obi_st_slv_a_seq_item_cg.sample();
   
endfunction : sample_slv_a_seq_item


function void uvme_obi_st_cov_model_c::sample_slv_r_seq_item();
   
   obi_st_slv_r_seq_item_cg.sample();
   
endfunction : sample_slv_r_seq_item


`endif // __UVME_OBI_ST_COV_MODEL_SV__
