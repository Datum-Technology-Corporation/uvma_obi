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
    * Fetch mask for printing
    */
   extern function uvma_obi_data_l_t get_be_bitmask();

   /**
    * Print data with -- for non transmitted bytes
    */
   extern function string get_data_str();
   
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
   
   logic [7:0]  lower_n_bytes[$];
   logic [7:0]  upper_n_bytes[$];
   string       data_str   = "";
   string       size_str   = $sformatf("%0d", size );
   string       tid_str    = $sformatf("%h" , tid  );
   string       tdest_str  = $sformatf("%h" , tdest);
   string       tuser_str  = $sformatf("%h" , tuser);
   
   if (cfg != null) begin
      tid_str   = tid_str  .substr(tid_str  .len() - (cfg.tid_width  /4), tid_str  .len()-1);
      tdest_str = tdest_str.substr(tdest_str.len() - (cfg.tdest_width/4), tdest_str.len()-1);
      tuser_str = tuser_str.substr(tuser_str.len() - (cfg.tuser_width/4), tuser_str.len()-1);
      
      if (size > uvma_axis_logging_num_data_bytes) begin
         // Log first n bytes and last n bytes
         for (int unsigned ii=0; ii<uvma_axis_logging_num_data_bytes; ii++) begin
            lower_n_bytes.push_back(data[ii]);
         end
         for (int unsigned ii=0; ii<uvma_axis_logging_num_data_bytes; ii++) begin
            upper_n_bytes.push_back(data[(size - uvma_axis_logging_num_data_bytes) + ii]);
         end
         data_str = {log_bytes(upper_n_bytes), " ... ", log_bytes(lower_n_bytes)};
      end
      else begin
         // Log all data bytes
         data_str = log_bytes(data);
      end
      
      get_metadata[0] = '{
         index     : 0,
         value     : tid_str,
         col_name  : "tid",
         col_width : cfg.tid_width/4,
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      };
      
      get_metadata[1] = '{
         index     : 1,
         value     : tdest_str,
         col_name  : "tdest",
         col_width : cfg.tdest_width/4,
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      };
      
      get_metadata[2] = '{
         index     : 2,
         value     : tuser_str,
         col_name  : "tuser",
         col_width : cfg.tuser_width/4,
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      };
      
      get_metadata[3] = '{
         index     : 3,
         value     : size_str,
         col_name  : "size",
         col_width : 4,
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_INT
      };
      
      get_metadata[4] = '{
         index     : 4,
         value     : data_str,
         col_name  : "data",
         col_width : (uvma_axis_logging_num_data_bytes*5)+3,
         col_align : UVML_TEXT_ALIGN_RIGHT,
         data_type : UVML_FIELD_QUEUE_INT
      };
   end
   
endfunction : get_metadata


function uvma_obi_data_l_t uvma_obi_mon_trn_c::get_be_bitmask();

   uvma_obi_data_l_t bitmask = '0;

   for (int i = 0; i < cfg.data_width / 8; i++) begin
      if (be[i]) bitmask |= 'hff << (i*8);
   end

   return bitmask;

endfunction : get_be_bitmask


function string uvma_obi_mon_trn_c::get_data_str();

   uvma_obi_data_l_t be_bitmask = this.get_be_bitmask();
   string data_str;

   for (int i = 0; i < cfg.data_width / 8; i++) begin
      if (be[i])
         data_str = $sformatf("%02x%s", this.data[i*8+:8], data_str);
      else
         data_str = $sformatf("--%s", data_str);
   end

   return data_str;

endfunction : get_data_str


`endif // __UVMA_OBI_MON_TRN_SV__
