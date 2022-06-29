// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_OBI_ST_TDEFS_SV__
`define __UVME_OBI_ST_TDEFS_SV__


// Scoreboard specialization
typedef uvml_sb_simplex_c#(
   .T_ACT_TRN(uvma_obi_mon_trn_c)
) uvme_obi_st_sb_simplex_c;


`endif // __UVME_OBI_ST_TDEFS_SV__
