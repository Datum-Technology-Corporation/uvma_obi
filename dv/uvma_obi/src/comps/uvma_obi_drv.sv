// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_OBI_DRV_SV__
`define __UVMA_OBI_DRV_SV__


/**
 * Component driving a Open Bus Interface virtual interface (uvma_obi_if).
 */
class uvma_obi_drv_c extends uvm_component;
   
   // Objects
   uvma_obi_cfg_c    cfg  ; ///< Agent configuration handle
   uvma_obi_cntxt_c  cntxt; ///< Agent context handle
   
   // Components
   uvma_obi_mstr_a_drv_c  mstr_a_driver; ///< TODO Describe uvma_obi_drv_c::mstr_a_driver
   uvma_obi_mstr_r_drv_c  mstr_r_driver; ///< TODO Describe uvma_obi_drv_c::mstr_r_driver
   uvma_obi_slv_a_drv_c   slv_a_driver ; ///< TODO Describe uvma_obi_drv_c::slv_a_driver
   uvma_obi_slv_r_drv_c   slv_r_driver ; ///< TODO Describe uvma_obi_drv_c::slv_r_driver
   
   // TLM
   uvm_analysis_port#(uvma_obi_mstr_r_seq_item_c)  mstr_r_ap; ///< TODO Describe uvma_obi_drv_c:: mstr_r_ap
   uvm_analysis_port#(uvma_obi_mstr_a_seq_item_c)  mstr_a_ap; ///< TODO Describe uvma_obi_drv_c:: mstr_a_ap
   uvm_analysis_port#(uvma_obi_slv_r_seq_item_c )  slv_r_ap ; ///< TODO Describe uvma_obi_drv_c:: slv_r_ap
   uvm_analysis_port#(uvma_obi_slv_a_seq_item_c )  slv_a_ap ; ///< TODO Describe uvma_obi_drv_c:: slv_a_ap
   
   
   `uvm_component_utils_begin(uvma_obi_drv_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_drv", uvm_component parent=null);
   
   /**
    * 1. Ensures cfg & cntxt handles are not null.
    * 2. Builds ap.
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvma_obi_drv_c::connect_phase()
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
endclass : uvma_obi_drv_c


function uvma_obi_drv_c::new(string name="uvma_obi_drv", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvma_obi_drv_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvma_obi_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   uvm_config_db#(uvma_obi_cfg_c)::set(this, "*", "cfg", cfg);
   
   void'(uvm_config_db#(uvma_obi_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   uvm_config_db#(uvma_obi_cntxt_c)::set(this, "*", "cntxt", cntxt);
   
   // Create components
   mstr_a_driver = uvma_obi_mstr_a_drv_c::type_id::create("mstr_a_driver", this);
   mstr_r_driver = uvma_obi_mstr_r_drv_c::type_id::create("mstr_r_driver", this);
   slv_a_driver  = uvma_obi_slv_a_drv_c ::type_id::create("slv_a_driver" , this);
   slv_r_driver  = uvma_obi_slv_r_drv_c ::type_id::create("slv_r_driver" , this);
   
   // Create TLM Components
   mstr_a_ap = new("mstr_a_ap", this);
   mstr_r_ap = new("mstr_r_ap", this);
   slv_a_ap  = new("slv_a_ap" , this);
   slv_r_ap  = new("slv_r_ap" , this);
   
endfunction : build_phase


function void uvma_obi_drv_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   mstr_r_ap = mstr_a_driver.ap;
   mstr_a_ap = mstr_r_driver.ap;
   slv_r_ap  = slv_a_driver .ap;
   slv_a_ap  = slv_r_driver .ap;
   
endfunction : connect_phase


`endif // __UVMA_OBI_DRV_SV__
