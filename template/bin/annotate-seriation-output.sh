#!/bin/sh

######## Annotate linear seriation results ########

cd seriations-slice-stratified-filtered

for d in `find . -name "*minmax-by-weight*.gml"`; 
	do ( seriationct-annotate-minmax-graph.py \
		--inputfile $d \
		--networkmodel ../networkmodels/REPLACEME-network.zip \
		--modeltype lineage \
		--experiment REPLACEME \
		--addlabel slice-strat-filtered \
		--debug 1); 
done
cd ..




