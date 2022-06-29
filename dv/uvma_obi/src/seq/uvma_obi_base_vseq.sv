// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_OBI_BASE_VSEQ_SV__
`define __UVMA_OBI_BASE_VSEQ_SV__


/**
 * Abstract object from which all other Open Bus Interface agent sequences must extend.  Subclasses must be run on
 * Open Bus Interface Virtual Sequencer (uvma_obi_vsqr_c) instance.
 */
class uvma_obi_base_vseq_c extends uvm_sequence #(
   .REQ(uvma_obi_seq_item_c),
   .RSP(uvma_obi_seq_item_c)
);
   
   // Agent handles
   uvma_obi_cfg_c    cfg  ; ///< Agent configuration handle
   uvma_obi_cntxt_c  cntxt; ///< Agent context handle
   
   
   `uvm_object_utils(uvma_obi_base_vseq_c)
   `uvm_declare_p_sequencer(uvma_obi_vsqr_c)
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_obi_base_vseq");
   
   /**
    * Assigns cfg and cntxt handles from p_sequencer.
    */
   extern virtual task pre_start();
   
   /**
    * TODO Describe uvma_obi_base_vseq_c::upstream_get_next_item()
    */
   extern task upstream_get_next_item(ref uvm_sequence_item req);
   
   /**
    * TODO Describe uvma_obi_base_vseq_c::upstream_item_done()
    */
   extern task upstream_item_done(ref uvm_sequence_item req);
   
   /**
    * TODO Describe uvma_obi_base_vseq_c::write_mon_trn()
    */
   extern task write_mon_trn(ref uvma_obi_mon_trn_c trn);
   
   /**
    * TODO Describe uvma_obi_base_vseq_c::get_mstr_a_mon_trn()
    */
   extern task get_mstr_a_mon_trn(output uvma_obi_mstr_a_mon_trn_c trn);
   
   /**
    * TODO Describe uvma_obi_base_vseq_c::get_mstr_r_mon_trn()
    */
   extern task get_mstr_r_mon_trn(output uvma_obi_mstr_r_mon_trn_c trn);
   
   /**
    * TODO Describe uvma_obi_base_vseq_c::get_slv_a_mon_trn()
    */
   extern task get_slv_a_mon_trn(output uvma_obi_slv_a_mon_trn_c trn);
   
   /**
    * TODO Describe uvma_obi_base_vseq_c::get_slv_r_mon_trn()
    */
   extern task get_slv_r_mon_trn(output uvma_obi_slv_r_mon_trn_c trn);
   
endclass : uvma_obi_base_vseq_c


function uvma_obi_base_vseq_c::new(string name="uvma_obi_base_vseq");
   
   super.new(name);
   
endfunction : new


task uvma_obi_base_vseq_c::pre_start();
   
   cfg   = p_sequencer.cfg;
   cntxt = p_sequencer.cntxt;
   
endtask : pre_start


task uvma_obi_base_vseq_c::upstream_get_next_item(ref uvm_sequence_item req);
   
   p_sequencer.upstream_sqr_port.get_next_item(req);
   
endtask : upstream_get_next_item


task uvma_obi_base_vseq_c::upstream_item_done(ref uvm_sequence_item req);
   
   p_sequencer.upstream_sqr_port.item_done(req);
   
endtask : upstream_item_done


task uvma_obi_base_vseq_c::write_mon_trn(ref uvma_obi_mon_trn_c trn);
   
   p_sequencer.mon_trn_ap.write(trn);
   
endtask : write_mon_trn


task uvma_obi_base_vseq_c::get_mstr_a_mon_trn(output uvma_obi_mstr_a_mon_trn_c trn);
   
   p_sequencer.mstr_a_mon_trn_fifo.get(trn);
   
endtask : get_mstr_a_mon_trn


task uvma_obi_base_vseq_c::get_mstr_r_mon_trn(output uvma_obi_mstr_r_mon_trn_c trn);
   
   p_sequencer.mstr_r_mon_trn_fifo.get(trn);
   
endtask : get_mstr_r_mon_trn


task uvma_obi_base_vseq_c::get_slv_a_mon_trn(output uvma_obi_slv_a_mon_trn_c trn);
   
   p_sequencer.slv_a_mon_trn_fifo.get(trn);
   
endtask : get_slv_a_mon_trn


task uvma_obi_base_vseq_c::get_slv_r_mon_trn(output uvma_obi_slv_r_mon_trn_c trn);
   
   p_sequencer.slv_r_mon_trn_fifo.get(trn);
   
endtask : get_slv_r_mon_trn


`endif // __UVMA_OBI_BASE_SEQ_SV__
