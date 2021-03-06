#!/bin/sh

echo "========================================================="
echo "  Building approximate nearest neighbor model"
echo "========================================================="

mkdir -p rawnetworkmodels/REPLACEME-networkmodel
mkdir -p networkmodels

seriationct-build-spatial-neighbor-network.py \
	--outputdirectory rawnetworkmodels/REPLACEME-networkmodel \
	--experiment REPLACEME \
	--slices 10 \
	--numpopulations 32 \
	--spatialaspectratio 6.0 \
	--edgeweight 10 \
	--meanedgesperpopulation 1.25 \
	--sdedgesperpopulation 0.25 \
	--exponentialcoefficient 3 \
	--debug 0

cp bin/build-networkmodel.sh rawnetworkmodels/REPLACEME-networkmodel
cd rawnetworkmodels
zip -r REPLACEME-network.zip REPLACEME-networkmodel/*.gml
zip -r REPLACEME-full-network.zip REPLACEME-networkmodel
cp REPLACEME-networkmodel/REPLACEME-XY.txt ../xyfiles
mv REPLACEME-network.zip ../networkmodels
cd ..

seriationct-explain-networkmodel.py \
	--networkmodel networkmodels/REPLACEME-network.zip



