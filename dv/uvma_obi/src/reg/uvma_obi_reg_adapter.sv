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


`ifndef __UVMA_OBI_REG_ADAPTER_SV__
`define __UVMA_OBI_REG_ADAPTER_SV__


/**
 * Object that converts between abstract register operations (UVM) and Open Bus Interface (OBI) Agent operations.
 */
class uvma_obi_reg_adapter_c extends uvm_reg_adapter;
   
   `uvm_object_utils(uvma_obi_reg_adapter_c)
   
   
   /**
    * Default constructor
    */
   extern function new(string name="uvma_obi_reg_adapter");
   
   /**
    * Converts from UVM register operation to Open Bus Interface (OBI) Agent.
    */
   extern virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
   
   /**
    * Converts from Open Bus Interface (OBI) Agent to UVM register operation.
    */
   extern virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
   
endclass : uvma_obi_reg_adapter_c


function uvma_obi_reg_adapter_c::new(string name="uvma_obi_reg_adapter");
   
   super.new(name);
   supports_byte_enable = 1;
   
endfunction : new


function uvm_sequence_item uvma_obi_reg_adapter_c::reg2bus(const ref uvm_reg_bus_op rw);
   
   uvma_obi_seq_item_c  obi_seq_item = uvma_obi_seq_item_c::type_id::create("obi_seq_item");
   
   obi_seq_item.access_type  = (rw.kind == UVM_READ) ? UVMA_OBI_ACCESS_READ : UVMA_OBI_ACCESS_WRITE;
   obi_seq_item.address      = rw.addr;
   obi_seq_item.data         = rw.data;
   obi_seq_item.be           = rw.byte_en;
   
   if (rw.status == UVM_NOT_OK) begin
      obi_seq_item.set_error(1);
   end
   
   return obi_seq_item;
   
endfunction : reg2bus


function void uvma_obi_reg_adapter_c::bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
   
   uvma_obi_seq_item_c  obi_seq_item;
   
   if (!$cast(obi_seq_item, bus_item)) begin
      `uvm_fatal("APB", $sformatf("Could not cast bus_item (%s) into obi_seq_item (%s)", $typename(bus_item), $typename(obi_seq_item)))
   end
   
   rw.kind    = (obi_seq_item.access_type == UVMA_OBI_ACCESS_READ) ? UVM_READ : UVM_WRITE;
   rw.addr    = obi_seq_item.address;
   rw.data    = obi_seq_item.data;
   rw.byte_en = obi_seq_item.be;
   
   if (obi_seq_item.has_error()) begin
      rw.status = UVM_NOT_OK;
   end
   else begin
      rw.status = UVM_IS_OK;
   end
   
endfunction : bus2reg


`endif // __UVMA_OBI_REG_ADAPTER_SV__
