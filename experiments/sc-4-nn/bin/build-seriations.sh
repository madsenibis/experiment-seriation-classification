#!/bin/sh

idss-batch-builder.py --inputdirectory slice-stratified-filtered-data \
	--outputdirectory seriations-slice-stratified-filtered \
	--xyfile xyfiles/sc-4-nn-XY.txt \
	--dobootstrapsignificance 1 \
	--database gc-simple-linear-sample-3_samples_raw \
	--frequency 1 \
	--continuity 1 \
	--experiment gc-simple-linear-sample-3 \
	--jobdirectory jobs \
	--parallelism 1 \
	--debug 0


