// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_OBI_ST_READS_VSEQ_SV__
`define __UVME_OBI_ST_READS_VSEQ_SV__


/**
 * TODO Describe uvme_obi_st_reads_vseq_c
 */
class uvme_obi_st_reads_vseq_c extends uvme_obi_st_base_vseq_c;
   
   rand int unsigned  num_reads; ///< 
   
   
   `uvm_object_utils_begin(uvme_obi_st_reads_vseq_c)
      `uvm_field_int(num_reads, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      soft num_reads == 10;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_obi_st_reads_vseq");
   
   /**
    * TODO Describe uvme_obi_st_reads_vseq_c::body()
    */
   extern virtual task body();
   
endclass : uvme_obi_st_reads_vseq_c


function uvme_obi_st_reads_vseq_c::new(string name="uvme_obi_st_reads_vseq");
   
   super.new(name);
   
endfunction : new


task uvme_obi_st_reads_vseq_c::body();
   
   uvma_obi_seq_item_c  _req;
   
   repeat (num_reads) begin
      `uvm_do_on_with(_req, p_sequencer.mstr_vsequencer, {
         access_type == UVMA_OBI_ACCESS_READ;
      })
   end
   
endtask : body


`endif // __UVME_OBI_ST_READS_VSEQ_SV__
