# Methodology notes

## Experimental design

The project evaluates three Bayesian network structure-learning paradigms on three discrete benchmark networks (ALARM, Hailfinder and Hepar II). Each network is sampled at five sample sizes: 500, 1,000, 2,500, 5,000 and 10,000.

## Algorithms and configurations

- PC stable with α = 0.01, 0.05 and 0.10.
- Hill Climbing with AIC, BIC and eBIC scores.
- MMHC with MMPC restriction using mutual-information testing and BIC score maximisation.

## Evaluation criteria

- Structural Hamming Distance (SHD).
- Missing and extra edges and orientation-related discrepancies.
- Average neighbourhood, branching and Markov blanket sizes.
- Local Markov blanket precision, recall and F1-score.
- CPU execution time.
- Total Variation Distance between ground-truth and learned-network interventional outcome distributions.

## Interventional simulation

The supplied R code fits the true and learned structures to the largest generated sample, extends learned CPDAGs with `cextend()`, estimates parameters by maximum likelihood, fixes the intervention target to a selected state, and samples 50,000 observations from each mutilated network. Outcome distributions are compared using TVD.

The code chooses the first factor level for each intervention target. The factor-level order must be checked in the actual generated data to verify that the selected state matches the intervention label used in the dissertation.
