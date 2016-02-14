#!/bin/sh

mkdir -p exported-data-linear
mkdir -p exported-data-lineage

echo "==================== export data files ====================="

echo "=================== exporting lineage split model =============="

seriationct-export-simids.py --experiment gc-simple-lineage-split-1 --outputfile lineage-simids.txt
for d in `cat lineage-simids.txt`;
do ( 
	echo "export $d"
	seriationct-export-single-simulation.py --experiment gc-simple-lineage-split-1 \
		--outputdirectory exported-data-lineage \
		--simid $d 
); done

