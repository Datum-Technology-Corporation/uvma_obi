// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_OBI_ST_PRINT_TEST_SV__
`define __UVMT_OBI_ST_PRINT_TEST_SV__


/**
 * TODO Describe uvmt_obi_st_print_test_c
 */
class uvmt_obi_st_print_test_c extends uvmt_obi_st_base_test_c;
   
   rand uvme_obi_st_print_vseq_c  print_vseq; ///< 
   
   
   `uvm_component_utils(uvmt_obi_st_print_test_c)
   
   
   constraint env_cfg_cons {
      env_cfg.scoreboarding_enabled == 0;
   }
   
   
   /**
    * Creates print_vseq.
    */
   extern function new(string name="uvmt_obi_st_print_test", uvm_component parent=null);
   
   /**
    * Runs print_vseq on vsequencer.
    */
   extern virtual task main_phase(uvm_phase phase);
   
endclass : uvmt_obi_st_print_test_c


function uvmt_obi_st_print_test_c::new(string name="uvmt_obi_st_print_test", uvm_component parent=null);
   
   super.new(name, parent);
   
   print_vseq = uvme_obi_st_print_vseq_c::type_id::create("print_vseq");
   
endfunction : new


task uvmt_obi_st_print_test_c::main_phase(uvm_phase phase);
   
   super.main_phase(phase);
   
   phase.raise_objection(this);
   `uvm_info("TEST", $sformatf("Starting print virtual sequence:\n%s", print_vseq.sprint()), UVM_NONE)
   print_vseq.start(vsequencer);
   `uvm_info("TEST", $sformatf("Finished print virtual sequence:\n%s", print_vseq.sprint()), UVM_NONE)
   phase.drop_objection(this);
   
endtask : main_phase


`endif // __UVMT_OBI_ST_PRINT_TEST_SV__
