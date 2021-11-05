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


`ifndef __UVMA_OBI_SLV_BASE_VSEQ_SV__
`define __UVMA_OBI_SLV_BASE_VSEQ_SV__


/**
 * TODO Describe uvma_obi_slv_base_vseq_c
 */
class uvma_obi_slv_base_vseq_c extends uvma_obi_base_vseq_c;
   
   `uvm_object_utils(uvma_obi_slv_base_vseq_c)
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_slv_base_vseq");
   
   /**
    * TODO Describe uvma_obi_slv_base_vseq_c::body()
    */
   extern virtual task body();
   
   /**
    * TODO Describe uvma_obi_slv_base_vseq_c::wait_clk_a()
    */
   extern task wait_clk_a();
   
   /**
    * TODO Describe uvma_obi_slv_base_vseq_c::wait_clk_r()
    */
   extern task wait_clk_r();
   
endclass : uvma_obi_slv_base_vseq_c


function uvma_obi_slv_base_vseq_c::new(string name="uvma_obi_slv_base_vseq");
   
   super.new(name);
   
endfunction : new


task uvma_obi_slv_base_vseq_c::body();
   
   
   
endtask : body


task uvma_obi_slv_base_vseq_c::wait_clk_a();
   
   @(cntxt.vif.drv_slv_a_cb);
   
endtask : wait_clk_a


task uvma_obi_slv_base_vseq_c::wait_clk_r();
   
   @(cntxt.vif.drv_slv_r_cb);
   
endtask : wait_clk_r


`endif // __UVMA_OBI_SLV_BASE_VSEQ_SV__
