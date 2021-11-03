// Copyright 2021 OpenHW Group
// Copyright 2021 Datum Technology Corporation
// Copyright 2021 Silicon Labs
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_OBI_TDEFS_SV__
`define __UVMA_OBI_TDEFS_SV__


// Logic vectors
typedef logic [(`UVMA_OBI_AUSER_MAX_WIDTH   -1):0]  uvma_obi_auser_l_t  ;
typedef logic [(`UVMA_OBI_WUSER_MAX_WIDTH   -1):0]  uvma_obi_wuser_l_t  ;
typedef logic [(`UVMA_OBI_RUSER_MAX_WIDTH   -1):0]  uvma_obi_ruser_l_t  ;
typedef logic [(`UVMA_OBI_ADDR_MAX_WIDTH    -1):0]  uvma_obi_addr_l_t   ;
typedef logic [(`UVMA_OBI_DATA_MAX_WIDTH    -1):0]  uvma_obi_data_l_t   ;
typedef logic [((`UVMA_OBI_DATA_MAX_WIDTH/8)-1):0]  uvma_obi_be_l_t     ;
typedef logic [(`UVMA_OBI_ID_MAX_WIDTH      -1):0]  uvma_obi_id_l_t     ;
typedef logic                                       uvma_obi_err_l_t    ;
typedef logic                                       uvma_obi_exokay_l_t ;
typedef logic [5:0]                                 uvma_obi_atop_l_t   ;
typedef logic [1:0]                                 uvma_obi_memtype_l_t;
typedef logic [2:0]                                 uvma_obi_prot_l_t   ;
typedef logic [(`UVMA_OBI_ACHK_MAX_WIDTH    -1):0]  uvma_obi_achk_l_t   ;
typedef logic [(`UVMA_OBI_RCHK_MAX_WIDTH    -1):0]  uvma_obi_rchk_l_t   ;

// Bit vectors
typedef bit [(`UVMA_OBI_AUSER_MAX_WIDTH   -1):0]  uvma_obi_auser_b_t  ;
typedef bit [(`UVMA_OBI_WUSER_MAX_WIDTH   -1):0]  uvma_obi_wuser_b_t  ;
typedef bit [(`UVMA_OBI_RUSER_MAX_WIDTH   -1):0]  uvma_obi_ruser_b_t  ;
typedef bit [(`UVMA_OBI_ADDR_MAX_WIDTH    -1):0]  uvma_obi_addr_b_t   ;
typedef bit [(`UVMA_OBI_DATA_MAX_WIDTH    -1):0]  uvma_obi_data_b_t   ;
typedef bit [((`UVMA_OBI_DATA_MAX_WIDTH/8)-1):0]  uvma_obi_be_b_t     ;
typedef bit [(`UVMA_OBI_ID_MAX_WIDTH      -1):0]  uvma_obi_id_b_t     ;
typedef bit                                       uvma_obi_err_b_t    ;
typedef bit                                       uvma_obi_exokay_b_t ;
typedef bit [5:0]                                 uvma_obi_atop_b_t   ;
typedef bit [1:0]                                 uvma_obi_memtype_b_t;
typedef bit [2:0]                                 uvma_obi_prot_b_t   ;
typedef bit [(`UVMA_OBI_ACHK_MAX_WIDTH    -1):0]  uvma_obi_achk_b_t   ;
typedef bit [(`UVMA_OBI_RCHK_MAX_WIDTH    -1):0]  uvma_obi_rchk_b_t   ;


typedef enum {
   UVMA_OBI_VERSION_1P1,
   UVMA_OBI_VERSION_1P2
} uvma_obi_version_enum;

typedef enum {
   UVMA_OBI_DRV_MODE_MSTR,
   UVMA_OBI_DRV_MODE_SLV
} uvma_obi_mode_enum;

typedef enum {
   UVMA_OBI_DRV_IDLE_ZEROS ,
   UVMA_OBI_DRV_IDLE_SAME  ,
   UVMA_OBI_DRV_IDLE_RANDOM
} uvma_obi_drv_idle_enum;

typedef enum {
   UVMA_OBI_ACCESS_READ ,
   UVMA_OBI_ACCESS_WRITE
} uvma_obi_access_type_enum;

typedef enum {
   UVMA_OBI_DRV_SLV_GNT_MODE_CONSTANT      ,
   UVMA_OBI_DRV_SLV_GNT_MODE_FIXED_LATENCY ,
   UVMA_OBI_DRV_SLV_GNT_MODE_RANDOM_LATENCY
} uvma_obi_drv_slv_gnt_mode_enum;

typedef enum {
   UVMA_OBI_DRV_SLV_RVALID_MODE_CONSTANT      ,
   UVMA_OBI_DRV_SLV_RVALID_MODE_FIXED_LATENCY ,
   UVMA_OBI_DRV_SLV_RVALID_MODE_RANDOM_LATENCY
} uvma_obi_drv_slv_rvalid_mode_enum;

typedef enum {
   UVMA_OBI_DRV_SLV_ERR_MODE_OK,
   UVMA_OBI_DRV_SLV_ERR_MODE_RANDOM
} uvma_obi_drv_slv_err_mode_enum;

typedef enum {
   UVMA_OBI_DRV_SLV_EXOKAY_MODE_SUCCESS,
   UVMA_OBI_DRV_SLV_EXOKAY_MODE_RANDOM
} uvma_obi_drv_slv_exokay_mode_enum;


`endif // __UVMA_OBI_TDEFS_SV__
