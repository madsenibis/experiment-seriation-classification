#!/bin/sh

idss-batch-builder.py --inputdirectory slice-stratified-filtered-data \
	--outputdirectory seriations-slice-stratified-filtered \
	--xyfile xyfiles/sc-5-nn-XY.txt \
	--dobootstrapsignificance 1 \
	--database sc-5-nn_samples_raw \
	--frequency 0 \
	--continuity 1 \
	--experiment sc-5-nn \
	--jobdirectory jobs \
	--parallelism 1 \
	--debug 0


