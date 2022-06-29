// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_OBI_RAND_ACCESS_VSEQ_SV__
`define __UVMA_OBI_RAND_ACCESS_VSEQ_SV__


/**
 * TODO Describe uvma_obi_rand_access_vseq_c
 */
class uvma_obi_rand_access_vseq_c extends uvma_obi_base_vseq_c;
   
   rand int unsigned  num_access; ///< 
   rand int unsigned  pct_reads ; ///< 
   rand int unsigned  pct_writes; ///< 
   rand int unsigned  min_gap   ; ///< 
   rand int unsigned  max_gap   ; ///< 
   
   
   `uvm_object_utils_begin(uvma_obi_rand_access_vseq_c)
      `uvm_field_int(num_access, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(pct_reads , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(pct_writes, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap   , UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end
   
   
   constraint limits_cons {
      pct_reads + pct_writes == 100;
      num_access <= 100;
      min_gap <= max_gap;
      max_gap <= 25;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_rand_access_vseq");
   
   /**
    * TODO Describe uvma_obi_rand_access_vseq_c::body()
    */
   extern virtual task body();
   
endclass : uvma_obi_rand_access_vseq_c


function uvma_obi_rand_access_vseq_c::new(string name="uvma_obi_rand_access_vseq");
   
   super.new(name);
   
endfunction : new


task uvma_obi_rand_access_vseq_c::body();
   
   uvma_obi_seq_item_c  req;
   
   for (int unsigned ii=0; ii<num_access; ii++) begin
      `uvm_create_on(req, p_sequencer)
      
      if ($urandom_range(0,100) > pct_reads) begin
         `uvm_rand_send_with(req, {
            access_type == UVMA_OBI_ACCESS_WRITE;
         })
      end
      else begin
         `uvm_rand_send_with(req, {
            access_type == UVMA_OBI_ACCESS_READ;
         })
      end
      
      repeat ($urandom_range(min_gap, max_gap)) begin
         @(cntxt.vif.mon_a_cb);
      end
   end
   
endtask : body


`endif // __UVMA_OBI_RAND_ACCESS_VSEQ_SV__
