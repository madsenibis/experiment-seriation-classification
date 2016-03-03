#!/bin/sh

mkdir -p exported-data

cat << EOF > /tmp/mongo-index
use sc-5-nn_samples_raw;
db.seriationct_sample_unaveraged.ensureIndex( { simulation_run_id: 1 })
EOF

mongo < /tmp/mongo-index
rm /tmp/mongo-index

echo "=================== exporting nearest =============="

seriationct-export-simids.py --experiment sc-5-nn --outputfile nn-simids.txt
for d in `cat nn-simids.txt`;
do ( 
	echo "export $d"
	seriationct-export-single-simulation.py --experiment sc-5-nn \
		--outputdirectory exported-data \
		--simid $d 
); done

