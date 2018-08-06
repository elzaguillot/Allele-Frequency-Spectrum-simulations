Allele Frequency Spectrum

Elsa Guillot
University of Lausanne
(Previously Massey University)
elza.guillot@gmail.com


This repository contains the code to simulate the allele ('haplotype') frequency spectrum (Figure 1) observed in Central Asia by Balaresque and colleagues ("Y chromosome descent clusters and male differential reproductive success: Young lineage expansions dominate Asian pastoral populations"). This corresponds to the work presented in the manuscript found here: http://www.biorxiv.org/content/early/2015/07/07/022160

The aim is to check whether the observed distribution varies from neutral expectations.

Part 1: Finding theta

The aim is to determine which value of theta (the scaled population mutation rate) matches the observed allelic diversity.  The code for this analysis is provided in the 'theta' repository.

Part 2: Finding the variance of the allele frequency distribution

The aim is to place confidence intervals on the observed allele frequency distribution from one million coalescent datasets.  The code for this analysis is provided in the 'AFS' repository.

Note: runtimes for both parts of this analysis are long (hours to days).  Y chromosome coalescent trees are generated with ms and transformed to 8 fully-linked STR loci using microsat.  Output files are parsed with Python and R.  For each section, the entire analysis has been automated as a bash script.

The following computer requirements to needed to run the code:

- UNIX operating system
- R
- Python
- ms: http://home.uchicago.edu/~rhudson1/source/mksamples.html
- microsat: https://www.genomicus.com/software.html#microsat

Hudson R. 2002. Generating samples under a Wright–Fisher neutral model of genetic variation. Bioinformatics 18:337-338.

Balaresque P, et al. 2015. Y chromosome descent clusters and male differential reproductive success: Young lineage expansions dominate Asian pastoral populations. European Journal of Human Genetics, In Press.
