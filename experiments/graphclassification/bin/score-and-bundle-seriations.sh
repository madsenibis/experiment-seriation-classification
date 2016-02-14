#!/bin/sh

#pdfjam-slides6up -o output/annotated-seriations-6up.pdf `find . -name "*annot*.png"`

# remove scores if they exist already
rm -f output/scores.csv

for d in `find . -name "*annot*.gml"`; do ( ../../bin/score-simple-chronology.py --gmlfile $d --debug 0  ); done >& output/scores.csv
