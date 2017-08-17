#Nichollette Acosta
#BINF 3121 
#Questions 7 and 8 from Assignment 4

#Write R code to generate the chi-squared distribution with a given degree of
#freedom based on this definition. Compare the PDF of your distribution with
#the theoretical chi-squared distribution. You can use the following procedure:

c_chisq <- function(k){
  x <- rnorm(k) #random seq of normally distributed numbers
  df <- k-1
  sum = 0 

  for(i in 1:df){
    sum = sum + i**2
  }
  par(mfrow=c(2,1))
  hist(x, col="plum", main="Histogram of Custom Chi Square")
  

  
  curve(dchisq(x, df), col ="plum2",lwd=2, main="PDF of Chi Square Curve")


}

c_chisq(50)

#Write R code to generate a student's t distribution based on this definition
#and compare the PDF of your distribution with the theoretical student's t distribution.

c_tsq <- function(k){
  t_ratios = numeric()
  a <- seq(-4, 4, length=100)
  o = 0
  x <- rnorm(k)
  y <- rchisq(k, k-1)
  
  for(z in x){
      
    for(i in y){
          t = z/(sqrt(i/k))
          t_ratios[o] <- c(t)
          o = o +1 
    
  }
  
  }
  par(mfrow=c(2,1))
  z <- dt(x, k-1)
  hist(t_ratios, col="violetred1", border="violetred", main="Custom T Distribution",xlab="ratios")
  plot(z,  type="l", col="violetred2",lwd=2, main="PDF of T Distribution")
  
}

c_tsq(10)