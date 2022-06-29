// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_OBI_ST_ALL_ACCESS_VSEQ_SV__
`define __UVME_OBI_ST_ALL_ACCESS_VSEQ_SV__


/**
 * TODO Describe uvme_obi_st_all_access_vseq_c
 */
class uvme_obi_st_all_access_vseq_c extends uvme_obi_st_base_vseq_c;
   
   rand int unsigned  num_all_access;
   
   
   `uvm_object_utils_begin(uvme_obi_st_all_access_vseq_c)
      `uvm_field_int(num_all_access, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      soft num_all_access == 10;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_obi_st_all_access_vseq");
   
   /**
    * TODO Describe uvme_obi_st_all_access_vseq_c::body()
    */
   extern virtual task body();
   
endclass : uvme_obi_st_all_access_vseq_c


function uvme_obi_st_all_access_vseq_c::new(string name="uvme_obi_st_all_access_vseq");
   
   super.new(name);
   
endfunction : new


task uvme_obi_st_all_access_vseq_c::body();
   
   uvma_obi_seq_item_c  _req;
   
   repeat (num_all_access) begin
      `uvm_do_on(_req, p_sequencer.mstr_vsequencer)
   end
   
endtask : body


`endif // __UVME_OBI_ST_ALL_ACCESS_VSEQ_SV__
