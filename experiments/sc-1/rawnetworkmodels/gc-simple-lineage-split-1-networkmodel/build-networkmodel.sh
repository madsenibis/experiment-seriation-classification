#!/bin/sh

echo "========================================================="
echo "  Building simple connected model with linear seriation"
echo "========================================================="

mkdir -p rawnetworkmodels/gc-simple-linear-sample-1-networkmodel
mkdir -p network-linear

seriationct-build-single-linear-network.py --outputdirectory rawnetworkmodels/gc-simple-linear-sample-1-networkmodel \
	--experiment gc-simple-linear-sample-1 \
	--slices 10 \
	--numpopulations 64 \
	--centroidx 500 \
	--centroidy 500 \
	--spatialsd 100 \
	--edgeweight 10 \
	--debug 0

cp bin/build-networkmodel.sh rawnetworkmodels/gc-simple-linear-sample-1-networkmodel
cd rawnetworkmodels
zip -r gc-simple-linear-sample-1-network-gml.zip gc-simple-linear-sample-1-networkmodel/*.gml
zip -r gc-simple-linear-sample-1-full-network.zip gc-simple-linear-sample-1-networkmodel
cp gc-simple-linear-sample-1-networkmodel/gc-simple-linear-sample-1XY.txt ../xyfiles
mv gc-simple-linear-sample-1-network-gml.zip ../network-linear
cd ..

seriationct-explain-networkmodel.py --networkmodel network-linear/gc-simple-linear-sample-1-network-gml.zip

echo "======================================"
echo "  Building lineage splitting model"
echo "======================================"


mkdir -p rawnetworkmodels/gc-simple-lineage-split-1-networkmodel
mkdir -p network-lineage

seriationct-build-lineage-splitting-network.py --debug 0 \
	--outputdirectory rawnetworkmodels/gc-simple-lineage-split-1-networkmodel \
	--experiment gc-simple-lineage-split-1 \
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
	--change_time 4 \
	--slices 10


cp bin/build-networkmodel.sh rawnetworkmodels/gc-simple-lineage-split-1-networkmodel
cd rawnetworkmodels
zip -r gc-simple-lineage-split-1-networkmodel.zip gc-simple-lineage-split-1-networkmodel/*.gml
zip -r gc-simple-lineage-split-1-full-networkmodel.zip gc-simple-lineage-split-1-networkmodel
cp gc-simple-lineage-split-1-networkmodel/gc-simple-lineage-split-1XY.txt ../xyfiles
mv gc-simple-lineage-split-1-networkmodel.zip ../network-lineage
cd ..
seriationct-explain-networkmodel.py --networkmodel network-lineage/gc-simple-lineage-split-1-networkmodel.zip

