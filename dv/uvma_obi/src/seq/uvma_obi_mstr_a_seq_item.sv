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


`ifndef __UVMA_OBI_MSTR_A_SEQ_ITEM_SV__
`define __UVMA_OBI_MSTR_A_SEQ_ITEM_SV__


/**
 * Object created by Open Bus Interface agent sequences extending uvma_obi_seq_base_c.
 */
class uvma_obi_mstr_a_seq_item_c extends uvml_seq_item_c;
   
   uvma_obi_cfg_c  cfg; ///< Agent configuration handle
   
   // Data
   rand uvma_obi_req_b_t      req    ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::req
   rand uvma_obi_addr_b_t     addr   ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::addr
   rand uvma_obi_we_b_t       we     ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::we
   rand uvma_obi_be_b_t       be     ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::be
   rand uvma_obi_data_b_t     wdata  ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::wdata
   rand uvma_obi_auser_b_t    auser  ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::auser
   rand uvma_obi_wuser_b_t    wuser  ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::wuser
   rand uvma_obi_id_b_t       aid    ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::aid
   rand uvma_obi_atop_b_t     atop   ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::atop
   rand uvma_obi_memtype_b_t  memtype; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::memtype
   rand uvma_obi_prot_b_t     prot   ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::prot
   rand uvma_obi_reqpar_b_t   reqpar ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::reqpar
   rand uvma_obi_achk_b_t     achk   ; ///< TODO Describe uvma_obi_mstr_a_seq_item_c::achk
   
   // Metadata
   uvma_obi_gnt_l_t  gnt;
   
   
   `uvm_object_utils_begin(uvma_obi_mstr_a_seq_item_c)
      `uvm_field_int(req    , UVM_DEFAULT              )
      `uvm_field_int(addr   , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int(we     , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int(be     , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int(wdata  , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int(auser  , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int(wuser  , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int(aid    , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int(atop   , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int(memtype, UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int(prot   , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int(reqpar , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int(achk   , UVM_DEFAULT + UVM_NOPRINT)
   `uvm_object_utils_end
   
   
   constraint default_cons {
      soft req != reqpar;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_mstr_a_seq_item");
   
   /**
    * TODO Describe uvma_obi_mstr_a_seq_item_c::do_print()
    */
   extern function void do_print(uvm_printer printer);
   
   /**
    * TODO Describe uvma_obi_mstr_a_seq_item_c::get_metadata()
    */
   extern function uvml_metadata_t get_metadata();
   
endclass : uvma_obi_mstr_a_seq_item_c


function uvma_obi_mstr_a_seq_item_c::new(string name="uvma_obi_mstr_a_seq_item");
   
   super.new(name);
   
endfunction : new


function void uvma_obi_mstr_a_seq_item_c::do_print(uvm_printer printer);
   
   super.do_print(printer);
   
   if (cfg != null) begin
      printer.print_field("addr"  , addr , cfg.addr_width );
      printer.print_field("we"    , we   , $bits(we)      );
      printer.print_field("be"    , we   , cfg.data_width );
      printer.print_field("wdata" , wdata, cfg.data_width );
      
      if (cfg.auser_width > 0) begin
         printer.print_field("auser", auser, cfg.auser_width);
      end
      if (cfg.wuser_width > 0) begin
         printer.print_field("wuser", auser, cfg.wuser_width);
      end
      if (cfg.id_width > 0) begin
         printer.print_field("aid", aid, cfg.id_width);
      end
      printer.print_field("atop"   , atop   , $bits(atop   ));
      printer.print_field("memtype", memtype, $bits(memtype));
      printer.print_field("prot"   , prot   , $bits(prot   ));
      printer.print_field("reqpar" , reqpar , $bits(reqpar ));
      
      if (cfg.achk_width > 0) begin
         printer.print_field("achk", achk, cfg.achk_width);
      end
   end
   
endfunction : do_print


function uvml_metadata_t uvma_obi_mstr_a_seq_item_c::get_metadata();
   
   int unsigned  field_count = 0;
   string  addr_str    = $sformatf("%h", addr);
   string  we_str      = (we === 1'b1) ? "  W" : "R  ";
   string  be_str      = $sformatf("%b", be     );
   string  wdata_str   = $sformatf("%h", wdata  );
   string  auser_str   = $sformatf("%h", auser  );
   string  wuser_str   = $sformatf("%h", wuser  );
   string  aid_str     = $sformatf("%h", aid    );
   string  atop_str    = $sformatf("%h", atop   );
   string  memtype_str = $sformatf("%h", memtype);
   string  prot_str    = $sformatf("%h", prot   );
   string  reqpar_str  = $sformatf("%b", reqpar );
   string  achk_str    = $sformatf("%h", achk   );
   
   if (((req === 1'b1) && (gnt === 1'b1)) && (cfg != null)) begin
      addr_str = addr_str.substr(addr_str.len() - (cfg.addr_width/4), addr_str.len()-1);
      get_metadata.push_back('{
         index     : field_count,
         value     : addr_str,
         col_name  : "addr",
         col_width : addr_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      get_metadata.push_back('{
         index     : field_count,
         value     : we_str,
         col_name  : "r/w",
         col_width : we_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      get_metadata.push_back('{
         index     : field_count,
         value     : wdata_str,
         col_name  : "be",
         col_width : wdata_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      wdata_str = wdata_str.substr(wdata_str.len() - (cfg.data_width/4), wdata_str.len()-1);
      get_metadata.push_back('{
         index     : field_count,
         value     : wdata_str,
         col_name  : "wdata",
         col_width : wdata_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      if (cfg.auser_width > 0) begin
         auser_str = auser_str.substr(auser_str.len() - (cfg.auser_width/4), auser_str.len()-1);
         get_metadata.push_back('{
            index     : field_count,
            value     : auser_str,
            col_name  : "auser",
            col_width : auser_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_ENUM
         });
         field_count++;
      end
      
      if (cfg.wuser_width > 0) begin
         wuser_str = wuser_str.substr(wuser_str.len() - (cfg.wuser_width/4), wuser_str.len()-1);
         get_metadata.push_back('{
            index     : field_count,
            value     : wuser_str,
            col_name  : "wuser",
            col_width : wuser_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_ENUM
         });
         field_count++;
      end
      
      if (cfg.id_width > 0) begin
         aid_str = aid_str.substr(aid_str.len() - (cfg.id_width/4), aid_str.len()-1);
         get_metadata.push_back('{
            index     : field_count,
            value     : aid_str,
            col_name  : "aid",
            col_width : aid_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_ENUM
         });
         field_count++;
      end
      
      get_metadata.push_back('{
         index     : field_count,
         value     : atop_str,
         col_name  : "atop",
         col_width : atop_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      get_metadata.push_back('{
         index     : field_count,
         value     : memtype_str,
         col_name  : "memtype",
         col_width : memtype_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      get_metadata.push_back('{
         index     : field_count,
         value     : prot_str,
         col_name  : "prot",
         col_width : prot_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      get_metadata.push_back('{
         index     : field_count,
         value     : reqpar_str,
         col_name  : "reqpar",
         col_width : reqpar_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      if (cfg.achk_width > 0) begin
         achk_str = achk_str.substr(achk_str.len() - (cfg.achk_width/4), achk_str.len()-1);
         get_metadata.push_back('{
            index     : field_count,
            value     : achk_str,
            col_name  : "achk",
            col_width : achk_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_ENUM
         });
         field_count++;
      end
   end
   
endfunction : get_metadata


`endif // __UVMA_OBI_MSTR_A_SEQ_ITEM_SV__
