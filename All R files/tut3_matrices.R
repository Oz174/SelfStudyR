# Here are three ways for creating a matrix
  # 1 - By Using Matrix 
a <- matrix(1:15 , nrow = 3, byrow = T)
a
a <- matrix(1:15 , ncol = 5 , byrow = T) #=> by-row is False by default
a
a <- matrix(1:15 , nrow=3 , ncol=5)
a
  # 2 - By Using cbind and rbind 
usa <- c(1.3,1.4,1.2,1.5,1.6)
de <- c(0.2,0.4,0.7,0.8,0.8)
ngo <- cbind(usa,de) #in c_bind , the col names are the names of the variables joined
rownames(ngo) <- c("2013","2014","2015","2016","2017")
ngo <- t(ngo) #=> transpose 
ind <- c(2 , 2.2 , 2.3 , 2.4 , 2.6)
ngo <- rbind(ngo,ind)

  # 3 - by Using dim , we assume you always want to fill by column 
b <- 1:12
dim(b) <- c(3,4) # r,c 
b

  # 4- Creating Matrix by One Line of Code 
gdp <- matrix(c(47.9,41.2,41.9,54.6,56.2,57.5,1.6,1.6,1.7),
              nrow = 3 , byrow = T ,
              dimnames = list(c("de","usa","ind"),
                              c("2014","2015","2016")))
gdp

# Exercise 1 : Create the Matrix in 3 ways 
# Using the dim function 
Player <- c(rep("dark",5) , rep("light",5))
Piece <- c("king","queen","pawn","pawn","knight","bishop","king","rook","pawn","pawn")
chess <- c(Player,Piece)
dim(chess) <- c(10,2)
colnames(chess) <- c("Player","Piece")
# Using rhe matrix function 
chess = matrix(c(Player,Piece), nrow = 10 , dimnames = list(NULL,c("Player","Piece")))
# Cbind 
chess <- cbind("Player" = Player, "Piece" = Piece)
chess


# Recycling in matrices 
recycle = matrix(1:10 , nrow = 4 , ncol = 4 , byrow=T)
recycle 

# Indexing 
chess[,2] #=> second column as a vector 
chess[1,] #=> first row as a vector
chess[1,2] #=> single value at chess[1][2]

# Slicing A Matrix 
chess [c(1,3,8) , 1] #select [1,1] , [3,1] , [8,1]  (returns a vector)
chess [c(1,3,9) , ] #select rows 1 , 3 and 9 (returns a matrix)

ngo["de","2016"]
ngo[,"2016"]
gdp["de",]


# Arithmetic Operations on Matrices 
b.office <- c(171.5,292,281.6,460.6,139.3,286)
matrix.mat <- matrix(b.office , nrow = 3 , byrow = T
                  , dimnames = list(c("The Matrix" , "Reloaded" , "Revolution") 
                                       , c("US","WorldWide")))
matrix.scaled <- matrix.mat / 1000
matrix.margin <- matrix.mat - 121 
matrix.margin

budget <- matrix(c(63,150,150) , nrow = 3 , ncol = 2 )
budget
# will result in an error if the matrix size was not initialized correctly 
matrix.margin <- matrix.mat - budget 
matrix.margin <- matrix.mat - c(63,150,150)
matrix.margin # see , it recycled 

# Inner and Outer Multiplication 
v <- matrix(1:6 , nrow = 3 , ncol = 2)
v

# Inner (element wise)
gross <- matrix.mat * v 
gross 
# Matrix Multiplication (According to Linear Algebra where nxk kxm = nxm)
gross_out <- matrix.mat %*% t(v) 
gross_out


# Colsums and Colmeans
total <- colSums(matrix.mat)
## rowSums(matrix.mat)
average <- colMeans(matrix.mat)
## rowMeans(matrix.mat)

matrix.mat <- rbind(matrix.mat,total,average)
matrix.mat


