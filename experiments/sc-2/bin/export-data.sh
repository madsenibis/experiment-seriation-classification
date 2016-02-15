#!/bin/sh

mkdir -p exported-data-early-split
mkdir -p exported-data-late-split
mkdir -p exported-data-early-coalesce
mkdir -p exported-data-late-coalesce

echo "=================== exporting early split model =============="

seriationct-export-simids.py --experiment gc-early-lineage-split-2 --outputfile earlysplit-simids.txt
for d in `cat earlysplit-simids.txt`;
do ( 
	echo "export $d"
	seriationct-export-single-simulation.py --experiment gc-early-lineage-split-2 \
		--outputdirectory exported-data-early-split \
		--simid $d 
); done

echo "=================== exporting late split model =============="

seriationct-export-simids.py --experiment gc-late-lineage-split-2 --outputfile latesplit-simids.txt
for d in `cat latesplit-simids.txt`;
do ( 
	echo "export $d"
	seriationct-export-single-simulation.py --experiment gc-late-lineage-split-2 \
		--outputdirectory exported-data-late-split \
		--simid $d 
); done

echo "=================== exporting early coalesce model =============="

seriationct-export-simids.py --experiment gc-early-lineage-coalesce-2 --outputfile earlycoalesce-simids.txt
for d in `cat earlycoalesce-simids.txt`;
do ( 
	echo "export $d"
	seriationct-export-single-simulation.py --experiment gc-early-lineage-coalesce-2 \
		--outputdirectory exported-data-early-coalesce \
		--simid $d 
); done

echo "=================== exporting late coalesce model =============="

seriationct-export-simids.py --experiment gc-late-lineage-coalesce-2 --outputfile latecoalesce-simids.txt
for d in `cat latecoalesce-simids.txt`;
do ( 
	echo "export $d"
	seriationct-export-single-simulation.py --experiment gc-late-lineage-coalesce-2 \
		--outputdirectory exported-data-late-coalesce \
		--simid $d 
); done