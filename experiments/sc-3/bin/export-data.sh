#!/bin/sh

mkdir -p exported-data-linear
mkdir -p exported-data-lineage

# Data export from mongodb bogs down on the larger samples unless we provide an 
# index for queries by simulation ID.  
cat << EOF > /tmp/mongo-index
use gc-simple-lineage-split-3_samples_raw;
db.seriationct_sample_unaveraged.ensureIndex( { simulation_run_id: 1 })
use gc-simple-linear-sample-3_samples_raw;
db.seriationct_sample_unaveraged.ensureIndex( { simulation_run_id: 1 })
EOF

mongo < /tmp/mongo-index
rm /tmp/mongo-index


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

