#!/bin/bash

# Written by Elsa Guillot elza.guillot@gmail.com

# No input
# Output: simulatedXX.txt (XX=1...1000)

# This code simulate the haplotye frequency of a sample in population under the coelescent
# It uses the software ms and microsat to simulate 8YSTR of equal variance
# It processes the output to create a file containing the the number of occurence of each haplotype to be writting in the output files simulatedXX.txt 
# The simulation run for a range of theta value from 1 to 1000 with a step of 1 until 200 and a step of 50 until 1000
# 10,000 simulations are produced for each theta



samplesize=5321
nbsimu=1000
let "nbs=$nbsimu-1"

for j in `seq 1 200`
do 
	./ms $samplesize 1 -t $j  | ./microsat -l 8 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 -i > mynewlocus && sort mynewlocus | uniq -c | awk '{printf($1 " ");}'  > simulated${j}.txt
	for i in `seq 1 $nbs`
	do
		echo "" >> simulated${j}.txt
		./ms $samplesize 1 -t $j | ./microsat -l 8 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 -i > mynewlocus && sort mynewlocus | uniq -c | awk '{print $1}' | sort -n | tr '\n' ' ' >> simulated${j}.txt
	done
done


for j in `seq 200 50 1000`
do
	./ms $samplesize 1 -t $j  | ./microsat -l 8 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 -i > mynewlocus && sort mynewlocus | uniq -c | awk '{print $1}' | sort -n | tr '\n' ' ' >  simulated${j}.txt
	for i in `seq 1 $nbs`
	do
		echo "" >> simulated${j}.txt
		./ms $samplesize 1 -t $j | ./microsat -l 8 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 -i > mynewlocus && sort mynewlocus | uniq -c | awk '{print $1}' | sort -n | tr '\n' ' ' >> simulated${j}.txt
	done
done

rm mynewlocus
