# Single population with known mean and varience 
sal <- read.csv('ztest-a.csv')

# H0 : mu0 is equal 113000
# H1 : mu0 is not equal 11300 

# we use two tail 
summary(sal)

z.test <- function(s , mu , p.sd){
  zeta <- (mean(s) - mu) / (p.sd/sqrt(length(s)))
  return(zeta)
}


abs.z.test <- abs(z.test(sal$salary , mu = 113000 , p.sd = 15000))
# alpha = 0.05 
# 1 - alpha/2  = 0.975 , hattl3 1.96 < 4.65 
# reject null 

# at alpha =  0.1 
# 1 - 0.1/2 = 1 - 0.05 = 0.995 
# z-critical  =  -1.645 

# T test 

open.rate <- read.csv('ttest-a.csv')
open.rate

# unknown var , one sided test
# I am trying to know if the competitor rate is higher than me 
# then H1 : mu.open_rate > 0.4 , else H0 : is less or equal 0.4 , one sided test
# in cases we use t-score 

t.test <- function(s , mu){
  t <- (mean(s) - mu) / (sd(s) / sqrt(length(s)))
  return(t)
}


t.test.result <- abs(t.test(open.rate$Open.rate , 0.4))
t.critical= 1.8333 

if(t.critical < t.test.result){
  print("H0 is rejected ")
} else{
  print("There's no enough evidence to reject the null hypothesis")
}

library(psych)
library(pastecs)
describe(open.rate)

weight <- read.csv('weight_data_exercise_kg.csv')
describe(weight)

# H0 : D0 <= 0 
# H1: D0 > 0

dep.t.test <- t.test(weight$before , weight$after , paired = T , alternative = "g")
dep.t.test

scores <- read.csv('independent-samples.csv')

describe(scores)
ind.t.test <- t.test(scores$Engineering , scores$Management , mu = -4)
ind.t.test


