#!/bin/sh

echo "========================================================="
echo "  Building approximate nearest neighbor model"
echo "========================================================="

mkdir -p rawnetworkmodels/sc-5-nn-networkmodel
mkdir -p networkmodels

seriationct-build-spatial-neighbor-network.py \
	--outputdirectory rawnetworkmodels/sc-5-nn-networkmodel \
	--experiment sc-5-nn \
	--slices 10 \
	--numpopulations 32 \
	--spatialaspectratio 6.0 \
	--edgeweight 10 \
	--meanedgesperpopulation 1.25 \
	--sdedgesperpopulation 0.25 \
	--exponentialcoefficient 3 \
	--debug 0

cp bin/build-networkmodel.sh rawnetworkmodels/sc-5-nn-networkmodel
cd rawnetworkmodels
zip -r sc-5-nn-network.zip sc-5-nn-networkmodel/*.gml
zip -r sc-5-nn-full-network.zip sc-5-nn-networkmodel
cp sc-5-nn-networkmodel/sc-5-nn-XY.txt ../xyfiles
mv sc-5-nn-network.zip ../networkmodels
cd ..

seriationct-explain-networkmodel.py \
	--networkmodel networkmodels/sc-5-nn-network.zip



