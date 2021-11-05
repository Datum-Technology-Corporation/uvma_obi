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


`ifndef __UVMA_OBI_SLV_VSEQ_LIB_SV__
`define __UVMA_OBI_SLV_VSEQ_LIB_SV__


`include "uvma_obi_slv_base_vseq.sv"
`include "uvma_obi_slv_drv_vseq.sv"
`include "uvma_obi_slv_handler_base_vseq.sv"
`include "uvma_obi_slv_handler_mem_vseq.sv"


/**
 * Object holding sequence library for OBI agent.
 */
class uvma_obi_slv_vseq_lib_c extends uvm_sequence_library #(
   .REQ(uvma_obi_seq_item_c),
   .RSP(uvma_obi_seq_item_c)
);
   
   `uvm_object_utils          (uvma_obi_slv_vseq_lib_c)
   `uvm_sequence_library_utils(uvma_obi_slv_vseq_lib_c)
   
   
   /**
    * Initializes sequence library
    */
   extern function new(string name="uvma_obi_slv_vseq_lib");
   
endclass : uvma_obi_slv_vseq_lib_c


function uvma_obi_slv_vseq_lib_c::new(string name="uvma_obi_slv_vseq_lib");
   
   super.new(name);
   init_sequence_library();
   
   add_sequence(uvma_obi_slv_drv_vseq_c        ::get_type());
   add_sequence(uvma_obi_slv_handler_mem_vseq_c::get_type());
   
endfunction : new


`endif // __UVMA_OBI_SLV_VSEQ_LIB_SV__
