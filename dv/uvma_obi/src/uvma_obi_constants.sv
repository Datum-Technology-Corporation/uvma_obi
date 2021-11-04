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


`ifndef __UVMA_OBI_CONSTANTS_SV__
`define __UVMA_OBI_CONSTANTS_SV__


const int unsigned  uvma_obi_default_auser_width = `UVMA_OBI_AUSER_DEFAULT_WIDTH; // Measured in bits (b)
const int unsigned  uvma_obi_default_wuser_width = `UVMA_OBI_WUSER_DEFAULT_WIDTH; // Measured in bits (b)
const int unsigned  uvma_obi_default_ruser_width = `UVMA_OBI_RUSER_DEFAULT_WIDTH; // Measured in bits (b)
const int unsigned  uvma_obi_default_addr_width  = `UVMA_OBI_ADDR_DEFAULT_WIDTH ; // Measured in bits (b)
const int unsigned  uvma_obi_default_data_width  = `UVMA_OBI_DATA_DEFAULT_WIDTH ; // Measured in bits (b)
const int unsigned  uvma_obi_default_id_width    = `UVMA_OBI_ID_DEFAULT_WIDTH   ; // Measured in bits (b)
const int unsigned  uvma_obi_default_achk_width  = `UVMA_OBI_ACHK_DEFAULT_WIDTH ; // Measured in bits (b)
const int unsigned  uvma_obi_default_rchk_width  = `UVMA_OBI_RCHK_DEFAULT_WIDTH ; // Measured in bits (b)


`endif // __UVMA_OBI_CONSTANTS_SV__
