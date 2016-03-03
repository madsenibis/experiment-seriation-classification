#!/bin/sh

idss-batch-builder.py --inputdirectory slice-stratified-filtered-data \
	--outputdirectory seriations-slice-stratified-filtered \
	--xyfile xyfiles/REPLACEME-XY.txt \
	--dobootstrapsignificance 1 \
	--database REPLACEME_samples_raw \
	--frequency 0 \
	--continuity 1 \
	--experiment REPLACEME \
	--jobdirectory jobs \
	--parallelism 1 \
	--debug 0


