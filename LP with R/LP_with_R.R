#Linear programming with R 
library(lpSolve)

#Setting the coefficients of decision variables
objective.in=c(25,20)

#Constraint Matrix
const.mat=matrix(c(20,12,5,5),nrow = 2,byrow = T)

#defining constraints
const_time=540  #in minutes
const_res=2000

#RHS for constraints
const.rhs=c(const_res,const_time)

#Direction for constraints
const.dir=c("<=","<=")

#Finding the optimum solution
opt=lp(direction = "max",objective.in,const.mat,const.dir,const.rhs)
summary(opt)


#Objective values of x and y
opt$solution

#Value of objective function at optimal point
opt$objval


# Another problem : Hectars 
objective.in <- c(50,120)

const.matrix <- matrix(c(1,1,100,200,10,30) , byrow = T , nrow = 3)

const.land <- 110 
const.labour <- 1200 
const.budget <- 10000

const.rhs <- c(const.land,const.budget,const.labour)

const.dir <- rep("<=",3)

solver <- lp("max" , objective.in , const.matrix,const.dir,const.rhs)
solver$solution