# Exercise 12 
t.chess <- t(chess)
turn <- c(3,5,2,2,7,4,6,5,2,1) 
t.chess <- rbind(t.chess , "Turn" = turn)
t.chess <- t(t.chess)
t.chess[6,2]
t.chess[,c(1,2)] #or 1:2 or -3 or c("Player","Piece")
t.chess[1:5,]
t.chess[,2, drop = F] # what does drop do (affects display)
t.chess[,-2] #everything but the pieces
t.chess[2,c(1,3)]
t.chess[7,3] <- 3 


# Exercise 13 
?runif

u <- runif(12)
matrix.rand <- matrix(u,nrow = 3 , ncol = 4 
                      , byrow = T , 
                      dimnames = list(
                        c("x","y","z"),
                        c("uno","dos","tres","cuatro")
                      ))
matrix.scaled <- matrix.rand * 10 
matrix.2x4 <- matrix.rand[1:2,]

matrix.scaled - matrix.2x4 #error
matrix.3x3 <- matrix.rand[,1:3]
matrix.3x3

matrix.scaled - matrix.3x3 #error 

vector_uno <- matrix.scaled[,"uno"]
vector_uno #=> will work the sub if drop = T 

matrix.scaled - vector_uno

?rnorm
matrix.rand2 <- rnorm(12)
matrix.rand2 <- matrix(matrix.rand2, ncol = 4 , nrow= 3 , byrow = T)
mult <- matrix.rand2 * matrix.rand
mult

inner_mult <- matrix.rand2 %*% t(matrix.rand)
inner_mult

#Exercise 14 
my.matrix1 <- matrix(rnorm(25), nrow = 5 , ncol = 5 , 
                    byrow = T)
my.matrix2 <- matrix(runif(25), nrow = 5 , ncol = 5 , 
                     byrow = T)
my.matrix1 <- cbind(my.matrix1 , "rowAvg" = rowMeans(my.matrix1) , "rowSum" = rowSums(my.matrix1))
my.matrix1 <- rbind(my.matrix1 , "colAvg" = colMeans(my.matrix1) , "colSum" = colSums(my.matrix1))
my.matrix2 <- cbind(my.matrix2 , "rowAvg" = rowMeans(my.matrix2) , "rowSum" = rowSums(my.matrix2))
my.matrix2 <- rbind(my.matrix2 , "colAvg" = colMeans(my.matrix2) , "colSum" = colSums(my.matrix2))
my.matrix1
my.matrix2
min(my.matrix1[1:5,1:5])
min(my.matrix2[1:5,1:5])
max(my.matrix1[1:5,1:5])
max(my.matrix2[1:5,1:5])


min(my.matrix1[1:5,3])
min(my.matrix2[1:5,3])
max(my.matrix1[1:5,3])
max(my.matrix2[1:5,3])

mean(my.matrix1[1:5,1:5])
sd(my.matrix1[1:5,1:5])

mean(my.matrix2[1:5,1:5])
sd(my.matrix2[1:5,1:5])

compare_means_and_sds <- function(){
  my.matrix1 <- matrix(rnorm(25), nrow = 5 , ncol = 5 , 
                       byrow = T)
  my.matrix2 <- matrix(runif(25), nrow = 5 , ncol = 5 , 
                       byrow = T)
  print("The Mean and Std_dev for Matrix 1 : ")
  print(mean(my.matrix1[1:5,1:5]))
  print(sd(my.matrix1[1:5,1:5]))
  print("The Mean and Std_dev for Matrix 2 : ")
  print(mean(my.matrix2[1:5,1:5]))
  print(sd(my.matrix2[1:5,1:5]))
}

# Factors and Categorical data 
martial.status = c("Single","Married","Married","Widowed","Single",
                   "Divorced","Widowed","Single","Divorced")
martial.status #=> display the insides 
str(martial.status)  # describes the insides and then write them (the data type)
# str displays what you will find in the env window 

f <- factor(martial.status)
f #=> displays the content of f and the levels 
str(f) #=> without specifying the order , R orders alphabetically 

