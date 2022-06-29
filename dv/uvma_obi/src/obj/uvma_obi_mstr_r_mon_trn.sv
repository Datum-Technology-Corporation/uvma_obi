// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_OBI_MSTR_R_MON_TRN_SV__
`define __UVMA_OBI_MSTR_R_MON_TRN_SV__


/**
 * Object rebuilt by the Open Bus Interface monitor.  Analog of uvma_obi_mstr_r_seq_item_c.
 */
class uvma_obi_mstr_r_mon_trn_c extends uvml_mon_trn_c;
   
   uvma_obi_cfg_c  cfg; ///< Agent configuration handle
   
   // Data
   uvma_obi_rready_l_t     rready   ; ///< TODO Describe uvma_obi_mstr_r_mon_trn_c::rready
   uvma_obi_rreadypar_l_t  rreadypar; ///< TODO Describe uvma_obi_mstr_r_mon_trn_c::rreadypar
   
   // Metadata
   uvma_obi_rvalid_l_t  rvalid;
   
   
   `uvm_object_utils_begin(uvma_obi_mstr_r_mon_trn_c)
      `uvm_field_int(rready   , UVM_DEFAULT)
      `uvm_field_int(rreadypar, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_mstr_r_mon_trn");
   
   /**
    * TODO Describe uvma_obi_mstr_r_mon_trn_c::get_metadata()
    */
   extern function uvml_metadata_t get_metadata();
   
endclass : uvma_obi_mstr_r_mon_trn_c


function uvma_obi_mstr_r_mon_trn_c::new(string name="uvma_obi_mstr_r_mon_trn");
   
   super.new(name);
   rready    = 0;
   rreadypar = 0;
   
endfunction : new


function uvml_metadata_t uvma_obi_mstr_r_mon_trn_c::get_metadata();
   
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


`endif // __UVMA_OBI_MSTR_R_MON_TRN_SV__
