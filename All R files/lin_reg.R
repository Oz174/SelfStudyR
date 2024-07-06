# Difference between Regression and Correlation 


# Correlation : Relationship between two variables and their directions (always move together) , two way relation ship (you can know what happened to a1 from a2)
# Regression : Cause and Effect relation ship between predictors and predictions where x affects y , one way relationship (you can't predict x from knowing y )



df <- read.csv('4.1 regression_example.csv')
library(tidyverse)
library(psych)

summary(df)
describe(df)


# left skewed , negative skew 
ggplot(df,aes(x=GPA)) + geom_histogram(binwidth = 0.1) + theme_light() +
  labs(title="Distribution of GPA") 


# Without yet using the regression model 
ggplot(df,aes(x=SAT , y=GPA)) + geom_point() + theme_light() +
  labs(title="Regression Analysis of GPA and SAT") + 
  stat_smooth(method="lm" , se = F)

# Regression 
lin.reg <- lm(GPA~SAT , data = df)
summary(lin.reg)
library(scales)
housing.data <- read.csv('6.1 real_estate_price_size_year_view.csv') %>% as_tibble()
point <- format_format(big.mark = " " , decimal.mark =" " , scientific = F)


lin.reg = lm(price~size , data = housing.data)

ggplot(housing.data,aes(x=size , y=price)) + geom_point() + theme_light() +
  labs(x = " Size in (ft)" , y= " Price in USD" , title="Regression Analysis of Price and Size") +
  scale_x_continuous(labels = point) + scale_y_continuous(labels = point)

summary(lin.reg)

ggplot(housing.data,aes(x=size , y=price)) + geom_point() + theme_light() +
  labs(x = " Size in (ft)" , y= " Price in USD" , title="Regression Analysis of Price and Size") +
  scale_x_continuous(labels = point) + scale_y_continuous(labels = point) + 
  stat_smooth(method = "lm" , se = F)