# specifying the levels in the factor func at firsts ensures your order to take 
# place , other than that , it is useless 
# ordered is by default false , it allows you to order the levels as specified in levels 
# when printing you will see the < sign 
new_f <- factor(martial.status , levels = c("Single","Married","Divorced","Widowed") , ordered = F)
str(new_f) #=> you will find that single has taken place 1 after it was 3 
new_f
levels(new_f) = c("s","m","d","w") #=> this line if came alone without putting levels in factor 
# it will rename divorced as s , and married as m , and single as d 

new_f <- factor(martial.status)
str(new_f) #=> you will find that single has taken place 1 after it was 3 
new_f
levels(new_f) = c("s","m","d","w") #=> this line if came alone without putting levels in factor 
# it will rename divorced as s , and married as m , and single as d 


new_f <- factor(martial.status , 
                levels = c("Single","Married","Divorced","Widowed") ,
                labels = c("Sin","Mar","Div","Wid"))
new_f
str(new_f) #=> levels adjust the integer order , and labels specify category name


# Lists in R 
# lists can contain any data type without coercion , can contain lists inside
my.book <- list(Name = "1984", Author = "George Orwell" , Sold.at = 1949 ,
                Contents = list(partOne = c(1:8), partTwo = c(1:10), partThree = c(1:9)
                             ,Appendix = "NewSpeak"))
# PRINTING 
# [[i]] => which element in the list is being printed
# [i] => which element in the sublist is being printed

# let's see how str will react
str(my.book)

# let's give names 
# names can be given directly while creating the list or ... 
new.book <- list("1984", "George Orwell" , 1949 ,
                list(c(1:8), c(1:10), c(1:9)
                                 ,"NewSpeak"))
names(new.book) <- c("Name","Author","Published","Content")
str(new.book)
new.book
# Indexing 
my.book[[2]]
my.book[[4]] # item 
my.book[1:2]
my.book[4] #list 
class(my.book[[4]][2]) #list 
class(my.book[[4]][[2]]) #integer 


# Exercise 14 

factor.pieces <- factor(Piece , levels = c("king", "queen", "rook", "bishop", "knight", "pawn")
                              , labels = c("King","Queen","Rook","Bishop","Knight","Pawn"))
factor.pieces
str(factor.pieces)
levels(factor.pieces) <- c("K","Q","R","B","KT","P")
factor.pieces

ordered.pieces <- factor(factor.pieces, levels = c("K","Q","R","B","KT","P") , labels = c("King","Queen","Rook","Bishop","Knight","Pawn") , ordered = T)
ordered.pieces

# Exercise 15 
my.list <- list(seq(from = 1 , to = 11 , by = 2) , list("Happy Birthday","Archery"))
my.list
# Extract the numbers as a vector 
my.list[[1]]
# Extract Happy Birthday as a vector 
my.list[[2]][[1]]
# Extract the second item of the second list as a list.
my.list[[2]][2]
# Extract the second list as a list 
my.list[[2]]
#  Extract the numbers item as a list.
my.list[1]
# Add 2 to each element in the numbers item.
my.list[[1]] <- my.list[[1]] + 2
# Name the items in the list as "Numbers" and "Phrases"
names(my.list) <- c("Numbers","Phrases")
str(my.list)
# Using $ sign 
my.list$Numbers #eqv : my.list[[1]]
my.list$Phrases
# Use $ to add 2 again 
my.list$Numbers <- my.list$Numbers + 2
my.list$Numbers
# Add a new item called "Brands" to the list. It should contain the brands  :
# Kellogs, Nike, iPhone. Use either brackets or the dollar sign to do that.
my.list$Brands <- c("Kellogs","Nike","Iphone")
str(my.list)
# Remove the iphone from brands 
my.list$Brands <- my.list[[3]][-3]
# Remove the Brands item 
my.list[[3]] <- NULL
my.list$Brands <- NULL

