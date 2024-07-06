library(tidyverse)

ny <- c(1,2,3,3,5,6,7,8,9,11)
la <- c(1,2,3,4,5,6,7,8,9,10)
pizza <- data.frame(ny,la)

pizza$ny.mxn <- ny * 18.81
pizza %>% as_tibble()

#returns tibble 
means <- sapply(pizza,mean)
# returns dataframe 
means <- lapply(pizza,mean)

sds <- sapply(pizza,sd)
vars <- sapply(pizza,var)

rel_sd <- sds/means

rel_sd
# SAPPLY saves the effort of writing these 

#sd(pizza$la)
#sd(pizza$ny.mxn)

#var(pizza$ny)
#var(pizza$la)
#var(pizza$ny.mxn)

#rel.sd.ny = sd(pizza$ny) / mean(pizza$ny)
#rel.sd.ny
#rel.sd.la = sd(pizza$la) / mean(pizza$la)
#rel.sd.la
#rel.sd.nymxn = sd(pizza$ny.mxn) / mean(pizza$ny.mxn)
#rel.sd.nymxn # lazem ytl3 ad el sd bta3 ny 


homes <- read.csv('6.1 landdata-states.csv')
View(homes)

homes %>% subset(Date == 2010.00) %>% 
  ggplot(aes(y= Structure.Cost , x = Land.Value)) + geom_point() + 
  labs(y="Cost" , x="Land Size" , title = "Relationship between cost and land") +
  theme_light()

homes %>% subset(Date == 2010.00) %>% 
  ggplot(aes(y= Structure.Cost , x = log(Land.Value))) + geom_point() + 
  labs(y="Cost" , x="Land Size" , title = "Relationship between cost and land") +
  theme_light()

# correlation coefficient increase with the log of the land values 
cor(x = log(homes$Land.Value) , y = homes$Structure.Cost)
# -1 <= cor <= 1 
