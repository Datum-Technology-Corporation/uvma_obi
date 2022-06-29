// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_OBI_ST_VSEQ_LIB_SV__
`define __UVME_OBI_ST_VSEQ_LIB_SV__


`include "uvme_obi_st_base_vseq.sv"
`include "uvme_obi_st_reads_vseq.sv"
`include "uvme_obi_st_writes_vseq.sv"
`include "uvme_obi_st_all_access_vseq.sv"
`include "uvme_obi_st_print_vseq.sv"


/**
 * Sequence library for Open Bus Interface environment.
 */
class uvme_obi_st_vseq_lib_c extends uvm_sequence_library #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);
   
   `uvm_object_utils          (uvme_obi_st_vseq_lib_c)
   `uvm_sequence_library_utils(uvme_obi_st_vseq_lib_c)
   
   
   /**
    * Initializes sequence library.
    */
   extern function new(string name="uvme_obi_st_vseq_lib");
   
endclass : uvme_obi_st_vseq_lib_c


function uvme_obi_st_vseq_lib_c::new(string name="uvme_obi_st_vseq_lib");
   
   super.new(name);
   init_sequence_library();
   add_sequence(uvme_obi_st_reads_vseq_c     ::get_type());
   add_sequence(uvme_obi_st_writes_vseq_c    ::get_type());
   add_sequence(uvme_obi_st_all_access_vseq_c::get_type());
   add_sequence(uvme_obi_st_print_vseq_c     ::get_type());
   
endfunction : new


`endif // __UVME_OBI_ST_VSEQ_LIB_SV__
