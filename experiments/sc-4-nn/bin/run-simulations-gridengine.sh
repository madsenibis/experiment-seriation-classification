#!/bin/sh

for d in `ls jobs/job*.sh`
do
        qsub -V -cwd $d
done