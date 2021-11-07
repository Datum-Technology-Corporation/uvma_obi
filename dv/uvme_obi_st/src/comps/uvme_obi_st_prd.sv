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


`ifndef __UVME_OBI_ST_PRD_SV__
`define __UVME_OBI_ST_PRD_SV__


/**
 * Component implementing transaction-based software model of Open Bus Interface Self-Testing DUT.
 */
class uvme_obi_st_prd_c extends uvm_component;
   
   // Objects
   uvme_obi_st_cfg_c    cfg  ; ///< 
   uvme_obi_st_cntxt_c  cntxt; ///< 
   
   // TLM
   uvm_analysis_export  #(uvma_obi_mon_trn_c       )  e2e_in_export  ; ///< 
   uvm_analysis_export  #(uvma_obi_seq_item_c      )  mstr_in_export ; ///< 
   uvm_analysis_export  #(uvma_obi_slv_r_seq_item_c)  slv_in_export  ; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_mon_trn_c       )  e2e_in_fifo    ; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_seq_item_c      )  mstr_in_fifo   ; ///< 
   uvm_tlm_analysis_fifo#(uvma_obi_slv_r_seq_item_c)  slv_in_fifo    ; ///< 
   uvm_analysis_port    #(uvma_obi_mon_trn_c       )  e2e_out_ap     ; ///< 
   uvm_analysis_port    #(uvma_obi_mon_trn_c       )  mstr_out_ap    ; ///< 
   uvm_analysis_port    #(uvma_obi_mon_trn_c       )  slv_out_ap     ; ///< 
   
   
   `uvm_component_utils_begin(uvme_obi_st_prd_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_obi_st_prd", uvm_component parent=null);
   
   /**
    * TODO Describe uvme_obi_st_prd_c::build_phase()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvme_obi_st_prd_c::connect_phase()
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvme_obi_st_prd_c::run_phase()
    */
   extern virtual task run_phase(uvm_phase phase);
   
endclass : uvme_obi_st_prd_c


function uvme_obi_st_prd_c::new(string name="uvme_obi_st_prd", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvme_obi_st_prd_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvme_obi_st_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvme_obi_st_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
   // Build TLM objects
   if (cfg.sb_e2e_cfg.enabled) begin
      e2e_in_export = new("e2e_in_export", this);
      e2e_in_fifo   = new("e2e_in_fifo"  , this);
      e2e_out_ap    = new("e2e_out_ap"   , this);
   end
   if (cfg.sb_mstr_cfg.enabled) begin
      mstr_in_export = new("mstr_in_export", this);
      mstr_in_fifo   = new("mstr_in_fifo"  , this);
      mstr_out_ap    = new("mstr_out_ap"   , this);
   end
   if (cfg.sb_slv_cfg.enabled) begin
      slv_in_export = new("slv_in_export", this);
      slv_in_fifo   = new("slv_in_fifo"  , this);
      slv_out_ap    = new("slv_out_ap"   , this);
   end
   
endfunction : build_phase


function void uvme_obi_st_prd_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   // Connect TLM objects
   if (cfg.sb_e2e_cfg.enabled) begin
      e2e_in_export.connect(e2e_in_fifo.analysis_export);
   end
   if (cfg.sb_mstr_cfg.enabled) begin
      mstr_in_export.connect(mstr_in_fifo.analysis_export);
   end
   if (cfg.sb_slv_cfg.enabled) begin
      slv_in_export.connect(slv_in_fifo.analysis_export);
   end
   
endfunction: connect_phase


task uvme_obi_st_prd_c::run_phase(uvm_phase phase);
   
   uvma_obi_seq_item_c        mstr_in_trn;
   uvma_obi_slv_r_seq_item_c  slv_in_trn;
   uvma_obi_mon_trn_c         e2e_in_trn, e2e_out_trn, mstr_out_trn, slv_out_trn;
   
   super.run_phase(phase);
   
   fork
      begin : e2e
         if (cfg.sb_e2e_cfg.enabled) begin
            forever begin
               // Get next transaction and copy it
               e2e_in_fifo.get(e2e_in_trn);
               e2e_out_trn = uvma_obi_mon_trn_c::type_id::create("e2e_out_trn");//uvme_obi_st_e2e_mon_trn_c::type_id::create("e2e_out_trn");
               e2e_out_trn.copy(e2e_in_trn);
               
               if (cntxt.slv_cntxt.reset_state != UVML_RESET_STATE_POST_RESET) begin
                  e2e_out_trn.set_may_drop(1);
               end
               
               // Send transaction to analysis port
               e2e_out_ap.write(e2e_out_trn);
            end
         end
      end
      
      begin : mstr
         if (cfg.sb_mstr_cfg.enabled) begin
            forever begin
               // Get next transaction
               mstr_in_fifo.get(mstr_in_trn);
               mstr_out_trn = uvme_obi_st_mstr_mon_trn_c::type_id::create("mstr_out_trn");
               mstr_out_trn.access_type = mstr_in_trn.access_type;
               mstr_out_trn.address     = mstr_in_trn.address    ;
               mstr_out_trn.data        = mstr_in_trn.data       ;
               mstr_out_trn.be          = mstr_in_trn.be         ;
               mstr_out_trn.auser       = mstr_in_trn.auser      ;
               mstr_out_trn.wuser       = mstr_in_trn.wuser      ;
               mstr_out_trn.ruser       = mstr_in_trn.ruser      ;
               mstr_out_trn.aid         = mstr_in_trn.id         ;
               mstr_out_trn.rid         = mstr_in_trn.id         ;
               mstr_out_trn.atop        = mstr_in_trn.atop       ;
               mstr_out_trn.memtype     = mstr_in_trn.memtype    ;
               mstr_out_trn.prot        = mstr_in_trn.prot       ;
               
               if (cntxt.slv_cntxt.reset_state != UVML_RESET_STATE_POST_RESET) begin
                  mstr_out_trn.set_may_drop(1);
               end
               
               // Send transaction to analysis port
               mstr_out_ap.write(mstr_out_trn);
            end
         end
      end
      
      begin : slv
         if (cfg.sb_slv_cfg.enabled) begin
            forever begin
               // Get next transaction
               slv_in_fifo.get(slv_in_trn);
               slv_out_trn = uvme_obi_st_slv_mon_trn_c::type_id::create("slv_out_trn");
               slv_out_trn.data    = slv_in_trn.rdata  ;
               slv_out_trn.err     = slv_in_trn.err    ;
               slv_out_trn.ruser   = slv_in_trn.ruser  ;
               slv_out_trn.rid     = slv_in_trn.rid    ;
               slv_out_trn.exokay  = slv_in_trn.exokay ;
               slv_out_trn.rchk    = slv_in_trn.rchk   ;
               
               
               if (cntxt.slv_cntxt.reset_state != UVML_RESET_STATE_POST_RESET) begin
                  slv_out_trn.set_may_drop(1);
               end
               
               // Send transaction to analysis port
               slv_out_ap.write(slv_out_trn);
            end
         end
      end
   join_none
   
   
endtask: run_phase


`endif // __UVME_OBI_ST_PRD_SV__
