# Allele-Frequency-Spectrum-simulations
# written by Elsa Guillot elza.guillot@gmail.com - Massey University

This reprository contains the code to reproduce simulated allele frequency spectrum to check whether high frequency observed in the paper "Y chromosome descent clusters and male differential reproductive success: young lineage expansions dominate Asian pastoral populations" by Balaresquee et published in the European journal of human genetics.
It contains the integrality of the code needed to reproduce the simulated allele frequency spectrum (AFS)to be conpared with figure 1 of the paper

In the 1st part one must find a theta that matches the observed diversity presented in the paper. The necessary code is under the theta reprository
In a 2nd part one must run 1 million simulations to create the AFS. The necessary code is under the AFS directory
Each time, one must run simulations with the software ms (Hudson 2002)  processed by the microsat software (by Cox), transofrm the output, process the files through python and analysis the data with R.

The necessary requirement to run the attached code are:
- UNIX operating system
- installed R and python

MS software:
http://home.uchicago.edu/~rhudson1/source/mksamples.html

Microsat software:
http://massey.genomicus.com/software.html#microsat

Hudson R R. 2002. Generating samples under a Wright–Fisher neutral model of genetic variation. Bioinformatics, 18(2):337-338
