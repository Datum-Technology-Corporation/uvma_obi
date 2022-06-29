// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_OBI_ST_CFG_SV__
`define __UVME_OBI_ST_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running Open Bus Interface VIP Self-Testing
 * Environment (uvme_obi_st_env_c) components.
 */
class uvme_obi_st_cfg_c extends uvm_object;
   
   // Integrals
   rand bit                      enabled              ; ///< 
   rand uvm_active_passive_enum  is_active            ; ///< 
   rand bit                      scoreboarding_enabled; ///< 
   rand bit                      cov_model_enabled    ; ///< 
   rand bit                      trn_log_enabled      ; ///< 
   
   // Objects
   rand uvma_obi_cfg_c         mstr_cfg   ; ///< 
   rand uvma_obi_cfg_c         slv_cfg    ; ///< 
   rand uvml_sb_simplex_cfg_c  sb_e2e_cfg ; ///< 
   rand uvml_sb_simplex_cfg_c  sb_mstr_cfg; ///< 
   rand uvml_sb_simplex_cfg_c  sb_slv_cfg ; ///< 
   
   
   `uvm_object_utils_begin(uvme_obi_st_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT)
      
      `uvm_field_object(mstr_cfg   , UVM_DEFAULT)
      `uvm_field_object(slv_cfg    , UVM_DEFAULT)
      `uvm_field_object(sb_e2e_cfg , UVM_DEFAULT)
      `uvm_field_object(sb_mstr_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_slv_cfg , UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      soft enabled                == 0;
      soft is_active              == UVM_ACTIVE;
      soft scoreboarding_enabled  == 1;
      soft cov_model_enabled      == 0;
      soft trn_log_enabled        == 1;
   }
   
   constraint agents_generic_cfg_cons {
      mstr_cfg.bypass_mode == 0;
      slv_cfg .bypass_mode == 0;
      
      if (enabled) {
         mstr_cfg.enabled == 1;
         slv_cfg .enabled == 1;
      }
      else {
         mstr_cfg.enabled == 0;
         slv_cfg .enabled == 0;
      }
      
      if (is_active == UVM_ACTIVE) {
         mstr_cfg.is_active == UVM_ACTIVE;
         slv_cfg .is_active == UVM_ACTIVE;
      }
      else {
         mstr_cfg.is_active == UVM_PASSIVE;
         slv_cfg .is_active == UVM_PASSIVE;
      }
      
      mstr_cfg.reset_type  == slv_cfg.reset_type ;
      
      if (trn_log_enabled) {
         mstr_cfg.trn_log_enabled == 1;
         slv_cfg .trn_log_enabled == 1;
      }
      else {
         mstr_cfg.trn_log_enabled == 0;
         slv_cfg .trn_log_enabled == 0;
      }
      
      if (cov_model_enabled) {
         mstr_cfg.cov_model_enabled == 1;
         slv_cfg .cov_model_enabled == 1;
      }
      else {
         mstr_cfg.cov_model_enabled == 0;
         slv_cfg .cov_model_enabled == 0;
      }
   }
   
   constraint agents_protocol_cons {
      mstr_cfg.version     == slv_cfg.version    ;
      mstr_cfg.addr_width  == slv_cfg.addr_width ;
      mstr_cfg.data_width  == slv_cfg.data_width ;
      mstr_cfg.auser_width == slv_cfg.auser_width;
      mstr_cfg.wuser_width == slv_cfg.wuser_width;
      mstr_cfg.ruser_width == slv_cfg.ruser_width;
      mstr_cfg.achk_width  == slv_cfg.achk_width ;
      mstr_cfg.rchk_width  == slv_cfg.rchk_width ;
      mstr_cfg.id_width    == slv_cfg.id_width   ;
      
      mstr_cfg.drv_mode == UVMA_OBI_DRV_MODE_MSTR;
      mstr_cfg.drv_idle == UVMA_OBI_DRV_IDLE_ZEROS;
      slv_cfg .drv_mode == UVMA_OBI_DRV_MODE_SLV ;
      slv_cfg .drv_idle == UVMA_OBI_DRV_IDLE_ZEROS;
   }
   
   constraint sb_e2e_cfg_cons {
      sb_e2e_cfg .mode == UVML_SB_MODE_IN_ORDER;
      sb_mstr_cfg.mode == UVML_SB_MODE_IN_ORDER;
      sb_slv_cfg .mode == UVML_SB_MODE_IN_ORDER;
      if (scoreboarding_enabled) {
         sb_e2e_cfg .enabled == 1;
         sb_mstr_cfg.enabled == 0;
         sb_slv_cfg .enabled == 0;
      }
      else {
         sb_e2e_cfg .enabled == 0;
         sb_mstr_cfg.enabled == 0;
         sb_slv_cfg .enabled == 0;
      }
   }
   
   
   /**
    * Creates sub-configuration objects.
    */
   extern function new(string name="uvme_obi_st_cfg");
   
endclass : uvme_obi_st_cfg_c


function uvme_obi_st_cfg_c::new(string name="uvme_obi_st_cfg");
   
   super.new(name);
   mstr_cfg    = uvma_obi_cfg_c       ::type_id::create("mstr_cfg"   );
   slv_cfg     = uvma_obi_cfg_c       ::type_id::create("slv_cfg"    );
   sb_e2e_cfg  = uvml_sb_simplex_cfg_c::type_id::create("sb_e2e_cfg" );
   sb_mstr_cfg = uvml_sb_simplex_cfg_c::type_id::create("sb_mstr_cfg");
   sb_slv_cfg  = uvml_sb_simplex_cfg_c::type_id::create("sb_slv_cfg" );
   
endfunction : new


`endif // __UVME_OBI_ST_CFG_SV__
