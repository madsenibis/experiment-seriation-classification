#!/bin/sh

echo "======================================"
echo "  Building nearest neighbor model"
echo "======================================"


mkdir -p rawnetworkmodels/gc-early-lineage-split-2-networkmodel
mkdir -p network-split-early

seriationct-build-lineage-splitting-network.py --debug 0 \
	--outputdirectory rawnetworkmodels/gc-early-lineage-split-2-networkmodel \
	--experiment gc-early-lineage-split-2 \
	--intercluster_edgeweight 1.0 \
	--intracluster_edgeweight 10 \
	--nodespercluster 8 \
	--interconnectfraction 0.1  \
	--centroidmin 100 \
	--centroidmax 1000 \
	--clusterspread 10 \
	--numclusters 4 \
	--numlineages 2 \
	--direction split \
	--change_time 3 \
	--slices 10


cp bin/build-networkmodel.sh rawnetworkmodels/gc-early-lineage-split-2-networkmodel
cd rawnetworkmodels
zip -r gc-early-lineage-split-2-networkmodel.zip gc-early-lineage-split-2-networkmodel/*.gml
zip -r gc-early-lineage-split-2-full-networkmodel.zip gc-early-lineage-split-2-networkmodel
cp gc-early-lineage-split-2-networkmodel/gc-early-lineage-split-2XY.txt ../xyfiles
mv gc-early-lineage-split-2-networkmodel.zip ../network-split-early
cd ..
seriationct-explain-networkmodel.py --networkmodel network-split-early/gc-early-lineage-split-2-networkmodel.zip

echo "======================================"
echo "  Building late lineage splitting model"
echo "======================================"


mkdir -p rawnetworkmodels/gc-late-lineage-split-2-networkmodel
mkdir -p network-split-late

seriationct-build-lineage-splitting-network.py --debug 0 \
	--outputdirectory rawnetworkmodels/gc-late-lineage-split-2-networkmodel \
	--experiment gc-late-lineage-split-2 \
	--intercluster_edgeweight 1.0 \
	--intracluster_edgeweight 10 \
	--nodespercluster 8 \
	--interconnectfraction 0.1  \
	--centroidmin 100 \
	--centroidmax 1000 \
	--clusterspread 10 \
	--numclusters 4 \
	--numlineages 2 \
	--direction split \
	--change_time 7 \
	--slices 10


cp bin/build-networkmodel.sh rawnetworkmodels/gc-late-lineage-split-2-networkmodel
cd rawnetworkmodels
zip -r gc-late-lineage-split-2-networkmodel.zip gc-late-lineage-split-2-networkmodel/*.gml
zip -r gc-late-lineage-split-2-full-networkmodel.zip gc-late-lineage-split-2-networkmodel
cp gc-late-lineage-split-2-networkmodel/gc-late-lineage-split-2XY.txt ../xyfiles
mv gc-late-lineage-split-2-networkmodel.zip ../network-split-late
cd ..
seriationct-explain-networkmodel.py --networkmodel network-split-late/gc-late-lineage-split-2-networkmodel.zip


echo "======================================"
echo "  Building early lineage coalesce model"
echo "======================================"


mkdir -p rawnetworkmodels/gc-early-lineage-coalesce-2-networkmodel
mkdir -p network-coalesce-early

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
mv gc-early-lineage-coalesce-2-networkmodel.zip ../network-coalesce-early
cd ..
seriationct-explain-networkmodel.py --networkmodel network-coalesce-early/gc-early-lineage-coalesce-2-networkmodel.zip

echo "======================================"
echo "  Building late lineage splitting model"
echo "======================================"


mkdir -p rawnetworkmodels/gc-late-lineage-coalesce-2-networkmodel
mkdir -p network-coalesce-late

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
mv gc-late-lineage-coalesce-2-networkmodel.zip ../network-coalesce-late
cd ..
seriationct-explain-networkmodel.py --networkmodel network-coalesce-late/gc-late-lineage-coalesce-2-networkmodel.zip

