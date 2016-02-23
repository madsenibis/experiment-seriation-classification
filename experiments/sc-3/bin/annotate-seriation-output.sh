#!/bin/sh

######## Annotate linear seriation results ########

cd seriations-linear-filtered

for d in `find . -name "*minmax-by-weight*.gml"`; 
	do ( seriationct-annotate-minmax-graph.py \
		--inputfile $d \
		--networkmodel ../network-linear/simple-linear-sample-1-network-gml.zip \
		--modeltype lineage \
		--experiment gc-simple-linear-sample-3 \
		--addlabel unfiltered \
		--debug 1); 
done
cd ..

######### Annotate lineage seriation results ########

cd seriations-lineage-filtered

for d in `find . -name "*minmax-by-weight*.gml"`; 
	do ( seriationct-annotate-minmax-graph.py \
		--inputfile $d \
		--networkmodel ../network-lineage/simple-lineage-sample-1-network-gml.zip \
		--modeltype lineage \
		--experiment gc-simple-lineage-sample-3 \
		--addlabel filtered \
		--debug 1); 
done
cd ..


# create a PDF of the resulting annotated seriations, sorted into blocks based on the UUID for the seriation
# to facilitate side-by-side comparison of freq/continuity and filtered/unfiltered

# mkdir tmpfiles
# find . -name "*ical.png" > tmpnames
# for d in `cat tmpnames`; do ( basename $d >> tmpnames.base; cp $d tmpfiles ); done
# sort -n tmpnames.base > tmpnames.sorted
# cd tmpfiles
# convert `cat ../tmpnames.sorted` ../simple-linear-sample-1-annotated-seriations.pdf
# rm tmpnames*
# rm -rf tmpfiles

