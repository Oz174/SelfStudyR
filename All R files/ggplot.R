library(tidyr)
library(ggplot2)
library(tidyverse)
# Layers of a graph 
## Mandatory 
# 1 - Data
hdi_cpi <- read.csv('3.1 hdi-cpi.csv') %>% as_tibble()
hdi_cpi
#HDI : human development index 
#CPI : corruption perception index 

# 2 - Aesthetics (a-statics) : where we assign our data axis 
# who's on x-axis and who's on y-axis 

#   x-axis   ,   y-axis 
scatter <- ggplot(hdi_cpi , aes(CPI.2015 , HDI.2015))

# 3 - Geometry : where we decide the shape the points to take 
scatter + geom_point() #=> scatter plot 

# ggplot cheat sheet 

##Optional

# 4 - Facets : where we can decide to break up a plot
# into subplots based on discrete variables 

scatter + geom_point() + facet_grid(Region ~.) #new 

# 5 - Statistics : Transformations and summarizations on data
scatter + geom_point(aes(color = Region), size = 3) + facet_grid(Region ~.) + 
  stat_smooth() # new 
# 6 - Coordinates : specify whether to zoom in or out 
scatter + geom_point(aes(color = Region), size = 3) + facet_grid(Region ~.) +
  stat_smooth() + coord_cartesian(xlim = c(0.75,1)) #new 
# 7 - Themes : we removed facets and coordinates axis 
scatter + geom_point(aes(color = Region), size = 3) +
  stat_smooth() + 
  theme_minimal() # new 


# Histograms : for continuous single variable
# Data 
titanic <- read.csv('5.1 titanic.csv') %>% as_tibble()
View(titanic)
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)
str(titanic)
# Aesthetics
hist <- ggplot(data = titanic , aes(x = Age))
# Geometry 
# bin width = steps 
hist + geom_histogram(binwidth = 5 , color = "darkslategray" , fill = "darkslategray4",
                      alpha = 0.5 ) + ggtitle("Age Distribution of the Titanic") +
  labs( y = "Number of Passengers" , x = "Age") + theme_minimal()
# labs for labeling
#alpha : level of transparency , 1 is completely solid and 0 completely see through 


# Exercise 
# data 
emp <- read.csv('6.1 employee-data.csv' , skip = 23) %>% as_tibble()
emp <- subset(emp , salary > 45000)

# aesthetics 
hist <- ggplot(data = emp , aes(x = salary))
# geometry 
hist + geom_histogram(binwidth = 4500 ,color = "darkslategray" , fill = "darkseagreen2",
                      alpha = 0.7 ) + ggtitle("Salary distribution in the employee data") +
  labs(y = "Number of employees in the salary bracket" , x = "Salary") +
  theme_minimal()

# Single Categorical (discrete) Variable
# it is like we dragged a color filter in tableau 
bar <- ggplot(titanic , aes(x = Sex , fill = Survived))
bar + geom_bar() + theme_light() + 
  labs(y = "Passenger Count" , x = "Gender ", title = "Survival Rate by Gender") +
  facet_wrap(~ Pclass) # ~ means filter by 
# the facet wrap filter genders in classes who survived and who didn't 


hist <- ggplot(titanic , aes(x = Age , fill = Survived)) # filter by survived 
hist + geom_histogram(binwidth = 5 , color = "white") + theme_light() +
  labs(y="Passenger Count" , x = "Age" , title = "Ages of People survived") 


# BOX Plots (Whiskers) : 
#Median , Quarterly (1st , 3rd) , and skewness

my.box <- ggplot(titanic , aes(x = Survived , y=Age))
# key note : you can pass aes to any function down the line 
# but if defined at beginning , it will be inherited 
# to avoid this , set inherit.aes = False
my.box + geom_boxplot(outlier.colour = "red" , outlier.shape = 4) + theme_light() +
  labs(title = "Survival Rate on the Titance Based on Age") +
  geom_jitter(width = 0.2 , aes(color = Sex)) + coord_flip()
#=> filter by sex   #=> flip boxes horizontally 
# if the median is at the lower tip of the box , it is right skewed 
# if it's at the upper , it is left skewed (long tail on the left)




# STATSSSSSSSSSSSSS

#Scatter Plot : relationship between two variables 
scatter + geom_point(aes(color = Region) ,shape = 21 , size = 3 ,fill = "white" , stroke = 2) + theme_light() + 
  labs(y="Human Development Index in 2015" , x = "Corruption Perception Index" , title= "Scatter Plot") +
  stat_density2d()
#stat_smooth(se = F)



# EXERCISEEEEEEE (emp is defined up)
library(ggthemes)
library(wesanderson)
emp$gender <- as.factor(emp$gender)
emp$title <- as.factor(emp$title)

my.box <- ggplot(emp , aes(x = title , y = salary))

my.box + geom_boxplot(outlier.colour = "red" , outlier.shape = 3) +
  labs(y="Salaries " , x="Position" , title = "Salary distribution" , subtitle = "based on position and gender") + 
  geom_jitter(width = 0.3 , aes(color= gender)) + 
  theme_economist_white() + 
  theme(legend.position = "right", axis.text.x = element_text(angle = 90, hjust = 1)) +
  coord_flip() # this can be added if the axis.text.x doesn't make sense to you; it's also easier to read




