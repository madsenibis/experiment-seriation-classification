#!/bin/sh

idss-batch-builder.py --inputdirectory slice-stratified-filtered-linear-data \
	--outputdirectory seriations-linear-filtered \
	--xyfile xyfiles/gc-simple-linear-sample-1XY.txt \
	--dobootstrapsignificance 1 \
	--database gc-simple-linear-sample-1_samples_raw \
	--frequency 1 \
	--continuity 1 \
	--experiment gc-simple-linear-sample-1 \
	--jobdirectory jobs \
	--parallelism 1 \
	--debug 0

idss-batch-builder.py --inputdirectory slice-stratified-filtered-lineage-data \
	--outputdirectory seriations-lineage-filtered \
	--xyfile xyfiles/gc-simple-lineage-split-1XY.txt \
	--dobootstrapsignificance 1 \
	--database gc-simple-lineage-split-1_samples_raw \
	--frequency 1 \
	--continuity 1 \
	--experiment gc-simple-lineage-split-1 \
	--jobdirectory jobs \
	--parallelism 1 \
	--debug 0
