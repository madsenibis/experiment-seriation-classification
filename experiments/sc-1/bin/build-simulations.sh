#!/bin/sh
seriationct-runbuilder.py --experiment gc-simple-linear-sample-1 \
--expconfig seriationct-priors.json \
--parallelism 1 \
--numsims 50 \
--networkmodels network-linear \
--debug 0 \
--jobdirectory jobs

seriationct-runbuilder.py --experiment gc-simple-lineage-split-1 \
--expconfig seriationct-priors.json \
--parallelism 1 \
--numsims 50 \
--networkmodels network-lineage \
--debug 0 \
--jobdirectory jobs
