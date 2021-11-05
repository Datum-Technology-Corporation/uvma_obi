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


`ifndef __UVMA_OBI_MSTR_DRV_VSEQ_SV__
`define __UVMA_OBI_MSTR_DRV_VSEQ_SV__


/**
 * TODO Describe uvma_obi_mstr_drv_vseq_c
 */
class uvma_obi_mstr_drv_vseq_c extends uvma_obi_mstr_base_vseq_c;
   
   `uvm_object_utils(uvma_obi_mstr_drv_vseq_c)
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_mstr_drv_vseq");
   
   /**
    * TODO Describe uvma_obi_mstr_drv_vseq_c::drive()
    */
   extern virtual drive(ref uvma_obi_seq_item_c seq_item);
   
endclass : uvma_obi_mstr_drv_vseq_c


function uvma_obi_mstr_drv_vseq_c::new(string name="uvma_obi_mstr_drv_vseq");
   
   super.new(name);
   
endfunction : new


task uvma_obi_mstr_drv_vseq_c::drive(ref uvma_obi_seq_item_c seq_item);

   uvma_obi_mstr_a_seq_item_c  mstr_a_seq_item;
   uvma_obi_mstr_r_seq_item_c  mstr_r_seq_item;
   
   // TODO Implement latencies
   do begin
      `uvm_create_on(mstr_a_seq_item, p_sequencer.mstr_a_sequencer)
      `uvm_rand_send_pri_with(mstr_a_seq_item, `UVMA_OBI_MSTR_DRV_SEQ_ITEM_PRI, {
         req     == 1'b1;
         addr    == seq_item.address    ;
         we      == seq_item.access_type;
         be      == seq_item.be         ;
         wdata   == seq_item.data       ;
         auser   == seq_item.auser      ;
         wuser   == seq_item.wuser      ;
         aid     == seq_item.id         ;
         atop    == seq_item.atop       ;
         memtype == seq_item.memtype    ;
         prot    == seq_item.prot       ;
      })
   end while(mstr_a_seq_item.gnt !== 1'b1);
   
   do begin
      `uvm_create_on(mstr_r_seq_item, p_sequencer.mstr_r_sequencer)
      `uvm_rand_send_pri_with(mstr_r_seq_item, `UVMA_OBI_MSTR_DRV_SEQ_ITEM_PRI, {
         rready == 1'b1;
      })
   end while(mstr_r_seq_item.rvalid !== 1'b1);
   
   if (seq_item.access_type == UVMA_OBI_ACCESS_READ) begin
      seq_item.data = cntxt.vif.rdata;
   end
   
endtask : drive


`endif // __UVMA_OBI_BASE_SEQ_SV__
