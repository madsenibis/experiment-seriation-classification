#!/bin/sh

mkdir -p exported-data-linear
mkdir -p exported-data-lineage


echo "=================== exporting lineage split model =============="

seriationct-export-simids.py --experiment gc-simple-lineage-split-3 --outputfile lineage-simids.txt
for d in `cat lineage-simids.txt`;
do ( 
	echo "export $d"
	seriationct-export-single-simulation.py --experiment gc-simple-lineage-split-3 \
		--outputdirectory exported-data-lineage \
		--simid $d 
); done

echo "=================== exporting linear model =============="

seriationct-export-simids.py --experiment gc-simple-linear-sample-3 --outputfile linear-simids.txt
for d in `cat linear-simids.txt`;
do ( 
	echo "export $d"
	seriationct-export-single-simulation.py --experiment gc-simple-linear-sample-3 \
		--outputdirectory exported-data-linear \
		--simid $d 
); done

