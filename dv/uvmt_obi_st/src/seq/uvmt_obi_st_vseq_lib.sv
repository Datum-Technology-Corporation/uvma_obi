// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_OBI_ST_VSEQ_LIB_SV__
`define __UVMT_OBI_ST_VSEQ_LIB_SV__


/**
 * Object holding virtual sequence library for Open Bus Interface test cases.
 */
class uvmt_obi_st_vseq_lib_c extends uvm_sequence_library#(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);
   
   `uvm_object_utils          (uvmt_obi_st_vseq_lib_c)
   `uvm_sequence_library_utils(uvmt_obi_st_vseq_lib_c)
   
   
   /**
    * Initializes sequence library.
    */
   extern function new(string name="uvmt_obi_st_vseq_lib");
   
endclass : uvmt_obi_st_vseq_lib_c


function uvmt_obi_st_vseq_lib_c::new(string name="uvmt_obi_st_vseq_lib");
   
   super.new(name);
   init_sequence_library();
   
   // TODO Add sequences to uvmt_obi_st_vseq_lib_c
   //      Ex: add_sequence(uvmt_obi_st_abc_vseq_c::get_type());
   
endfunction : new


`endif // __UVMT_OBI_ST_VSEQ_LIB_SV__
