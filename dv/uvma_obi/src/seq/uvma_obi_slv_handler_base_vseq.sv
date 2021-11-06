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


`ifndef __UVMA_OBI_SLV_HANDLER_BASE_VSEQ_SV__
`define __UVMA_OBI_SLV_HANDLER_BASE_VSEQ_SV__


/**
 * TODO Describe uvma_obi_slv_handler_base_vseq_c
 */
class uvma_obi_slv_handler_base_vseq_c extends uvma_obi_base_vseq_c;
   
   `uvm_object_utils(uvma_obi_slv_handler_base_vseq_c)
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_slv_handler_base_vseq");
   
   /**
    * TODO Describe uvma_obi_slv_handler_base_vseq_c::body()
    */
   extern virtual task body();
   
   /**
    * TODO Describe uvma_obi_slv_handler_base_vseq_c::handle_mstr_req()
    */
   extern virtual task handle_mstr_req(ref uvma_obi_mstr_a_mon_trn_c trn, bit handled);
   
   /**
    * TODO Describe uvma_obi_slv_handler_base_vseq_c::mem_read()
    */
   extern function uvma_obi_data_b_t mem_read(uvma_obi_addr_b_t address);
   
   /**
    * TODO Describe uvma_obi_slv_handler_base_vseq_c::mem_write()
    */
   extern function void mem_write(uvma_obi_addr_b_t address, uvma_obi_data_b_t data);
   
   /**
    * TODO Describe uvma_obi_slv_handler_base_vseq_c::wait_clk()
    */
   extern task wait_clk();
   
endclass : uvma_obi_slv_handler_base_vseq_c


function uvma_obi_slv_handler_base_vseq_c::new(string name="uvma_obi_slv_handler_base_vseq");
   
   super.new(name);
   
endfunction : new


task uvma_obi_slv_handler_base_vseq_c::body();
   
   p_sequencer.cntxt.slv_handlers.push_front(this);
   forever begin
      wait_clk();
   end
   
endtask : body


task uvma_obi_slv_handler_base_vseq_c::handle_mstr_req(ref uvma_obi_mstr_a_mon_trn_c trn, bit handled);
   
   // Default behavior does nothing
   
endtask : handle_mstr_req


function uvma_obi_data_b_t uvma_obi_slv_handler_base_vseq_c::mem_read(uvma_obi_addr_b_t address);
   
   bit [7:0]  current_byte;
   
   for (int unsigned ii=0; ii<(cfg.data_width/8); ii++) begin
      current_byte = cntxt.memory.read(address+ii);
      for (int unsigned jj=0; jj<8; jj++) begin
         mem_read[jj] = current_byte[jj];
      end
   end
   
endfunction : mem_read


function void uvma_obi_slv_handler_base_vseq_c::mem_write(uvma_obi_addr_b_t address, uvma_obi_data_b_t data);
   
   bit [7:0]  current_byte;
   
   for (int unsigned ii=0; ii<(cfg.data_width/8); ii++) begin
      current_byte = 0;
      for (int unsigned jj=0; jj<8; jj++) begin
         current_byte[jj] = data[jj];
      end
      cntxt.memory.write(address+ii, current_byte);
   end
   
endfunction : mem_write


task uvma_obi_slv_handler_base_vseq_c::wait_clk();
   
   @(cntxt.vif.drv_slv_r_cb);
   
endtask : wait_clk


`endif // __UVMA_OBI_SLV_HANDLER_BASE_VSEQ_SV__
