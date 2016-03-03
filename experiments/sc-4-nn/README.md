## sc-4-nn ##

The goal is to generate seriation samples from an approximate nearest neighbor model, with 
highly localized connectivity within a region which is 6x longer than wide.  


### Experiment Details ###

* 10 slices 
* 32 subpopulations per slice
* Edges per subpopulation have mean 1.25 and sd 0.25 in a lognormal distribution
* The regional space is 6x longer than wide
* Edges link vertices chosen randomly but biased by an negative exponential decay kernel with coefficient 3.0


