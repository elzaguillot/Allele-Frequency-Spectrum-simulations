#!/usr/bin/R

# Written by Elsa Guillot elza.guillot@gmail.com

# No input in command line
# Must have the files processed_AFS.txt in the same directory
# Output file fig1.pdf
# Comamnd line output: percentage of simulations having at least 15 major haplotypes (>20 individuals)

# This code processes the output of the simulation to compare the distribution of AFS with the observed data
# The script eventually produces plot fig1.pdf which matches fig1.pdf of the original paper


#read the data
data=read.table('processed_AFS.txt')
nbsimu=1000000

low95 <- function(data){
  return(quantile(data,c(0.025,0.975))[[1]])
}
hig95 <- function(data){
  return(quantile(data,c(0.025,0.975))[[2]])
}

nbsimu=length(data[,1])-1
observed=data[1,2:300] # store observed AFS
datasimu=data[2:(nbsimu+1),2:300] # store simulated AFS

meansimu=apply(datasimu,2,mean) #average AFS
medsimu=apply(datasimu,2,median) # median
lowsimu=apply(datasimu,2,low95) #95% CI lowerbound
highsimu=apply(datasimu,2,hig95) #95%CI upperbound

# find how odd is the number of observed high haplotype
m20 <- datasimu[,21:299] ## all the haplotype present in more than 20 individuals
morethan20=rowSums(m20) ## nb of haplotype per simulation present in more than 20 individuals
print("Percentage of simulation with at least 15 haplotypes present in more than 20 individuals")
print(strtoi(summary(morethan20>=15)['TRUE'][[1]])*1.0/nbsimu) 

observed2D=cbind(1:299,unlist(observed))
observedPos <- observed2D[observed2D[,2]>0,] # the AFS with only positive number

width <- 0.3
# plot figure 1 of balaresque paper with simulated 95%CI
#pdf("fig1.pdf")
plot(observedPos,col='white',lwd=2,pch="+",cex=2,xlab=expression(bold('Haplotype frequency')),ylab=expression(bold('Number of events (log)')),log='y') # plot nothing but the right axes and limit
polygon(c(1:299, rev(1:299)),c(lowsimu+0.00000001,rev(highsimu+0.00000001)),col="lightpink",border=NA)
rect(xleft=observedPos[,1]-width,xright=observedPos[,1]+width,ybottom=0.0001,ytop=observedPos[,2],col='black') # plot the black histogram 
rect(xleft=observedPos[21:30,1]-width,xright=observedPos[21:30,1]+width,ybottom=0.0001,ytop=observedPos[21:30,2],col='slategrey',border='slategrey') # plot the blue histogram
lines(1:100,lowsimu[1:100]+0.00000001,col='red',lwd=2,lty=3) # plot the lower 95%CI of simu
lines(1:100,highsimu[1:100],col='red',lwd=2,lty=3) # plot the higher 95%CI of simu
#dev.off()
