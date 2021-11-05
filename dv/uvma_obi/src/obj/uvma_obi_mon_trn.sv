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


`ifndef __UVMA_OBI_MON_TRN_SV__
`define __UVMA_OBI_MON_TRN_SV__


/**
 * Object rebuilt from the Open Bus Interface monitor.  Analog of uvma_obi_seq_item_c.
 */
class uvma_obi_mon_trn_c extends uvml_mon_trn_c;
   
   uvma_obi_cfg_c  cfg;
   
   // Data
   uvma_obi_access_type_enum  access_type; ///< Read or write
   uvma_obi_addr_l_t          address    ; ///< Read/Write Address
   uvma_obi_data_l_t          data       ; ///< Read/Write Data
   uvma_obi_be_l_t            be         ; ///< Byte Enable. Is set for the bytes to write/read.
   uvma_obi_auser_l_t         auser      ; ///< Address Phase User signals. Valid for both read and write transactions. (1p2 only)
   uvma_obi_wuser_l_t         wuser      ; ///< Additional Address Phase User signals. Only valid for write transactions. (1p2 only)
   uvma_obi_ruser_l_t         ruser      ; ///< Response phase User signals. Only valid for read transactions. Undefined for write transactions. (1p2 only)
   uvma_obi_id_l_t            aid        ; ///< Address Phase transaction identifier. (1p2 only)
   uvma_obi_id_l_t            rid        ; ///< Address Phase transaction identifier. (1p2 only)
   uvma_obi_err_l_t           err        ; ///< Error (1p2 only)
   uvma_obi_exokay_l_t        exokay     ; ///< Exclusive access response (1p2 only)
   uvma_obi_atop_l_t          atop       ; ///< Atomic attributes of transaction (1p2 only)
   uvma_obi_memtype_l_t       memtype    ; ///< Bufferable and cacheable attributes of transactions (1p2 only)
   uvma_obi_prot_l_t          prot       ; ///< Memory access type and privilege level of transaction
   uvma_obi_achk_l_t          achk       ; ///< Address signal checksum
   uvma_obi_rchk_l_t          rchk       ; ///< Response signal checksum
   
   // Metadata
   int unsigned  req_latency   ; ///< Number of cycles before req is asserted
   int unsigned  rready_latency; ///< Number of cycles before rready is asserted after rvalid has been asserted
   int unsigned  rready_hold   ; ///< Number of cycles to keep rready asserted after rvalid has been de-asserted
   int unsigned  tail_length   ; ///< Number of idle cycles after rready has been de-asserted
   
   
   `uvm_object_utils_begin(uvma_obi_mon_trn_c)
      `uvm_field_enum(uvma_obi_access_type_enum, access_type, UVM_DEFAULT              )
      `uvm_field_int (                           address    , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           data       , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           be         , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           auser      , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           wuser      , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           ruser      , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           aid        , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           rid        , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           err        , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           atop       , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           memtype    , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           prot       , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           achk       , UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_int (                           rchk       , UVM_DEFAULT + UVM_NOPRINT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_mon_trn");
   
   /**
    * TODO Describe uvma_obi_mon_trn_c::do_print()
    */
   extern virtual function void do_print(uvm_printer printer);
   
   /**
    * TODO Describe uvma_obi_mon_trn_c::get_metadata()
    */
   extern function uvml_metadata_t get_metadata();
   
endclass : uvma_obi_mon_trn_c


function uvma_obi_mon_trn_c::new(string name="uvma_obi_mon_trn");
   
   super.new(name);
   
endfunction : new


function void uvma_obi_mon_trn_c::do_print(uvm_printer printer);
   
   super.do_print(printer);
   
   if (cfg != null) begin
      printer.print_field("address", address, cfg.addr_width  );
      printer.print_field("data"   , data   , cfg.data_width  );
      printer.print_field("be"     , be     , cfg.data_width/8);
      
      if (cfg.auser_width != 0) begin
         printer.print_field("auser", auser, cfg.auser_width);
      end
      if (cfg.wuser_width != 0) begin
         printer.print_field("wuser", wuser, cfg.wuser_width);
      end
      if (cfg.ruser_width != 0) begin
         printer.print_field("ruser", ruser, cfg.ruser_width);
      end
      if (cfg.id_width != 0) begin
         printer.print_field("aid", aid, cfg.id_width);
         printer.print_field("rid", rid, cfg.id_width);
      end
      printer.print_field("err"    , err    , $bits(err    ));
      printer.print_field("exokay" , exokay , $bits(exokay ));
      printer.print_field("atop"   , atop   , $bits(atop   ));
      printer.print_field("memtype", memtype, $bits(memtype));
      printer.print_field("prot"   , prot   , $bits(prot   ));
      
      if (cfg.achk_width != 0) begin
         printer.print_field("achk", achk, cfg.achk_width);
      end
      if (cfg.rchk_width != 0) begin
         printer.print_field("rchk", rchk, cfg.rchk_width);
      end
   end
   
endfunction : do_print


function uvml_metadata_t uvma_obi_mon_trn_c::get_metadata();
   
   int unsigned  field_count = 0;
   string  access_str  = (access == UVMA_OBI_ACCESS_READ) ? "READ" : "WRITE";
   string  address_str = $sformatf("%h", address);
   string  data_str    = $sformatf("%h", data   );
   string  be_str      = $sformatf("%b", be     );
   string  auser_str   = $sformatf("%h", auser  );
   string  wuser_str   = $sformatf("%h", wuser  );
   string  ruser_str   = $sformatf("%h", ruser  );
   string  aid_str     = $sformatf("%h", aid    );
   string  rid_str     = $sformatf("%h", rid    );
   string  err_str     = $sformatf("%h", err    );
   string  atop_str    = $sformatf("%h", atop   );
   string  memtype_str = $sformatf("%h", memtype);
   string  prot_str    = $sformatf("%h", prot   );
   string  achk_str    = $sformatf("%h", achk   );
   string  rchk_str    = $sformatf("%h", rchk   );
   
   if (cfg != null) begin
      get_metadata.push_back('{
         index     : field_count,
         value     : access_str,
         col_name  : "access",
         col_width : access_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_ENUM
      });
      field_count++;
      
      address_str = address_str.substr(address_str.len() - (cfg.addr_width/4), address_str.len()-1);
      get_metadata.push_back('{
         index     : field_count,
         value     : address_str,
         col_name  : "address",
         col_width : address_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      });
      field_count++;
      
      data_str = data_str.substr(data_str.len() - (cfg.data_width/4), data_str.len()-1);
      get_metadata.push_back('{
         index     : field_count,
         value     : data_str,
         col_name  : "data",
         col_width : data_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      });
      field_count++;
      
      be_str = be_str.substr(be_str.len() - cfg.data_width, be_str.len()-1);
      get_metadata.push_back('{
         index     : field_count,
         value     : be_str,
         col_name  : "be",
         col_width : be_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      });
      field_count++;
      
      auser_str = auser_str.substr(auser_str.len() - (cfg.auser_width/4), auser_str.len()-1);
      if (cfg.auser_width > 0) begin
         get_metadata.push_back('{
            index     : field_count,
            value     : auser_str,
            col_name  : "auser",
            col_width : auser_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_QUEUE_INT
         });
         field_count++;
      end
      
      wuser_str = wuser_str.substr(wuser_str.len() - (cfg.wuser_width/4), wuser_str.len()-1);
      if (cfg.wuser_width > 0) begin
         get_metadata.push_back('{
            index     : field_count,
            value     : wuser_str,
            col_name  : "wuser",
            col_width : wuser_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_QUEUE_INT
         });
         field_count++;
      end
      
      ruser_str = ruser_str.substr(ruser_str.len() - (cfg.ruser_width/4), ruser_str.len()-1);
      if (cfg.ruser_width > 0) begin
         get_metadata.push_back('{
            index     : field_count,
            value     : ruser_str,
            col_name  : "ruser",
            col_width : ruser_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_QUEUE_INT
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
            data_type : UVML_FIELD_QUEUE_INT
         });
         field_count++;
         
         rid_str = rid_str.substr(rid_str.len() - (cfg.id_width/4), rid_str.len()-1);
         get_metadata.push_back('{
            index     : field_count,
            value     : rid_str,
            col_name  : "rid",
            col_width : rid_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_QUEUE_INT
         });
         field_count++;
      end
      
      get_metadata.push_back('{
         index     : field_count,
         value     : err_str,
         col_name  : "err",
         col_width : err_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      });
      field_count++;
      
      get_metadata.push_back('{
         index     : field_count,
         value     : exokay_str,
         col_name  : "exokay",
         col_width : exokay_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      });
      field_count++;
      
      get_metadata.push_back('{
         index     : field_count,
         value     : atop_str,
         col_name  : "atop",
         col_width : atop_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      });
      field_count++;
      
      get_metadata.push_back('{
         index     : field_count,
         value     : memtype_str,
         col_name  : "memtype",
         col_width : memtype_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      });
      field_count++;
      
      get_metadata.push_back('{
         index     : field_count,
         value     : prot_str,
         col_name  : "prot",
         col_width : prot_str.len(),
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      });
      field_count++;
      
      achk_str = achk_str.substr(achk_str.len() - (cfg.achk_width/4), achk_str.len()-1);
      if (cfg.achk_width > 0) begin
         get_metadata.push_back('{
            index     : field_count,
            value     : achk_str,
            col_name  : "achk",
            col_width : achk_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_QUEUE_INT
         });
         field_count++;
      end
      
      rchk_str = rchk_str.substr(rchk_str.len() - (cfg.rchk_width/4), rchk_str.len()-1);
      if (cfg.rchk_width > 0) begin
         get_metadata.push_back('{
            index     : field_count,
            value     : rchk_str,
            col_name  : "rchk",
            col_width : rchk_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_QUEUE_INT
         });
         field_count++;
      end
   end
   
endfunction : get_metadata


`endif // __UVMA_OBI_MON_TRN_SV__
