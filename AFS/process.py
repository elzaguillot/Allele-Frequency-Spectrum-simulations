#!/usr/bin/python

# Written by Elsa Guillot elza.guillot@gmail.com

# Written by Elsa Guillot elza.guillot@gmail.com

# No input on command line
# Must have the files 'simulatedXX.txt' in the same directory
# Output: processed_AFS.txt

# This code processes the output of the simulations to make them readable in R
# To select theta, we must find the average allele frequency spectrum that is the closest to the observed data
# For each theta, the simulated output is read, and the average allele frequency spectrum is computed and output in the file 'processed_AFS.txt'


import numpy as np

samplesize=5321
nbsimu=1000000
besttheta=131

# create array containing observed data
realdata=[0]*(samplesize+1)
realdata[1]=1562
realdata[2]=400
realdata[3]=190
realdata[4]=85
realdata[5]=50
realdata[6]=25
realdata[7]=20
realdata[8]=21
realdata[9]=13
realdata[10]=15
realdata[11]=10
realdata[12]=3
realdata[13]=2
realdata[14]=4
realdata[15]=4
realdata[16]=5
realdata[17]=4
realdata[18]=4
realdata[19]=2
realdata[20]=2
realdata[22]=1
realdata[23]=2
realdata[24]=3
realdata[28]=3
realdata[30]=1
realdata[32]=1
realdata[41]=1
realdata[43]=1
realdata[47]=1
realdata[71]=1

# output in file
out2=""
for k in realdata[0:300]:
    out2 += str(k) + " "
out2 += "\n"


filename="simulated"+str(besttheta)+".txt"
print "processing file "+filename
f=open(filename,'r')
ll=f.readlines()
tmp=[]
#out2=""
for l in ll:
    newaverage=[0]*300 # smaller for faster processing
    tmp.append(l.strip())
    for k in l.strip().split('\\n')[0].split(' '):
        newaverage[int(k)]+=1.0 # store the allele frequency spectrum of each simulation
	if(int(k)>299): #if extreme value store at least extreme value to make a smaller array - faster processing not impact on outcome
		newaverage[int(k)]+=1.0 
    for k in newaverage[0:300]: 
        out2+=str(k)+ " " #output the AFS of each simulation in a file
    out2 += '\n'

newfile="processed_AFS.txt"
f3=open(newfile,'w')
f3.write(out2)
f3.close()



