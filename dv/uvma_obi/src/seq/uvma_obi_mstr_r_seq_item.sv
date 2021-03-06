// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_OBI_MSTR_R_SEQ_ITEM_SV__
`define __UVMA_OBI_MSTR_R_SEQ_ITEM_SV__


/**
 * Object created by sequences running on uvma_obi_mstr_r_sqr_c.
 */
class uvma_obi_mstr_r_seq_item_c extends uvml_seq_item_c;
   
   uvma_obi_cfg_c  cfg; ///< Agent configuration handle
   
   // Data
   rand bit  rready   ; ///< TODO Describe uvma_obi_mstr_r_seq_item_c::rready
   rand bit  rreadypar; ///< TODO Describe uvma_obi_mstr_r_seq_item_c::rreadypar
   
   // Metadata
   uvma_obi_rvalid_l_t  rvalid;
   uvma_obi_data_l_t    rdata ;
   
   
   `uvm_object_utils_begin(uvma_obi_mstr_r_seq_item_c)
      `uvm_field_int(rready   , UVM_DEFAULT)
      `uvm_field_int(rreadypar, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint default_cons {
      soft rready != rreadypar;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_mstr_r_seq_item");
   
   /**
    * TODO Describe uvma_obi_mstr_r_mon_trn_c::get_metadata()
    */
   extern function uvml_metadata_t get_metadata();
   
endclass : uvma_obi_mstr_r_seq_item_c


function uvma_obi_mstr_r_seq_item_c::new(string name="uvma_obi_mstr_r_seq_item");
   
   super.new(name);
   
endfunction : new


function uvml_metadata_t uvma_obi_mstr_r_seq_item_c::get_metadata();
   
   string rready_str    = $sformatf("%b", rready   );
   string rreadypar_str = $sformatf("%b", rreadypar);
   
   if ((rready === 1'b1) && (rvalid === 1'b1)) begin
      get_metadata.push_back('{
         index     : 0,
         value     : rready_str,
         col_name  : "rready",
         col_width : rready_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      
      get_metadata.push_back('{
         index     : 0,
         value     : rreadypar_str,
         col_name  : "rreadypar",
         col_width : rreadypar_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
   end
   
endfunction : get_metadata


`endif // __UVMA_OBI_MSTR_R_SEQ_ITEM_SV__
