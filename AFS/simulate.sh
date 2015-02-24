#!/bin/bash

# Written by Elsa Guillot elza.guillot@gmail.com

# No input
# Output: simulatedXX.txt (XX=1...1000)

# This code simulate the haplotye frequency of a sample in population under the coelescent
# It uses the software ms and microsat to simulate 8YSTR of equal variance
# It processes the output to create a file containing the the number of occurence of each haplotype to be writting in the output files simulatedXX.txt 
# The simulation run for an optimized theta value 
# 1,000,000 simulations are produced



samplesize=5321
nbsimu=1000000

let "nbs=$nbsimu-1"
j=131 # best theta

#echo ./ms $samplesize 1 -t $j 

./ms $samplesize 1 -t $j  | ./microsat -l 8 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 -i > mynewlocus && sort mynewlocus | uniq -c | awk '{printf($1 " ");}'  > simulated${j}.txt
for i in `seq 1 $nbs`
do
	echo "" >> simulated${j}.txt
	./ms $samplesize 1 -t $j | ./microsat -l 8 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 -i > mynewlocus && sort mynewlocus | uniq -c | awk '{print $1}' | sort -n | tr '\n' ' ' >> simulated${j}.txt
done

rm mynewlocus
