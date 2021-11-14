// Copyright 2021 Datum Technology Corporation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_OBI_ST_E2E_MON_TRN_SV__
`define __UVME_OBI_ST_E2E_MON_TRN_SV__


/**
 * TODO Describe uvme_obi_st_e2e_mon_trn_c
 */
class uvme_obi_st_e2e_mon_trn_c extends uvma_obi_mon_trn_c;
   
   `uvm_object_utils(uvme_obi_st_e2e_mon_trn_c)
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_obi_st_e2e_mon_trn");
   
   /**
    * TODO Describe uvme_obi_st_e2e_mon_trn_c::do_compare()
    */
   extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
   
endclass : uvme_obi_st_e2e_mon_trn_c


function uvme_obi_st_e2e_mon_trn_c::new(string name="uvme_obi_st_e2e_mon_trn");
   
   super.new(name);
   
endfunction : new


function bit uvme_obi_st_e2e_mon_trn_c::do_compare(uvm_object rhs, uvm_comparer comparer);
   
   uvma_obi_mon_trn_c  rhs_;
   
   if (!$cast(rhs_, rhs)) begin
      `uvm_fatal("UVME_OBI_ST_E2E_MON_TRN", $sformatf("Could not cast 'rhs' (%s) to 'rhs_' (%s)", $typename(rhs), $typename(rhs_)))
   end
   
   do_compare = 1;
   do_compare &= comparer.compare_field_int("access_type", access_type, rhs_.access_type, $bits(access_type));
   do_compare &= comparer.compare_field_int("address"    , address    , rhs_.address    , $bits(address    ));
   do_compare &= comparer.compare_field_int("data"       , data       , rhs_.data       , $bits(data       ));
   do_compare &= comparer.compare_field_int("be"         , be         , rhs_.be         , $bits(be         ));
   do_compare &= comparer.compare_field_int("auser"      , auser      , rhs_.auser      , $bits(auser      ));
   do_compare &= comparer.compare_field_int("wuser"      , wuser      , rhs_.wuser      , $bits(wuser      ));
   do_compare &= comparer.compare_field_int("ruser"      , ruser      , rhs_.ruser      , $bits(ruser      ));
   do_compare &= comparer.compare_field_int("aid"        , aid        , rhs_.aid        , $bits(aid        ));
   do_compare &= comparer.compare_field_int("rid"        , rid        , rhs_.rid        , $bits(rid        ));
   do_compare &= comparer.compare_field_int("err"        , err        , rhs_.err        , $bits(err        ));
   do_compare &= comparer.compare_field_int("exokay"     , exokay     , rhs_.exokay     , $bits(exokay     ));
   do_compare &= comparer.compare_field_int("atop"       , atop       , rhs_.atop       , $bits(atop       ));
   do_compare &= comparer.compare_field_int("memtype"    , memtype    , rhs_.memtype    , $bits(memtype    ));
   do_compare &= comparer.compare_field_int("prot"       , prot       , rhs_.prot       , $bits(prot       ));
   do_compare &= comparer.compare_field_int("achk"       , achk       , rhs_.achk       , $bits(achk       ));
   do_compare &= comparer.compare_field_int("rchk"       , rchk       , rhs_.rchk       , $bits(rchk       ));
   
endfunction : do_compare


`endif // __UVME_OBI_ST_E2E_MON_TRN_SV__
