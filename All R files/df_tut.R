# How to make your own DF 
title <- c("Star Wars","The Empire Strikes Back" , "Return of the Jedi"
           , "The Phantom Menace" , "Attack of the Clones", "Revenge of the Sith"
           , "The Force Awakens")
year <- c(1977,1980,1983,1990,2002,2005,2015)
length.min <- c(121,124,133,133,142,140,135)
box.office.mil <- c(787,534,572,1027,657,849,2859)

my.df <- data.frame(title,year,length.min,box.office.mil)
my.df

# We can rename columns by two ways 
names(my.df) <- c("Movie Name" , "Publish Year" , "Duration" , "Income")
my.df

# Or 
# in the new version of R 4.0.0 , stringsasFactors has been set as False
my.df <- data.frame(Title = title , Year = year , Duration = length.min
                    , Gross = box.office.mil )
my.df
#str for structure 
str(my.df)

# Exercise 
pets.names <- c("Flipper","Bromley","Nox","Orion","Dagger","Zizi","Carrie")
ages.months <- c(53,19,34,41,84,140,109)
sizes <- c("medium","small","medium","large","small" , "extra small" ,"large")
weight <- c(21, 8, 4, 6, 7, 2, 36)
breed <- c("dog","dog","cat","cat","dog","cat","dog")

pets.df <- data.frame("Months Old" = ages.months , "Size" = sizes , 
                      "Weight" = weight ,"Breed" = breed
                      , row.names = pets.names , 
                      stringsAsFactors = T)
pets.df
# there are some cases where you like to turn off the rownames and times 
# when you might leave it , it depends on eyeballing the csv 
write.csv(pets.df , "pets.csv", row.names = T)
# TidyVerse
my.pok <- read.csv('pokRdex_comma.csv', stringsAsFactors = F)
my.pok


# Exercise 
employees <- read.csv('employee_data.csv',stringsAsFactors = F , skip = 23 , nrows = 200)
names(employees) <- c("Employee number", "First name", "Last name", "Birth date", "Gender", 
                      "Job title", "Salary", "From date", "To date")
employees
write.csv(employees , "employees_exercise.csv" ,row.names = F)


nrow(my.pok)
ncol(my.pok)
str(my.pok)
colnames(my.pok) #=> for slicing 
summary(my.pok) #=> describe() in pandas 

library(tidyverse)
starwars
my.wars <- data.frame(starwars)
my.wars <- my.wars[,-(11:13)]
head(my.wars)
my.wars[3,"homeworld"]


eg.na <- c(NA , 1:10)
mean(eg.na) #NA
mean(eg.na , na.rm = T)

is.na(my.wars)
any(is.na(my.wars))

is.na(starwars[,"name"])
any(is.na(my.wars[,"name"]))
any(is.na(my.wars[,c("name","homeworld")]))

# fill with unknowns
is.na(my.wars$gender)
my.wars$gender
my.wars$gender[is.na(my.wars$gender)] <- "UnKnown" 
?subset
subset(my.wars , sex == "male" )
is.na(my.wars$height)
my.wars$height[is.na(my.wars$height)] <- median(my.wars$height , na.rm = T)

#Extending DF 
mark <- rnorm(7)
carrie <- rnorm(7)

# Adding Columns is the most common and easier case 
my.df$MarkScreenTime <- mark 
my.df$CarrierScreenTime <- carrie

my.df

my.df$MarkScreenTime <- NULL 
my.df$CarrierScreenTime <- NULL

my.df <- cbind(my.df , MarkScreenTime = mark , CarrierScreenTime = carrie)
my.df

my.df[["MarkScreenTime"]] <- mark
my.df[["CarrierScreenTime"]] <- carrie
my.df 

# Now , adding a whole tuple by rbind and by creating a df from 
record <- data.frame(title = "Rogue One" , year = 2016 , length.min = 124 , box.office.mil = 231)
my.df <- rbind(my.df , record)
my.df

# Exercise 
pets.df$Vaccinated = c("Yes","Yes","No","Yes","No")
pets.df
milo <- data.frame(Months.Old = 67 , Size = "small" , Weight = 7 , Breed = "dog" , Vaccinated = "Yes")

rownames(milo) = "Milo"
pets.df <- rbind(pets.df , milo)
#Delete by row index 
pets.df <- pets.df[-9,]
pets.df
# Delete by RowName
pets.df <- pets.df[!(row.names(pets.df) %in% c("Flipper","Milo")),]
# all records except Milo 
pets.df[!(row.names(pets.df) %in% c("Milo")),]
# Delete by Condition 
pets.df <- subset(pets.df,Weight < 20 )
pets.df

#converts to df 
is.data.frame(pets.df)

str(pets.df)
