#!/bin/sh

echo "======================================"
echo "  Building early lineage coalesence model"
echo "======================================"


mkdir -p rawnetworkmodels/gc-early-lineage-coalesce-2-networkmodel
mkdir -p network-lineage

seriationct-build-lineage-splitting-network.py --debug 0 \
	--outputdirectory rawnetworkmodels/gc-early-lineage-coalesce-2-networkmodel \
	--experiment gc-early-lineage-coalesce-2 \
	--intercluster_edgeweight 1.0 \
	--intracluster_edgeweight 10 \
	--nodespercluster 8 \
	--interconnectfraction 0.1  \
	--centroidmin 100 \
	--centroidmax 1000 \
	--clusterspread 10 \
	--numclusters 4 \
	--numlineages 2 \
	--direction coalesce \
	--change_time 3 \
	--slices 10


cp bin/build-networkmodel.sh rawnetworkmodels/gc-early-lineage-coalesce-2-networkmodel
cd rawnetworkmodels
zip -r gc-early-lineage-coalesce-2-networkmodel.zip gc-early-lineage-coalesce-2-networkmodel/*.gml
zip -r gc-early-lineage-coalesce-2-full-networkmodel.zip gc-early-lineage-coalesce-2-networkmodel
cp gc-early-lineage-coalesce-2-networkmodel/gc-early-lineage-coalesce-2XY.txt ../xyfiles
mv gc-early-lineage-coalesce-2-networkmodel.zip ../network-lineage
cd ..
seriationct-explain-networkmodel.py --networkmodel network-lineage/gc-early-lineage-coalesce-2-networkmodel.zip

echo "======================================"
echo "  Building late lineage coalesence model"
echo "======================================"


mkdir -p rawnetworkmodels/gc-late-lineage-coalesce-2-networkmodel
mkdir -p network-lineage

seriationct-build-lineage-splitting-network.py --debug 0 \
	--outputdirectory rawnetworkmodels/gc-late-lineage-coalesce-2-networkmodel \
	--experiment gc-late-lineage-coalesce-2 \
	--intercluster_edgeweight 1.0 \
	--intracluster_edgeweight 10 \
	--nodespercluster 8 \
	--interconnectfraction 0.1  \
	--centroidmin 100 \
	--centroidmax 1000 \
	--clusterspread 10 \
	--numclusters 4 \
	--numlineages 2 \
	--direction coalesce \
	--change_time 7 \
	--slices 10


cp bin/build-networkmodel.sh rawnetworkmodels/gc-late-lineage-coalesce-2-networkmodel
cd rawnetworkmodels
zip -r gc-late-lineage-coalesce-2-networkmodel.zip gc-late-lineage-coalesce-2-networkmodel/*.gml
zip -r gc-late-lineage-coalesce-2-full-networkmodel.zip gc-late-lineage-coalesce-2-networkmodel
cp gc-late-lineage-coalesce-2-networkmodel/gc-late-lineage-coalesce-2XY.txt ../xyfiles
mv gc-late-lineage-coalesce-2-networkmodel.zip ../network-lineage
cd ..
seriationct-explain-networkmodel.py --networkmodel network-lineage/gc-late-lineage-coalesce-2-networkmodel.zip

