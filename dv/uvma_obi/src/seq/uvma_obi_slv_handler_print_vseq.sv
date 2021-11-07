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


`ifndef __UVMA_OBI_SLV_HANDLER_PRINT_VSEQ_SV__
`define __UVMA_OBI_SLV_HANDLER_PRINT_VSEQ_SV__


/**
 * TODO Describe uvma_obi_slv_handler_print_vseq_c
 */
class uvma_obi_slv_handler_print_vseq_c extends uvma_obi_slv_handler_base_vseq_c;
   
   uvma_obi_addr_l_t  print_location; ///< 
   
   
   `uvm_object_utils(uvma_obi_slv_handler_print_vseq_c)
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_slv_handler_print_vseq");
   
   /**
    * TODO Describe uvma_obi_slv_handler_print_vseq_c::body()
    */
   extern virtual task body();
   
   /**
    * TODO Describe uvma_obi_slv_handler_print_vseq_c::body()
    */
   extern virtual task handle_mstr_req(ref uvma_obi_mstr_a_mon_trn_c trn, bit handled);
   
endclass : uvma_obi_slv_handler_print_vseq_c


function uvma_obi_slv_handler_print_vseq_c::new(string name="uvma_obi_slv_handler_print_vseq");
   
   super.new(name);
   
endfunction : new


task uvma_obi_slv_handler_print_vseq_c::body();
   
   p_sequencer.cntxt.slv_handlers.push_back(this);
   forever begin
      wait_clk();
   end
   
endtask : body


task uvma_obi_slv_handler_print_vseq_c::handle_mstr_req(ref uvma_obi_mstr_a_mon_trn_c trn, bit handled);
   
   uvma_obi_data_b_t          readback_data ;
   uvma_obi_slv_r_seq_item_c  slv_r_seq_item;
   
   // TODO Add response latency cycles
   
   `uvm_info("OBI_SLV_PRINT_VSEQ", $sformatf("Responding to \n%s", trn.sprint()), UVM_DEBUG)
   if ((trn.addr === print_location) && (trn.we === 1'b1)) begin
      `uvm_info("OBI_SLV_PRINT_VSEQ", $sformatf("Call to print location with data: '%s'", trn.wdata), UVM_NONE)
      do begin
         `uvm_create_on(slv_r_seq_item, p_sequencer.slv_r_sequencer)
         slv_r_seq_item.rvalid = 1'b1;
         slv_r_seq_item.err    = 1'b0;
         `uvm_send_pri(slv_r_seq_item, `UVMA_OBI_SLV_DRV_SEQ_ITEM_PRI)
      end while (slv_r_seq_item.rready !== 1'b1);
      
      `uvm_info("OBI_SLV_PRINT_VSEQ", $sformatf("Responded to \n%s\nwith\n%s", trn.sprint(), slv_r_seq_item.sprint()), UVM_DEBUG)
      handled = 1;
   end
   else begin
      handled = 0;
   end
   
endtask : handle_mstr_req


`endif // __UVMA_OBI_SLV_HANDLER_PRINT_VSEQ_SV__
