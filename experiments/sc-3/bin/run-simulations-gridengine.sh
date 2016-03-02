#!/bin/sh

### grab this one from Ewens, where I got it working!!

for d in `ls jobs/job*.sh`; do ( 
	for l in `cat $d`; do (
		qsub -V $l
	)
); done