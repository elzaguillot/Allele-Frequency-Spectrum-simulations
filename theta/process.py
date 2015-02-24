#!/usr/bin/python

# Written by Elsa Guillot elza.guillot@gmail.com

# No input in command line
# Must have the files simulatedXX.txt in the same directory
# Output: processed_AFS.txt

# This code processes the output of the simulation to be readible in R
# Looking for theta, we must find the average AFS (Allele frequency sprectum) the closest to the observed data
# For each theta, the simulated output is read, and the average AFS is computed and outputed in processed_AFS.txt


import numpy as np

samplesize=5321
nbsimu=1000

# create array containing observed data
realdata=[0]*(samplesize+1)
realdata[1]=1588
realdata[2]=400
realdata[3]=190
realdata[4]=85
realdata[5]=50
realdata[6]=25
realdata[7]=20
realdata[8]=20
realdata[9]=11
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
realdata[23]=1
realdata[24]=3
realdata[28]=3
realdata[30]=1
realdata[32]=1
realdata[41]=1
realdata[43]=1
realdata[47]=1
realdata[71]=1

# output in file
out=""
out += "0\t"
for k in realdata:
    out += str(k) + "\t"
out += "\n"

#load the simulation file
myaverage={}
# from 1 to 200, step of 1
for i in range(1,200):
    newi=i
    newaverage=[0]*5322
    filename="simulated"+str(newi)+".txt" 
    print "reading file "+filename 
    f=open(filename,'r')
    ll=f.readlines()
    tmp=[] 
    for l in ll:
        tmp.append(l.strip())
        for k in l.strip().split(' '):
            newaverage[int(k)]+=1.0/nbsimu # compute the avergae AFS for all simulation of theta=i
    myaverage[i]=newaverage
    out+=str(newi)+ " "
    for k in newaverage:
        out+=str(k)+" "
    out+="\n "

# from 200 to 1000, step of 50
for i in range(200,1001,50):
    newi=i
    newaverage=[0]*5322
    filename="simulated"+str(newi)+".txt"
    print "reading file "+filename 
    f=open(filename,'r')
    ll=f.readlines()
    tmp=[]
    for l in ll:
        tmp.append(l.strip())
        for k in l.strip().split(' '):
            newaverage[int(k)]+=1.0/nbsimu # compute the avergae AFS for all simulation of theta=i
    myaverage[i]=newaverage
    out+=str(newi)+ " "
    for k in newaverage:
        out+=str(k)+" "
    out+="\n "



newfile="processed_AFS.txt"
f2=open(newfile,'w')
f2.write(out)
f2.close()
