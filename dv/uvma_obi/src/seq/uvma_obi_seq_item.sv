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


`ifndef __UVMA_OBI_SEQ_ITEM_SV__
`define __UVMA_OBI_SEQ_ITEM_SV__


/**
 * Object created by Open Bus Interface agent sequences extending uvma_obi_seq_base_c.
 */
class uvma_obi_seq_item_c extends uvml_seq_item_c;
   
   uvma_obi_cfg_c  cfg;
   
   // Data
   rand uvma_obi_access_type_enum  access_type; ///< Read or write
   rand uvma_obi_addr_b_t          address    ; ///< Read/Write Address
   rand uvma_obi_data_b_t          data       ; ///< Write Data
   rand uvma_obi_be_b_t            be         ; ///< Byte Enable. Is set for the bytes to write/read.
   rand uvma_obi_auser_b_t         auser      ; ///< Address Phase User signals. Valid for both read and write transactions.
   rand uvma_obi_wuser_b_t         wuser      ; ///< Additional Address Phase User signals. Only valid for write transactions.
   rand uvma_obi_ruser_b_t         ruser      ; ///< Response phase User signals. Only valid for read transactions. Undefined for write transactions.
   rand uvma_obi_id_b_t            id         ; ///< Address/Response Phase transaction identifier.
   rand uvma_obi_atop_b_t          atop       ; ///< TODO Describe uvma_obi_seq_item_c::atop
   rand uvma_obi_memtype_b_t       memtype    ; ///< TODO Describe uvma_obi_seq_item_c::memtype
   rand uvma_obi_prot_b_t          prot       ; ///< TODO Describe uvma_obi_seq_item_c::prot
   
   // Metadata
   rand int unsigned  req_latency   ; ///< Number of cycles before req is asserted
   rand int unsigned  rready_latency; ///< Number of cycles before rready is asserted after rvalid has been asserted
   rand int unsigned  rready_hold   ; ///< Number of cycles to keep rready asserted after rvalid has been de-asserted
   rand int unsigned  tail_length   ; ///< Number of idle cycles after rready has been de-asserted
   
   
   `uvm_object_utils_begin(uvma_obi_seq_item_c)
      `uvm_field_enum(uvma_obi_access_type_enum, access_type, UVM_DEFAULT               )
      `uvm_field_int (                           address    , UVM_DEFAULTT + UVM_NOPRINT)
      `uvm_field_int (                           data       , UVM_DEFAULTT + UVM_NOPRINT)
      `uvm_field_int (                           be         , UVM_DEFAULTT + UVM_NOPRINT)
      `uvm_field_int (                           auser      , UVM_DEFAULTT + UVM_NOPRINT)
      `uvm_field_int (                           wuser      , UVM_DEFAULTT + UVM_NOPRINT)
      `uvm_field_int (                           ruser      , UVM_DEFAULTT + UVM_NOPRINT)
      `uvm_field_int (                           id         , UVM_DEFAULTT + UVM_NOPRINT)
      `uvm_field_int (                           atop       , UVM_DEFAULTT + UVM_NOPRINT)
      `uvm_field_int (                           memtype    , UVM_DEFAULTT + UVM_NOPRINT)
      `uvm_field_int (                           prot       , UVM_DEFAULTT + UVM_NOPRINT)
      
      `uvm_field_int(req_latency   , UVM_DEFAULT + UVM_DEC + UVM_NOCOMPARE)
      `uvm_field_int(rready_latency, UVM_DEFAULT + UVM_DEC + UVM_NOCOMPARE)
      `uvm_field_int(rready_hold   , UVM_DEFAULT + UVM_DEC + UVM_NOCOMPARE)
      `uvm_field_int(tail_length   , UVM_DEFAULT + UVM_DEC + UVM_NOCOMPARE)
   `uvm_object_utils_end
   
   
   constraint default_cons {
      soft req_latency    == 0;
      soft rready_latency == 0;
      soft rready_hold    == 0;
      soft tail_length    == 0;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_seq_item");
   
   /**
    * TODO Describe uvma_obi_seq_item_c::do_print()
    */
   extern virtual function void do_print(uvm_printer printer);
   
   /**
    * TODO Describe uvma_obi_seq_item_c::get_metadata()
    */
   extern function uvml_metadata_t get_metadata();
   
endclass : uvma_obi_seq_item_c


function uvma_obi_seq_item_c::new(string name="uvma_obi_seq_item");
   
   super.new(name);
   
endfunction : new


function void uvma_obi_seq_item_c::do_print(uvm_printer printer);
   
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
         printer.print_field("id", id, cfg.id_width);
      end
      printer.print_field("err"    , err    , $bits(err    ));
      printer.print_field("exokay" , exokay , $bits(exokay ));
      printer.print_field("atop"   , atop   , $bits(atop   ));
      printer.print_field("memtype", memtype, $bits(memtype));
      printer.print_field("prot"   , prot   , $bits(prot   ));
   end
   
endfunction : do_print


function uvml_metadata_t uvma_obi_seq_item_c::get_metadata();
   
   int unsigned  field_count = 0;
   string  access_str  = (access == UVMA_OBI_ACCESS_READ) ? "READ" : "WRITE";
   string  address_str = $sformatf("%h", address);
   string  data_str    = $sformatf("%h", data   );
   string  be_str      = $sformatf("%b", be     );
   string  auser_str   = $sformatf("%h", auser  );
   string  wuser_str   = $sformatf("%h", wuser  );
   string  ruser_str   = $sformatf("%h", ruser  );
   string  id_str      = $sformatf("%h", id     );
   string  atop_str    = $sformatf("%h", atop   );
   string  memtype_str = $sformatf("%h", memtype);
   string  prot_str    = $sformatf("%h", prot   );
   
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
         id_str = id_str.substr(id_str.len() - (cfg.id_width/4), id_str.len()-1);
         get_metadata.push_back('{
            index     : field_count,
            value     : id_str,
            col_name  : "id",
            col_width : id_str.len(),
            col_align : UVML_TEXT_ALIGN_RIGHT,
            data_type : UVML_FIELD_QUEUE_INT
         });
         field_count++;
      end
      
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
   end
   
endfunction : get_metadata


`endif // __UVMA_OBI_SEQ_ITEM_SV__
