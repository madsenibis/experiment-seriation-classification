#!/bin/sh

mkdir -p sampled-linear-traits
mkdir -p sampled-lineage-traits
mkdir -p slice-stratified-sampled-linear-data
mkdir -p slice-stratified-sampled-lineage-data
mkdir -p slice-stratified-filtered-linear-data
mkdir -p slice-stratified-filtered-lineage-data


######## Sample exported datafiles to create synthetic assemblages of 500 artifacts each #########

echo "==================== sample exported data files ====================="

seriationct-sample-exported-datafiles.py --inputdirectory exported-data-linear \
	--outputdirectory sampled-linear-traits \
	--samplesize 500 \
	--debug 1 \
	--dropthreshold 0.01

seriationct-sample-exported-datafiles.py --inputdirectory exported-data-lineage \
	--outputdirectory sampled-lineage-traits \
	--samplesize 500 \
	--debug 1 \
	--dropthreshold 0.01

######## Sample assemblages to pull one assemblage per time interval, with no overlap ########

echo "==================== sample temporal slices ====================="

seriationct-sample-assemblages-for-seriation.py --inputdirectory sampled-linear-traits \
	--outputdirectory slice-stratified-sampled-linear-data \
 	--sampletype slicestratified \
 	--numsamples 1 \
 	--samplefraction 0.05 \
 	--debug 1 \
 	--networkmodel network-linear/gc-simple-linear-sample-1-network-gml.zip

seriationct-sample-assemblages-for-seriation.py --inputdirectory sampled-lineage-traits \
	--outputdirectory slice-stratified-sampled-lineage-data \
 	--sampletype slicestratified \
 	--numsamples 1 \
 	--samplefraction 0.12 \
 	--debug 1 \
 	--networkmodel network-lineage/gc-simple-lineage-split-1-network-gml.zip

######## Filter slice-stratified assemblages to eliminate types with less than 3 non-zero entries #######

echo "==================== filter sampled assemblages ====================="

seriationct-filter-type-unimodality.py \
	--inputdirectory slice-stratified-sampled-linear-data \
	--outputdirectory slice-stratified-filtered-linear-data \
	--networkmodel network-linear/gc-simple-linear-sample-1-network-gml.zip \
	--debug 0 \
	--dropthreshold 0.10 \
	--filtertype onlynonzero \
	--minnonzero 3

seriationct-filter-type-unimodality.py \
	--inputdirectory slice-stratified-sampled-lineage-data \
	--outputdirectory slice-stratified-filtered-lineage-data \
	--networkmodel network-lineage/gc-simple-linear-split-1-network-gml.zip \
	--debug 0 \
	--dropthreshold 0.10 \
	--filtertype onlynonzero \
	--minnonzero 3
