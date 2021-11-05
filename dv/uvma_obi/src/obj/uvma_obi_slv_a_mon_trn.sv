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


`ifndef __UVMA_OBI_SLV_A_MON_TRN_SV__
`define __UVMA_OBI_SLV_A_MON_TRN_SV__


/**
 * Object rebuilt by the Open Bus Interface monitor.  Analog of uvma_obi_slv_a_seq_item_c.
 */
class uvma_obi_slv_a_mon_trn_c extends uvml_mon_trn_c;
   
   uvma_obi_cfg_c  cfg; ///< Agent configuration handle
   
   // Data
   uvma_obi_gnt_l_t     gnt   ; ///< TODO Describe uvma_obi_slv_a_mon_trn_c::gnt
   uvma_obi_gntpar_l_t  gntpar; ///< TODO Describe uvma_obi_slv_a_mon_trn_c::gntpar
   
   // Metadata
   uvma_obi_req_l_t  req;
   
   
   `uvm_object_utils_begin(uvma_obi_slv_a_mon_trn_c)
      `uvm_field_int(gnt   , UVM_DEFAULT)
      `uvm_field_int(gntpar, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_slv_a_mon_trn");
   
   /**
    * TODO Describe uvma_obi_slv_a_mon_trn_c::get_metadata()
    */
   extern function uvml_metadata_t get_metadata();
   
endclass : uvma_obi_slv_a_mon_trn_c


function uvma_obi_slv_a_mon_trn_c::new(string name="uvma_obi_slv_a_mon_trn");
   
   super.new(name);
   gnt    = 0;
   gntpar = 0;
   
endfunction : new


function uvml_metadata_t uvma_obi_slv_a_mon_trn_c::get_metadata();
   
   string gnt_str    = $sformatf("%b", gnt   );
   string gntpar_str = $sformatf("%b", gntpar);
   
   if ((gnt === 1'b1) && (req === 1'b1)) begin
      get_metadata.push_back('{
         index     : 0,
         value     : gnt_str,
         col_name  : "gnt",
         col_width : gnt_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      
      get_metadata.push_back('{
         index     : 0,
         value     : gntpar_str,
         col_name  : "gntpar",
         col_width : gntpar_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
   end
   
endfunction : get_metadata


`endif // __UVMA_OBI_SLV_A_MON_TRN_SV__
