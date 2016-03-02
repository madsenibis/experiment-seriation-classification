#!/bin/sh

mkdir -p sampled-traits
mkdir -p slice-stratified-sampled-data
mkdir -p slice-stratified-filtered-data


######## Sample exported datafiles to create synthetic assemblages of 500 artifacts each #########

echo "==================== sample exported data files ====================="

seriationct-sample-exported-datafiles.py --inputdirectory exported-data \
	--outputdirectory sampled-traits \
	--samplesize 500 \
	--debug 1 \
	--dropthreshold 0.01


######## Sample assemblages to pull one assemblage per time interval, with no overlap ########

echo "==================== sample temporal slices ====================="

seriationct-sample-assemblages-for-seriation.py --inputdirectory sampled-traits \
	--outputdirectory slice-stratified-sampled-data \
 	--sampletype slicestratified \
 	--numsamples 1 \
 	--samplefraction 0.05 \
 	--debug 1 \
 	--networkmodel networkmodels/sc-4-nn-network.zip

######## Filter slice-stratified assemblages to eliminate types with less than 3 non-zero entries #######

echo "==================== filter sampled assemblages ====================="

seriationct-filter-type-unimodality.py \
	--inputdirectory slice-stratified-sampled-data \
	--outputdirectory slice-stratified-filtered-data \
	--networkmodel networkmodels/sc-4-nn-network.zip \
	--debug 0 \
	--dropthreshold 0.10 \
	--filtertype onlynonzero \
	--minnonzero 3
