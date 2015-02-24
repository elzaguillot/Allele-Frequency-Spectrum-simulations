#!/usr/bin/R

# Written by Elsa Guillot elza.guillot@gmail.com

# No input on command line
# Must have the file 'processed_AFS.txt' in the same directory
# No output file
# Command line output: maximized value of theta

# This code processes output from the simulations to find which theta most closely matches the observed distribution
# The script produces a plot of the allele frequency distribution


#read the data
data=read.table('processed_AFS.txt')

#plot the data AFS
plot(1:100,data[1,2:101],col='red',type='l',lwd=3)
nbsimu=length(data[,1])-1
thetas=data[2:(nbsimu+1),1]
for( i in 2:(nbsimu+1))
    {# plot the average simu AFS
        lines(1:100,data[i,2:101],col=rainbow(1000)[i])
    }
real=data[1,2:101] 
bestyet=100000000
for( i in 2:(nbsimu+1))
    {
	theta=data[i,1]
        if(sum((real-data[i,2:101])^2) < bestyet) # minimize the least square 
           {
               best =i
		thetabest=theta
               bestyet=sum((real-data[i,2:101])^2)
           }
    }


print("the best theta found is:")
print(thetabest)

#plot to see if it fits
lines(1:100,data[best,2:101],col='black',lwd=3) 

## shorter plot (zoom on left side
plot(1:20,data[1,2:21],col='red',type='l',lwd=3,ylim=c(0,2000))
for( i in 2:(nbsimu+1))
    {
        lines(1:20,data[i,2:21],col=rainbow(1000)[i])
    }
lines(1:20,data[best,2:21],col='blue',lwd=3) 

