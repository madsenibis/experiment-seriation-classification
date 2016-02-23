#!/bin/sh
for d in `ls jobs/job*.sh`; do ( 
	for l in `cat $d`; do (
		qsub -V $l
	)
); done