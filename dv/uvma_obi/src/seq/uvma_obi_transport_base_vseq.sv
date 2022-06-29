// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_OBI_TRANSPORT_BASE_VSEQ_SV__
`define __UVMA_OBI_TRANSPORT_BASE_VSEQ_SV__


/**
 * TODO Describe uvma_obi_transport_base_vseq_c
 */
class uvma_obi_transport_base_vseq_c extends uvma_obi_base_vseq_c;
   
   `uvm_object_utils(uvma_obi_transport_base_vseq_c)
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_transport_base_vseq");
   
   /**
    * TODO Describe uvma_obi_transport_base_vseq_c::body()
    */
   extern virtual task body();
   
   /**
    * TODO Describe uvma_obi_transport_base_vseq_c::process_payload()
    */
   extern virtual task process_payload(uvm_sequence_item payload);
   
endclass : uvma_obi_transport_base_vseq_c


function uvma_obi_transport_base_vseq_c::new(string name="uvma_obi_transport_base_vseq");
   
   super.new(name);
   
endfunction : new


task uvma_obi_transport_base_vseq_c::body();
   
   uvm_sequence_item  payload;
   
   `uvm_info("OBI_TRANSPORT_BASE_VSEQ", "Transport base virtual sequence has started", UVM_HIGH)
   forever begin
      upstream_get_next_item(payload);
      process_payload       (payload);
      upstream_item_done    (payload);
   end
   
endtask : body


task uvma_obi_transport_base_vseq_c::process_payload(uvm_sequence_item payload);
   
   
   
endtask : process_payload


`endif // __UVMA_OBI_TRANSPORT_BASE_VSEQ_SV__
