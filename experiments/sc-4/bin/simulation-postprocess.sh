#!/bin/sh


mkdir -p sampled-traits-early-split
mkdir -p sampled-traits-late-split
mkdir -p sampled-traits-early-coalesce
mkdir -p sampled-traits-late-coalesce

mkdir -p slice-stratified-sampled-early-split
mkdir -p slice-stratified-sampled-late-split
mkdir -p slice-stratified-sampled-early-coalesce
mkdir -p slice-stratified-sampled-late-coalesce

mkdir -p slice-stratified-filtered-early-split
mkdir -p slice-stratified-filtered-late-split
mkdir -p slice-stratified-filtered-early-coalesce
mkdir -p slice-stratified-filtered-late-coalesce

######## Sample exported datafiles to create synthetic assemblages of 500 artifacts each #########

echo "==================== sample exported data files ====================="

seriationct-sample-exported-datafiles.py --inputdirectory exported-data-early-split \
	--outputdirectory sampled-traits-early-split \
	--samplesize 500 \
	--debug 1 \
	--dropthreshold 0.01

seriationct-sample-exported-datafiles.py --inputdirectory exported-data-late-split \
	--outputdirectory sampled-traits-late-split \
	--samplesize 500 \
	--debug 1 \
	--dropthreshold 0.01

seriationct-sample-exported-datafiles.py --inputdirectory exported-data-early-coalesce \
	--outputdirectory sampled-traits-early-coalesce \
	--samplesize 500 \
	--debug 1 \
	--dropthreshold 0.01

seriationct-sample-exported-datafiles.py --inputdirectory exported-data-late-coalesce \
	--outputdirectory sampled-traits-late-coalesce \
	--samplesize 500 \
	--debug 1 \
	--dropthreshold 0.01

######## Sample assemblages to pull one assemblage per time interval, with no overlap ########

echo "==================== sample temporal slices ====================="

seriationct-sample-assemblages-for-seriation.py --inputdirectory sampled-traits-early-split \
	--outputdirectory slice-stratified-sampled-early-split \
 	--sampletype slicestratified \
 	--numsamples 1 \
 	--samplefraction 0.05 \
 	--debug 1 \
 	--networkmodel network-split-early/gc-early-lineage-split-2-networkmodel.zip

seriationct-sample-assemblages-for-seriation.py --inputdirectory sampled-traits-late-split \
	--outputdirectory slice-stratified-sampled-late-split \
 	--sampletype slicestratified \
 	--numsamples 1 \
 	--samplefraction 0.12 \
 	--debug 1 \
 	--networkmodel network-split-late/gc-late-lineage-split-2-networkmodel.zip

 seriationct-sample-assemblages-for-seriation.py --inputdirectory sampled-traits-early-coalesce \
	--outputdirectory slice-stratified-sampled-early-coalesce \
 	--sampletype slicestratified \
 	--numsamples 1 \
 	--samplefraction 0.05 \
 	--debug 1 \
 	--networkmodel network-coalesce-early/gc-early-lineage-coalesce-2-networkmodel.zip

seriationct-sample-assemblages-for-seriation.py --inputdirectory sampled-traits-late-coalesce \
	--outputdirectory slice-stratified-sampled-late-coalesce \
 	--sampletype slicestratified \
 	--numsamples 1 \
 	--samplefraction 0.12 \
 	--debug 1 \
 	--networkmodel network-coalesce-late/gc-late-lineage-coalesce-2-networkmodel.zip

######## Filter slice-stratified assemblages to eliminate types with less than 3 non-zero entries #######

echo "==================== filter sampled assemblages ====================="

seriationct-filter-type-unimodality.py \
	--inputdirectory slice-stratified-sampled-early-split \
	--outputdirectory slice-stratified-filtered-early-split \
	--networkmodel network-split-early/gc-early-lineage-split-2-networkmodel.zip \
	--debug 0 \
	--dropthreshold 0.10 \
	--filtertype onlynonzero \
	--minnonzero 3

seriationct-filter-type-unimodality.py \
	--inputdirectory slice-stratified-sampled-late-split \
	--outputdirectory slice-stratified-filtered-late-split \
	--networkmodel network-split-late/gc-late-lineage-split-2-networkmodel.zip \
	--debug 0 \
	--dropthreshold 0.10 \
	--filtertype onlynonzero \
	--minnonzero 3


seriationct-filter-type-unimodality.py \
	--inputdirectory slice-stratified-sampled-early-coalesce \
	--outputdirectory slice-stratified-filtered-early-coalesce \
	--networkmodel network-coalesce-early/gc-early-lineage-coalesce-2-networkmodel.zip \
	--debug 0 \
	--dropthreshold 0.10 \
	--filtertype onlynonzero \
	--minnonzero 3

seriationct-filter-type-unimodality.py \
	--inputdirectory slice-stratified-sampled-late-coalesce \
	--outputdirectory slice-stratified-filtered-late-coalesce \
	--networkmodel network-coalesce-late/gc-late-lineage-coalesce-2-networkmodel.zip \
	--debug 0 \
	--dropthreshold 0.10 \
	--filtertype onlynonzero \
	--minnonzero 3
