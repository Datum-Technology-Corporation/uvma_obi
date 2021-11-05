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


`ifndef __UVMA_OBI_RAND_ACCESS_VSEQ_SV__
`define __UVMA_OBI_RAND_ACCESS_VSEQ_SV__


/**
 * TODO Describe uvma_obi_rand_access_vseq_c
 */
class uvma_obi_rand_access_vseq_c extends uvma_obi_base_vseq_c;
   
   rand int unsigned  num_access; ///< 
   rand int unsigned  pct_reads ; ///< 
   rand int unsigned  pct_writes; ///< 
   rand int unsigned  min_gap   ; ///< 
   rand int unsigned  max_gap   ; ///< 
   
   
   `uvm_object_utils_begin(uvma_obi_rand_access_vseq_c)
      `uvm_field_int(pct_reads , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(pct_writes, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap   , UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end
   
   
   constraint limits_cons {
      pct_reads + pct_writes == 100;
      num_access <= 100;
      min_gap <= max_gap;
      max_gap <= 25;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_rand_access_vseq");
   
   /**
    * TODO Describe uvma_obi_rand_access_vseq_c::body()
    */
   extern virtual task body();
   
endclass : uvma_obi_rand_access_vseq_c


function uvma_obi_rand_access_vseq_c::new(string name="uvma_obi_rand_access_vseq");
   
   super.new(name);
   
endfunction : new


task uvma_obi_rand_access_vseq_c::body();
   
   uvma_obi_seq_item_c  req;
   
   for (int unsigned ii=0; ii<num_access; ii++) begin
      `uvm_create_on(req, p_sequencer)
      
      if ($urandom_range(0,100) > pct_reads) begin
         `uvm_send_with(req, {
            access_type == UVMA_OBI_ACCESS_WRITE;
         })
      end
      else begin
         `uvm_send_with(req, {
            access_type == UVMA_OBI_ACCESS_READ;
         })
      end
      
      repeat ($urandom_range(min_gap, max_gap)) begin
         @(cntxt.vif.mon_cb);
      end
   end
   
endtask : body


`endif // __UVMA_OBI_RAND_ACCESS_VSEQ_SV__
