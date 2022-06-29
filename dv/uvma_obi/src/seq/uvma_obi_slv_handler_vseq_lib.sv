// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_OBI_SLV_HANDLER_VSEQ_LIB_SV__
`define __UVMA_OBI_SLV_HANDLER_VSEQ_LIB_SV__


`include "uvma_obi_slv_handler_base_vseq.sv"
`include "uvma_obi_slv_handler_mem_vseq.sv"
`include "uvma_obi_slv_handler_print_vseq.sv"


/**
 * Object holding sequence library for OBI agent.
 */
class uvma_obi_slv_handler_vseq_lib_c extends uvml_vseq_lib_c #(
   .REQ(uvma_obi_seq_item_c),
   .RSP(uvma_obi_seq_item_c)
);
   
   `uvm_object_utils          (uvma_obi_slv_handler_vseq_lib_c)
   `uvm_sequence_library_utils(uvma_obi_slv_handler_vseq_lib_c)
   
   
   /**
    * Initializes sequence library
    */
   extern function new(string name="uvma_obi_slv_handler_vseq_lib");
   
endclass : uvma_obi_slv_handler_vseq_lib_c


function uvma_obi_slv_handler_vseq_lib_c::new(string name="uvma_obi_slv_handler_vseq_lib");
   
   super.new(name);
   init_sequence_library();
   
   add_sequence(uvma_obi_slv_handler_mem_vseq_c  ::get_type());
   add_sequence(uvma_obi_slv_handler_print_vseq_c::get_type());
   
endfunction : new


`endif // __UVMA_OBI_SLV_HANDLER_VSEQ_LIB_SV__
