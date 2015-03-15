#!/bin/bash

# Written by Elsa Guillot elza.guillot@gmail.com

# No input
# Output: simulatedXX.txt (XX=1...1000)

# This code simulates the allele frequency distribution of a population sample under the standard coalescent
# It uses the software ms and microsat to simulate 8 fully-linked Y-chromosome STRs
# It parses the output to create a file containing the number of occurrences of each haplotype (written to 'simulatedXX.txt')
# Theta values from 1 to 1000 are run with a step of 1, and from 200 to 100 with a step of 50
# 10,000 simulations are produced for each value of theta


samplesize=5321
nbsimu=1000
let "nbs=$nbsimu-1"

for j in `seq 1 200`
do 
	ms $samplesize 1 -t $j  | microsat -l 8 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 -i > mynewlocus && sort mynewlocus | uniq -c | awk '{printf($1 " ");}'  > simulated${j}.txt
	for i in `seq 1 $nbs`
	do
		echo "" >> simulated${j}.txt
		ms $samplesize 1 -t $j | microsat -l 8 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 -i > mynewlocus && sort mynewlocus | uniq -c | awk '{print $1}' | sort -n | tr '\n' ' ' >> simulated${j}.txt
	done
done


for j in `seq 200 50 1000`
do
	ms $samplesize 1 -t $j  | microsat -l 8 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 -i > mynewlocus && sort mynewlocus | uniq -c | awk '{print $1}' | sort -n | tr '\n' ' ' >  simulated${j}.txt
	for i in `seq 1 $nbs`
	do
		echo "" >> simulated${j}.txt
		ms $samplesize 1 -t $j | microsat -l 8 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 -i > mynewlocus && sort mynewlocus | uniq -c | awk '{print $1}' | sort -n | tr '\n' ' ' >> simulated${j}.txt
	done
done

rm mynewlocus
