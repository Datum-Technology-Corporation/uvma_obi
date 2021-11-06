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


`ifndef __UVMA_OBI_SLV_DRV_VSEQ_SV__
`define __UVMA_OBI_SLV_DRV_VSEQ_SV__


/**
 * TODO Describe uvma_obi_slv_drv_vseq_c
 */
class uvma_obi_slv_drv_vseq_c extends uvma_obi_base_vseq_c;
   
   `uvm_object_utils(uvma_obi_slv_drv_vseq_c)
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_slv_drv_vseq");
   
   /**
    * TODO Describe uvma_obi_slv_drv_vseq_c::body()
    */
   extern virtual task body();
   
   /**
    * TODO Describe uvma_obi_slv_drv_vseq_c::drive_a()
    */
   extern virtual task drive_a();
   
   /**
    * TODO Describe uvma_obi_slv_drv_vseq_c::response_loop()
    */
   extern virtual task response_loop();
   
   /**
    * TODO Describe uvma_obi_slv_base_vseq_c::wait_clk_a()
    */
   extern task wait_clk_a();
   
   /**
    * TODO Describe uvma_obi_slv_base_vseq_c::wait_clk_r()
    */
   extern task wait_clk_r();
   
endclass : uvma_obi_slv_drv_vseq_c


function uvma_obi_slv_drv_vseq_c::new(string name="uvma_obi_slv_drv_vseq");
   
   super.new(name);
   
endfunction : new


task uvma_obi_slv_drv_vseq_c::body();
   
   forever begin
      fork
         begin
            wait (cntxt.reset_state == UVML_RESET_STATE_POST_RESET) begin
               drive_a();
            end
         end
         
         begin
            wait (cntxt.reset_state == UVML_RESET_STATE_POST_RESET) begin
               response_loop();
            end
         end
         
         begin
            wait (cntxt.reset_state == UVML_RESET_STATE_POST_RESET);
            wait (cntxt.reset_state != UVML_RESET_STATE_POST_RESET);
         end
      join_any
      disable fork;
   end
   
endtask : body


task uvma_obi_slv_drv_vseq_c::drive_a();
   
   uvma_obi_slv_a_seq_item_c  slv_a_seq_item;
   
   forever begin
      // TODO Add ton/toff
      if ($urandom_range(0,1)) begin
         `uvm_create_on(slv_a_seq_item, p_sequencer.slv_a_sequencer)
         `uvm_rand_send_pri_with(slv_a_seq_item, `UVMA_OBI_SLV_DRV_SEQ_ITEM_PRI, {
            gnt == 1'b1;
         })
      end
      else begin
         wait_clk_a();
      end
   end
   
endtask : drive_a


task uvma_obi_slv_drv_vseq_c::response_loop();
   
   uvma_obi_mstr_a_mon_trn_c  trn        ;
   bit                        handled = 0;
   
   forever begin
      cntxt.mstr_a_req_e.wait_trigger();
      while (cntxt.drv_slv_outstanding_q.size()) begin
         trn = cntxt.drv_slv_outstanding_q.pop_front();
         handled = 0;
         foreach (cntxt.slv_handlers[jj]) begin
            cntxt.slv_handlers[jj].handle_mstr_req(trn, handled);
            if (handled) begin
               break;
            end
         end
         if (!handled) begin
            `uvm_warning("OBI_SLV_DRV_VSEQ", $sformatf("Request from MSTR not handled:\n%s", trn.sprint()))
         end
      end
   end
   
endtask : response_loop


task uvma_obi_slv_drv_vseq_c::wait_clk_a();
   
   @(cntxt.vif.drv_slv_a_cb);
   
endtask : wait_clk_a


task uvma_obi_slv_drv_vseq_c::wait_clk_r();
   
   @(cntxt.vif.drv_slv_r_cb);
   
endtask : wait_clk_r


`endif // __UVMA_OBI_BASE_SEQ_SV__
