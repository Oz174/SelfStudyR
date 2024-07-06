vec <- 1:3
vic <- 11:13

# Basic Vectors Operations 

# 1 - addition 
vic + vec 

# 2 - subtraction 
vic - vec 

# 3 - multiplication 
vic * vec

# 4  - division 
vec / vic 

# Basic Functions on Vectors 
mean(vec)
sum(vic)
sd(vec)
median(vic)
prod(vic)
min(vec)
max(vic)
# Vectors Recycling : A process where R fills out the smaller vector by 
# repetition in case of mismatch 
nums_one_to_ten <- 1:10
nums_one_to_five <- 1:5
res <- (nums_one_to_five) + (nums_one_to_ten)

# Vectors Attributes 
age <- c(23L,26L,24L,26L)
attributes(age)

# 1 - Names
names(age) <- c("George","John","Paul","Ringo")
#=> can be overwritten or null
#=> names(age) <- NULL to null it 

# 2 - Dimension
a <- seq(10,120 , by=10)
dim(a) <- c(3,4) #=> fills column by column 
a #=> turns into data 
dim(a) <- NULL

# 3 - Classes 
typeof(a) #double before and after using dim()
class(a) # before : numeric , after: matrix numeric 


# Slicing and Indexing 
n.deck <- c(6,7,8,9,10)
deck <- c("Duke","Assassin","Captain","Ambassador","Contessa")
# Indices starts from 1
deck[4] 
n.deck[1]
# Indexing with negative numbers , selects all but the written index
deck[-4]

deck[c(1,3,5)]

names(n.deck) <- deck
names(n.deck) <- NULL
n.deck["Contessa"]
n.deck[c("Captain","Ambassador","Captain")]



# Slicing 
n.deck["Duke":"Captain"] #=> forbidden
n.deck[6:8] #=> returns NA 
n.deck[3:5]

lv <- seq(10,100,by = 10)
# Excluding a certain slice 
lv[-(4:7)]
lv[2:5]
lv[lv > 30 & lv < 90]

class(lv) #=> numeric
typeof(lv) #=> double

class(age) #=> integer
typeof(age) #=> integer

class(deck) #=> char
typeof(deck) #=> char 

# Exercise 
weight <- c(71, 67, 83, 67)
#=> weight will be extended to be 71,67,83,67,71,67,83,
height <- c(1.75, 1.81, 1.78, 1.82, 1.97, 2.12, 2.75)
bmi <- round(weight/(height^2),2)
bmi 

s <- seq(from=2 , to = 30 , by = 2)
attributes(s)
dim(s) <- c(3,5) #=> 2D array , s turns into data (matrix)
dim(s) <- c(1,3,5) #=> 3D array , s turns into values 
dim(s) <- c(1,3,5,1) #=> 4D 
#=> rule for dim , the prod of the dimensions should be equal the size of the array 
dim(s)
s
