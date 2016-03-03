#!/bin/sh

mkdir -p exported-data-nearestneighbor

cat << EOF > /tmp/mongo-index
use sc-nearest-neighbor-1_samples_raw;
db.seriationct_sample_unaveraged.ensureIndex( { simulation_run_id: 1 })
EOF

mongo < /tmp/mongo-index
rm /tmp/mongo-index

echo "=================== exporting nearest =============="

seriationct-export-simids.py --experiment sc-nearest-neighbor-1 --outputfile nn-simids.txt
for d in `cat nn-simids.txt`;
do ( 
	echo "export $d"
	seriationct-export-single-simulation.py --experiment gc-simple-linear-sample-3 \
		--outputdirectory exported-data-nearestneighbor \
		--simid $d 
); done

