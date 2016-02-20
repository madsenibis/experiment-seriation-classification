# Seriation Classification Experiment (serclassification) Index #
 
# sc-1 #

seriation classification experiment #1

Goal:  correctly identify two regional network models (which are very different) from the minmax-by-weight seriation solution graphs, using Laplacian eigenvalue spectral distance.


Composed of:

* Two network models, 50 simulations each.
* Model #1 is a "linear" model with 64 subpopulations, fully connected and equally weighted
* Model #2 is a "lineage" model with 8 nodes per cluster of communities, fully connected internally, 10% connected externally, which splits into two lineages of two clusters of communities 40% of the way through the simulation.
* Simulated assemblages created by resampling to 500, sampling 3 communities per time slice, and filtering out types/classes with fewer than 3 column entries.
* Seriations performed with frequency and continuity
* Low innovation and migration fractions 0.00001-0.0001, 0.05 - 0.1


# sc-2 #

seriation classification experiment #1

Goal:  examine potential equifinalities among lineage models, depending upon 
timing and direction of splitting/coalescence.  Classifier based upon the minmax-by-weight seriation solution graphs, using Laplacian eigenvalue spectral distance.


Composed of:

* Four network models, 50 simulations each.
* Model #1 is an "early split" lineage model with 8 nodes per cluster of communities, fully connected internally, 10% connected externally, which splits into two lineages of two clusters of communities 30% of the way through the simulation.
* Model #2 is an "late split" lineage model with 8 nodes per cluster of communities, fully connected internally, 10% connected externally, which splits into two lineages of two clusters of communities 70% of the way through the simulation.
* Model #3 is an "early coalescence" lineage model with 8 nodes per cluster of communities, fully connected internally, 10% connected externally, which coalesces two lineages of two clusters of communities into a single lineage 30% of the way through the simulation.
* Model #4 is an "late coalescence" lineage model with 8 nodes per cluster of communities, fully connected internally, 10% connected externally, which coalesces two lineages of two clusters of communities into a single lineage 70% of the way through the simulation.
* Simulated assemblages created by resampling to 500, sampling 3 communities per time slice, and filtering out types/classes with fewer than 3 column entries.
* Seriations performed with frequency and continuity
* Low innovation and migration fractions 0.00001-0.0001, 0.05 - 0.1

# sc-3 #

seriation classification experiment #1 - extended

Goal:  Run more simulations using the exact configuration of sc-1, to get 500 total simulations from each of the two models


