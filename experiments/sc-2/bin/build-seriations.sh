#!/bin/sh


idss-batch-builder.py --inputdirectory slice-stratified-filtered-early-split \
	--outputdirectory seriations-early-split \
	--xyfile xyfiles/gc-early-lineage-split-2XY.txt \
	--dobootstrapsignificance 1 \
	--database gc-early-lineage-split-2_samples_raw \
	--frequency 1 \
	--continuity 1 \
	--experiment gc-early-lineage-split-2 \
	--jobdirectory jobs \
	--parallelism 1 \
	--debug 0

idss-batch-builder.py --inputdirectory slice-stratified-filtered-late-split \
	--outputdirectory seriations-late-split \
	--xyfile xyfiles/gc-late-lineage-split-2XY.txt \
	--dobootstrapsignificance 1 \
	--database gc-late-lineage-split-2_samples_raw \
	--frequency 1 \
	--continuity 1 \
	--experiment gc-late-lineage-split-2 \
	--jobdirectory jobs \
	--parallelism 1 \
	--debug 0

idss-batch-builder.py --inputdirectory slice-stratified-filtered-early-coalesce \
	--outputdirectory seriations-early-coalesce \
	--xyfile xyfiles/gc-early-lineage-coalesce-2XY.txt \
	--dobootstrapsignificance 1 \
	--database gc-early-lineage-coalesce-2_samples_raw \
	--frequency 1 \
	--continuity 1 \
	--experiment gc-early-lineage-coalesce-2 \
	--jobdirectory jobs \
	--parallelism 1 \
	--debug 0

idss-batch-builder.py --inputdirectory slice-stratified-filtered-late-coalesce \
	--outputdirectory seriations-late-coalesce \
	--xyfile xyfiles/gc-late-lineage-coalesce-2XY.txt \
	--dobootstrapsignificance 1 \
	--database gc-late-lineage-coalesce-2_samples_raw \
	--frequency 1 \
	--continuity 1 \
	--experiment gc-late-lineage-coalesce-2 \
	--jobdirectory jobs \
	--parallelism 1 \
	--debug 0