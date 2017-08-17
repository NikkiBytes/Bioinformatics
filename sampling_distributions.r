#Nichollette Acosta
#BINF 3121 

library(gdata)
library(gtools)
setwd("~/BINF/Assignment4")

dir() #check working directory contents

#QUESTION 1: 

#Generate the sampling distribution of ¯X over 200 samples of size 10 and
#plot the distribution you generate.

#PART A
#Create 200 sample size matrix from list 
#Use a uniform random generator to
#obtain 200 random samples with each random sample having 10 birth weights.
#For each random sample, compute its sample mean.  You will have a total of
#200 sample means and plot the histogram of these 200 numbers.)


#get the population
input_file <- read.csv("birth weight_2.csv", header=TRUE )
pop_matrix <- as.matrix(input_file)
pop_matrix



sample_size <- 200

#Get sample mean distribution 
samples = matrix(nrow=sample_size, ncol=10)
sample_mean_dis= matrix()
sample_median_dis = matrix()
sample_sums = matrix()
min_set = matrix()
max_set = matrix()





for (i in 1:sample_size){
  
  S=sample(pop_matrix,10)
  
  sample_mean = sum(S)/10
  sample_median = median(S)
  sum = sum(S)
  smallest = min(S)
  largest = max(S)

  #print(smallest) 
  #print(sample_median)
  #print(sample_mean)
  for(x in 1:10){samples[i,x] <- c(S[x])}
  sample_mean_dis[i] = c(sample_mean)
  sample_median_dis[i]= c(sample_median)
  sample_sums[i] = c(sum)
  min_set[i] <- c(smallest)
  max_set[i] <- c(largest)
}

layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
  
#PART (A)
average = mean(sample_mean_dis)
hist(sample_mean_dis, border = "aquamarine4", col="aquamarine", xlab="Sample Mean", main="Sample Mean Distribution")
abline(v = average, col="navy", lwd=10)
average  

#PART (B)
#generate the sampling distribution of the sample median.
average = mean(sample_median_dis)
hist(sample_median_dis, border = "aquamarine4", col="aquamarine", xlab="Sample Median ", main="Sample Median Distribution")
abline(v = average, col="navy", lwd=10)
average

#PART (C)
#For the 200 random samples you obtained in (A), generate the sampling
#distribion of the average of the smallest and largest observation.

d <- cbind(min_set, max_set)

average =mean(d)
average

#unique_pop <- runif(200, a, b)
hist(d, col="aquamarine", border="aquamarine4", main="Smallest and Largest Sampling Distribution", xlab="Birth Weight(W), bold line highlights Average")
abline(v = average, col="navy", lwd=10)


###########################################

#QUESTION 2



samplingDistribution <- function(n){
  sample_size <-200
  for (i in 1:sample_size){
    
    S=sample(pop_matrix,n)
    
    sample_mean = sum(S)/n
    sample_median = median(S)
    sum = sum(S)
    
    #print(sample_median)
    #print(sample_mean)
    for(x in 1:10){samples[i,x] <- c(S[x])}
    sample_mean_dis[i] = c(sample_mean)
    sample_median_dis[i]= c(sample_median)
    sample_sums[i] = c(sum)
    
    
  }
  average = mean(sample_mean_dis)
  hist(sample_median_dis, xlim=range(90, 130),border = "palegreen4", col="palegreen", xlab="Sample Mean", main="Sample Mean Distribution")
  abline(v = average, col="olivedrab4", lwd=10)
  average

}

par(mfrow=c(3,1))
samplingDistribution(10)
samplingDistribution(20)
samplingDistribution(30)


#########################################################
#QUESTION 3

samplingDistribution <- function(n){
  sample_size <-200
  for (i in 1:sample_size){
    
    S=sample(pop_matrix,n)
    
    sample_mean = sum(S)/n
    sample_median = median(S)
    sum = sum(S)
    
    #print(sample_median)
    #print(sample_mean)
    for(x in 1:10){samples[i,x] <- c(S[x])}
    sample_mean_dis[i] = c(sample_mean)
    sample_median_dis[i]= c(sample_median)
    sample_sums[i] = c(sum)
    
    
  }
  average = mean(sample_mean_dis)
  hist(sample_median_dis, xlim=range(70, 140),border = "navajowhite3", col="navajowhite", xlab="Sample Mean", main="Sample Mean Distribution")
  abline(v = average, col="orange", lwd=10)
  average
  
}

par(mfrow=c(3,1))
samplingDistribution(1)
samplingDistribution(5)
samplingDistribution


###############################################################
#We wish to estimate the average number of heartbeats per minute for a
#certain population. The average number of heartbeats per minute for a sample
#of 49 subjects was found to be 90. Assume that these 49 patients constitute a
#random sample, and that the population is normally distributed with a standard
#deviation of 10. Construct 90, 95, and 99 percent confidence intervals for the
#population mean, and state the practical and probabilistic interpretations of
#each. Explain why the three intervals that you construct are not of equal width.
#Indicate which of the three intervals you would prefer to use as an estimate of
#the population mean, and state the reason for your choice.'''


# 3. Probabilistic interpretation of confidence intervals
mean <- 90
sd <-10
standard_error <- 10/sqrt(49)

sample_pop <- rnorm(49, mean, sd)
margin_errorA <- 1.645*standard_error #for .90
margin_errorB <- 1.96*standard_error#for .95
margin_errorC <- 2.575*standard_error #for .99                              

lowerA <- mean - margin_errorA 
upperA <- mean + margin_errorA
lowerB <- mean - margin_errorB 
upperB <- mean + margin_errorB
lowerC <- mean - margin_errorC 
upperC <- mean + margin_errorC



plot(c(lowerA, upperA), c(1,1),
     type="l",
     col="blue",lwd=2,
     xlim=c(lowerA-10, upperA+10), ylim=c(0, 2),
     xlab="confidence intervals", ylab="index",
     main = "CI for 90%")


plot(c(lowerB, upperB), c(1,1),
     type="l",
     col="red", lwd=2,
     xlim=c(lowerA-10, upperA+10), ylim=c(0, 2),
     xlab="confidence intervals", ylab="index",
     main = "CI for 95%")


plot(c(lowerC, upperC), c(1,1),
     type="l",
     col="green",lwd=2,
     xlim=c(lowerA-10, upperA+10), ylim=c(0, 2),
     xlab="confidence intervals", ylab="index",
     main = "CI for 99%")
