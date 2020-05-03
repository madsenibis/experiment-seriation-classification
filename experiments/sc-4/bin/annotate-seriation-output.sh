#!/bin/sh

######## Annotate seriation results ########

cd seriations-early-split

for d in `find . -name "*minmax-by-weight*.gml"`; 
	do ( seriationct-annotate-minmax-graph.py \
		--inputfile $d \
		--networkmodel ../network-split-early/gc-early-lineage-split-2-networkmodel.zip \
		--modeltype lineage \
		--experiment gc-early-lineage-split-2 \
		--addlabel early-split \
		--debug 1); 
done
cd ..

cd seriations-late-split

for d in `find . -name "*minmax-by-weight*.gml"`; 
	do ( seriationct-annotate-minmax-graph.py \
		--inputfile $d \
		--networkmodel ../network-split-late/gc-late-lineage-split-2-networkmodel.zip \
		--modeltype lineage \
		--experiment gc-late-lineage-split-2 \
		--addlabel late-split \
		--debug 1); 
done
cd ..

cd seriations-early-coalesce

for d in `find . -name "*minmax-by-weight*.gml"`; 
	do ( seriationct-annotate-minmax-graph.py \
		--inputfile $d \
		--networkmodel ../network-coalesce-early/gc-early-lineage-coalesce-2-networkmodel.zip \
		--modeltype lineage \
		--experiment gc-early-lineage-coalesce-2 \
		--addlabel early-coalesce \
		--debug 1); 
done
cd ..

cd seriations-late-coalesce

for d in `find . -name "*minmax-by-weight*.gml"`; 
	do ( seriationct-annotate-minmax-graph.py \
		--inputfile $d \
		--networkmodel ../network-coalesce-late/gc-late-lineage-coalesce-2-networkmodel.zip \
		--modeltype lineage \
		--experiment gc-late-lineage-coalesce-2 \
		--addlabel late-coalesce \
		--debug 1); 
done
cd ..




