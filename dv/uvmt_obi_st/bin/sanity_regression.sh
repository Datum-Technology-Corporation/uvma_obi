#! /bin/bash
########################################################################################################################
## Copyright 2021-2022 Datum Technology Corporation
## SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
########################################################################################################################


# Launched from uvml project sim dir
mio sim     uvmt_obi_st -CE
mio sim     uvmt_obi_st -S -t reads      -s 1 -c
mio sim     uvmt_obi_st -S -t writes     -s 1 -c
mio sim     uvmt_obi_st -S -t all_access -s 1 -c
mio results uvmt_obi_st results
mio cov     uvmt_obi_st
