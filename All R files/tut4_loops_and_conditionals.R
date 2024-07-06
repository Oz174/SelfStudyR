# exercise 


# 2. Write a statement that prints "Rotten!" if the input is equal to or larger than 1 and less than 60, "Fresh" if the input is equal to or larger than 60 and less than 75, and "Certified Fresh!" if the input is equal to or larger than 75. For any other value, the statement should print "Please input a number between 1 and 100".
x <- 21
x <- 64 
x <- 90
x <- 1001


if(x>=1 && x < 60){
  print("Rotten !");
} else if(x>=60 && x < 75){
  print("Fresh ! ")
} else if(x>= 75 && x <= 100){
  print("Certified Fresh")  
} else{
  print("Please Enter a valid value")
}
# Imagine the following: Your mother announced yesterday that she's going to win the lottery.
# She did it with the casual nonchalance of a person who's going to the shop to pick up some pasta. 
#Today is the number draw.  
#If she gets 6 numbers correct, she wins the lottery.
#If she doesn't get 6 numbers correct, she will sit staring at the screen wondering 
#how on earth she did not manage to achieve this very simple task.

#Write a statement that will print "Mom wins the lottery!" if the six numbers she guessed matched the lottery numbers, and "Mom did not win the lottery." if the numbers do not match.

# Hint: it will be best if you create one object with randomly generated numbers, and another object which you populate manually (as if you're playing the lottery), and compare the two.

# Hint: look into the length() and setdiff() functions

win.flag <- F
trial.num <- 1
while(!win.flag){
x <- sample(1:10 , size=6 , replace = F)
lottery <- sample(1:10 , size = 6 , replace = F)
win.flag <- length(setdiff(x,lottery)) == 0
if (win.flag) {
  print(paste("Mom wins the lottery on trial number :" , trial.num))
  print(lottery)
} else{ 
  trial.num <- trial.num + 1 
  print("Mom did not win the lottery ! ")  
}
}

# sample generates whole numbers randomly between two values 
# rnorm generates values with mean 0 and stdev 1 
# runif generates values with values between 0 and 1 with mean = 0.5 


n <- 100
sum <- 0 
for (i in 1:n){
sum <- sum + i   
}
print(sum)
# OR
i <- 1 
sum <- 0 
while (i <= n){
  sum <- sum + i 
  i <- i+1
}
# do while (execute at least once )
n <- -1 
repeat{
sum <- sum + n 
n <- n - 1 
if(n < 0 ){
  break
}
}


# Functions 2.0 
coup = matrix(rep(c("Captain","Assassin","Ambassador","Contessa","Duke"),3) ,
              ncol = 1)


shuffle <- function(deck){
random <- sample(1:15 , size =15)
s.deck <- deck[random, ,drop=F]
return(s.deck)
}

shuffle(coup)

deal <- function(deck = matrix(1:15 , nrow = 15)){
  shuffled <- shuffle(deck)
  cards <- shuffled[1:3, ]
  return(cards)
}

deal(coup)

# Answer:
# If a function is defined inside another function, R looks inside the current function for a value, 
# then where that function was defined, and so on, all the way up to the global environment. 

f <- function(x) {
  f <- function(x) {
    f <- function(x) {
      x ^ 2
    }
    f(x) + 1
  }
  f(x) * 2
}

f(10)

# What are the principles that determine how R looks up values?

# Answer: 
# If a name isn't defined in the function environment, R will look one level up. 
# If it is, even if there is an element with this name outside of the function, R will not use its value.
