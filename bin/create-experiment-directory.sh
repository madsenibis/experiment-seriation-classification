#!/bin/sh

mkdir -p $1
cp -rp ../template/bin $1
cp ../template/runall.sh $1/
cp ../template/seriationct-priors.json $1/
cp ../template/README.md $1/
cd $1/bin
perl -pi.bak -e "s/REPLACEME/$1/g" *.sh
rm *.bak
cd ..
perl -pi.bak -e "s/REPLACEME/$1/g" README.md
rm *.bak



mkdir jobs
mkdir temporal
mkdir xyfiles

# touch a file in each, so that the empty directories persist in Git 
# prior to having content.  this makes it easier to synchronize an experiment
# through Github to multiple machines

touch jobs/README
touch temporal/README
touch xyfiles/README



cd ..

echo "Experiment $1 directory structure complete"
echo "To configure your experiment, edit the files under the bin/ subdirectory "
echo "to specify a network model, seriation parameters, and simulation runbuilder "
echo "parameters.  To specify the simulation parameters themselves, edit the JSON "
echo "file in the main directory."
echo " "
echo "To run the experiment, in the main experiment directory ($1): "
echo "  sh runall.sh "



