library(tidyverse)
star <- starwars
View(star)

filter(star , species == "Droid" , homeworld == "Tatooine")
filter(star , eye_color == "red" | eye_color == "orange" | eye_color == "yellow"
       , species == "Human")


select(star , name , height , gender:species)
# you display by the order given 
select (star , height , name ,  sex , gender)
select(star , ends_with("color"))
select (star , name , vehicles , starships ,everything())
# Adds a new variable and preserves the rest 
star <- mutate(star , bmi = mass/(height/100)^2)
select(star , name:bmi)
# Adds a new variable and drop the rest 
star.trans <- transmute(star , bmi2 = mass/(height/100)^2)
star.trans

arrange(star,mass)
arrange(star,desc(mass))

#Random Samples 
sample_n(star, size = 15)
sample_frac(star , size = 0.8 )


summarise(star ,avg.height = mean(height , na.rm = T))
# Instead of GROUPING , SUMMARIZING AND STORING INTO VARIABLESSSS , THENN FILTERING 
star.species <- group_by(star,species)
summarise(star.species , avg.height = mean(height , na.rm = T))

star.smr <- summarise(star.species , count = n() , avg.mass = mean(mass , na.rm = T ))
filter(star.smr , count > 1 )

# Use the Pipe , where the result of one operation is the input of the other 
# Data %>% Operation A %>% Operation B
star %>%
group_by(species) %>%
summarize(count = n() , avg.mass = mean(mass , na.rm =T)) %>% 
filter(count > 1)


# Exercise Badeen A5ar 
emp <- read.csv('employee_data.csv' , stringsAsFactors = F , skip = 23)
emp<- as_tibble(emp)
emp$title <- factor(emp$title) # we can use as.factor 
emp$gender <- as.factor(emp$gender)
any(is.na(emp))

emp.a <- emp %>%
 select(ends_with("name"), gender , everything()) %>%
  filter(salary > 70000) %>%
  arrange(gender , last_name) 


emp.a <- as.data.frame(emp.a$emp_no)


# options(dplyr.summarise.inform = FALSE)


# Find out how much each position (title) earns on average by gender;
emp %>%
group_by(title , gender) %>% 
  summarize(avg.salary = mean(salary)) %>%
  #create a new variable that represents the average monthly figures
  mutate(avg.month.sal = avg.salary/12) %>%
  #and arrange your result by gender and average monthly salary, from largest to smallest.
  arrange(desc(gender),desc(avg.month.sal))

rm(avg.month.figures)

# Tidying in R , tidyr 
# gather and separate 
library(tidyr)
billboard <- read.csv('8.2 billboard.csv') %>% as_tibble()
View(billboard)
billboard %>% gather(x1st.week:x76th.week , key = "week" , value = "rank" , na.rm = T) %>%
  arrange(artist.inverted)
tb <- read.csv('8.1 tb.csv') %>% as_tibble()
head(tb)
# we find that column names are values that can stand alone , such as gender and age 
tb.gathered <- tb %>% gather(m.014:f.65 , key = "column" , value = "cases" , na.rm = T) %>%
  arrange(country)
tb.gathered
?separate
# regex is used if sep is char , else number is char pos to split at (doesn't remove it)
tb.separated <- tb.gathered %>% separate(column , into = c("sex","age") , sep = "\\.")
tb.separated
tb.separated$age <- str_replace_all(tb.separated$age , "0" ,"0-")
tb.separated$age <- str_replace_all(tb.separated$age , "15" ,"15-")
tb.separated$age <- str_replace_all(tb.separated$age , "25" ,"25-")
tb.separated$age <- str_replace_all(tb.separated$age , "35" ,"35-")
tb.separated$age <- str_replace_all(tb.separated$age , "45" ,"45-")
tb.separated$age <- str_replace_all(tb.separated$age , "55" ,"55-")
tb.separated$age <- str_replace_all(tb.separated$age , "65" ,"65-100")
tb.separate 

#unite opposite of serparate 
tb.separated <- tb.separated %>% separate(age,into = c("low","high") , sep = "-")
tb.separated
tb.united <- tb.separated %>% unite( "age.new ", c("low","high") , sep = "-")
tb.united

#spread : helps us tidy data that has a single obs spanning multiple rows 
weather <- read.csv('9.1 weather.csv')
weather
weather.spread <- spread(weather , key = element , value = value)
weather.spread


# gather : many data spanning columns names can be turned into separate rows 
# spread : many data spanning records (repreated) can be turned into separte columns 

#separate : 3la mostawa el column , across the column , I can separate a column into 2 with labels , split on regex or pos
# unite  : 3la mostawa el columns , I can merge two columns into one again with regex sep 


# Exercise 

# Weather untidy 
weather.untidy <- read.csv('11.3 weather_untidy.csv') %>% as_tibble()
View(weather.untidy)
weather.gathered <- weather.untidy %>% gather(d1:d31,key ="day" , value = "temperature" , na.rm = T) %>% arrange(month,temperature)
weather.gathered
weather.spread <- weather.gathered %>% spread(key = element , value = temperature)
weather.spread

weather.spread$id <- parse_number(weather.spread$id)

tb.untidy <- read.csv('11.2 tb_untidy.csv') %>% as_tibble()
# dropna in pandas , delete all empty cols 
tb.untidy <- tb.untidy[,colSums(is.na(tb.untidy)) < nrow(tb.untidy)]

tb.untidy.gathered <- tb.untidy %>% gather("m04":"fu" , key = "gender.age" , value = "cases" , na.rm = T) %>% arrange(country)
tb.separated <- tb.untidy.gathered %>% separate(gender.age , into = c("sex" , "age") , sep = 1)
tb.separated
View(tb.separated)
