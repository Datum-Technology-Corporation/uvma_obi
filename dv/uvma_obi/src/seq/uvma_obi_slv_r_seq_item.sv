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


`ifndef __UVMA_OBI_SLV_R_SEQ_ITEM_SV__
`define __UVMA_OBI_SLV_R_SEQ_ITEM_SV__


/**
 * Object created by sequences running on uvma_obi_slv_r_sqr_c.
 */
class uvma_obi_slv_r_seq_item_c extends uvml_seq_item_c;
   
   uvma_obi_cfg_c  cfg; ///< Agent configuration handle
   
   // Data
   rand uvma_obi_rvalid_b_t     rvalid   ; ///< TODO Describe uvma_obi_slv_r_seq_item_c::rvalid
   rand uvma_obi_data_b_t       rdata    ; ///< TODO Describe uvma_obi_slv_r_seq_item_c::rdata
   rand uvma_obi_err_b_t        err      ; ///< TODO Describe uvma_obi_slv_r_seq_item_c::err
   rand uvma_obi_ruser_b_t      ruser    ; ///< TODO Describe uvma_obi_slv_r_seq_item_c::ruser
   rand uvma_obi_id_b_t         rid      ; ///< TODO Describe uvma_obi_slv_r_seq_item_c::rid
   rand uvma_obi_exokay_b_t     exokay   ; ///< TODO Describe uvma_obi_slv_r_seq_item_c::exokay
   rand uvma_obi_rvalidpar_b_t  rvalidpar; ///< TODO Describe uvma_obi_slv_r_seq_item_c::rvalidpar
   rand uvma_obi_rchk_b_t       rchk     ; ///< TODO Describe uvma_obi_slv_r_seq_item_c::rchk
   
   // Metadata
   
   
   `uvm_object_utils_begin(uvma_obi_slv_r_seq_item_c)
      `uvm_field_int(rvalid   , UVM_DEFAULT)
      `uvm_field_int(rdata    , UVM_DEFAULT)
      `uvm_field_int(err      , UVM_DEFAULT)
      `uvm_field_int(ruser    , UVM_DEFAULT)
      `uvm_field_int(rid      , UVM_DEFAULT)
      `uvm_field_int(exokay   , UVM_DEFAULT)
      `uvm_field_int(rvalidpar, UVM_DEFAULT)
      `uvm_field_int(rchk     , UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint default_cons {
      soft rvalid != rvalidpar;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_slv_r_seq_item");
   
   /**
    * TODO Describe uvma_obi_slv_r_seq_item_c::do_print()
    */
   extern function void do_print(uvm_printer printer);
   
   /**
    * TODO Describe uvma_obi_slv_r_seq_item_c::get_metadata()
    */
   extern function uvml_metadata_t get_metadata();
   
endclass : uvma_obi_slv_r_seq_item_c


function uvma_obi_slv_r_seq_item_c::new(string name="uvma_obi_slv_r_seq_item");
   
   super.new(name);
   
endfunction : new


function void uvma_obi_slv_r_seq_item_c::do_print(uvm_printer printer);
   
   super.do_print(printer);
   
   if (cfg != null) begin
      printer.print_field("rdata", addr, cfg.data_width);
      printer.print_field("err"  , err , $bits(err)    );
      
      if (cfg.ruser_width > 0) begin
         printer.print_field("ruser", ruser, cfg.ruser_width);
      end
      
      if (cfg.id_width > 0) begin
         printer.print_field("rid", rid, cfg.id_width);
      end
      
      printer.print_field("exokay"   , exokay   , $bits(exokay   ));
      printer.print_field("rvalidpar", rvalidpar, $bits(rvalidpar));
      
      if (cfg.rchk_width > 0) begin
         printer.print_field("rchk", rchk, cfg.rchk_width);
      end
   end
   
endfunction : do_print


function uvml_metadata_t uvma_obi_slv_r_seq_item_c::get_metadata();
   
   int unsigned  field_count = 0;
   string  rdata_str     = $sformatf("%h", rdata    );
   string  err_str       = $sformatf("%h", err      );
   string  ruser_str     = $sformatf("%h", ruser    );
   string  rid_str       = $sformatf("%h", rid      );
   string  exokay_str    = $sformatf("%h", exokay   );
   string  rvalidpar_str = $sformatf("%h", rvalidpar);
   string  rchk_str      = $sformatf("%h", rchk     );
   
   if (((rvalid === 1'b1) && (rready === 1'b1)) && (cfg != null)) begin
      rdata_str = rdata_str.substr(rdata_str.len() - (cfg.data_width/4), rdata_str.len()-1);
      get_metadata.push_back('{
         index     : field_count,
         value     : rdata_str,
         col_name  : "rdata",
         col_width : rdata_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      get_metadata.push_back('{
         index     : field_count,
         value     : err_str,
         col_name  : "err",
         col_width : err_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      if (cfg.ruser_width > 0) begin
         ruser_str = ruser_str.substr(ruser_str.len() - (cfg.ruser_width/4), ruser_str.len()-1);
         get_metadata.push_back('{
            index     : field_count,
            value     : ruser_str,
            col_name  : "ruser",
            col_width : ruser_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_ENUM
         });
         field_count++;
      end
      
      if (cfg.id_width > 0) begin
         rid_str = rid_str.substr(rid_str.len() - (cfg.id_width/4), rid_str.len()-1);
         get_metadata.push_back('{
            index     : field_count,
            value     : rid_str,
            col_name  : "rid",
            col_width : aid_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_ENUM
         });
         field_count++;
      end
      
      get_metadata.push_back('{
         index     : field_count,
         value     : exokay_str,
         col_name  : "exokay",
         col_width : exokay_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      get_metadata.push_back('{
         index     : field_count,
         value     : rvalidpar_str,
         col_name  : "rvalidpar",
         col_width : rvalidpar_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      if (cfg.rchk_width > 0) begin
         rchk_str = rchk_str.substr(rchk_str.len() - (cfg.rchk_width/4), rchk_str.len()-1);
         get_metadata.push_back('{
            index     : field_count,
            value     : rchk_str,
            col_name  : "rchk",
            col_width : rchk_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_ENUM
         });
         field_count++;
      end
   end
   
endfunction : get_metadata


`endif // __UVMA_OBI_SLV_R_SEQ_ITEM_SV__
