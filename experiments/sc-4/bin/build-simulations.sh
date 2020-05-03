#!/bin/sh
seriationct-runbuilder.py --experiment gc-early-lineage-split-2 \
--expconfig seriationct-priors.json \
--parallelism 1 \
--numsims 50 \
--networkmodels network-split-early \
--debug 0 \
--jobdirectory jobs

seriationct-runbuilder.py --experiment gc-late-lineage-split-2 \
--expconfig seriationct-priors.json \
--parallelism 1 \
--numsims 50 \
--networkmodels network-split-late \
--debug 0 \
--jobdirectory jobs

seriationct-runbuilder.py --experiment gc-early-lineage-coalesce-2 \
--expconfig seriationct-priors.json \
--parallelism 1 \
--numsims 50 \
--networkmodels network-coalesce-early \
--debug 0 \
--jobdirectory jobs

seriationct-runbuilder.py --experiment gc-late-lineage-coalesce-2 \
--expconfig seriationct-priors.json \
--parallelism 1 \
--numsims 50 \
--networkmodels network-coalesce-late \
--debug 0 \
--jobdirectory jobs
