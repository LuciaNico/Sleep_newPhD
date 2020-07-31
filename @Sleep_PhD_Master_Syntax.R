# Syntax to Compute PSIQ #

#Number of participants in data

idlist <- unique (data$record_id)
length (idlist)

# List of Packages

library (ggplot2)
library (dplyr)
library (mosaic)
library (psych)
library (Hmisc)
library (mice)
library (tidyverse)
library (stringr)
library (plyr)
library (mice)
library (car)
library (broom)
library (forcats)
library (patchwork)
library (lubridate)
library (reshape2)
library (viridis)
library (RColorBrewer)
library (ggsci)
library (wesanderson)
library (data.table)
library (entropy)
library (moments)
library (lavaan)
library (countrycode)
library (rworldmap)
library (xtable)
library (effects)
library (corrr)
library (MASS)
library (sandwich)

# Variable names

str (data)
colnames(data)

############################################################

## Syntax for Pittsburgh Sleep Quality Inventory (PSQI) Scale # Use function as a template

  ###Component 1###
  data$Comp1 <- data$psqi_6 

data$Comp1
  
  ###Component 2###
  Score2 <- rep(NA,nrow(data))
  Score2[data$psqi_2<=15] <- 0
  Score2[data$psqi_2>15 & data$psqi_2<=30] <- 1
  Score2[data$psqi_2>30 & data$psqi_2<=60] <- 2
  Score2[data$psqi_2>60] <- 3
  
  Score_Comp2 <- Score2 + data$psqi_5a
  
  data$Comp2[Score_Comp2==0] <- 0
  data$Comp2[Score_Comp2==1 | Score_Comp2==2] <- 1
  data$Comp2[Score_Comp2==3 | Score_Comp2==4] <- 2
  data$Comp2[Score_Comp2==5 | Score_Comp2==6] <- 3
  
  ###Component 3###
  data$Comp3[data$psqi_4>=7] <- 0
  data$Comp3[data$psqi_4>=6 & data$psqi_4<7] <- 1
  data$Comp3[data$psqi_4>=5 & data$psqi_4<6] <- 2
  data$Comp3[data$psqi_4<5] <- 3
  
  ###Component 4###
  
  class(data$psqi_3)
  class(data$psqi_1)
  
  data <- data %>% 
    mutate (psqi_1b = hm(psqi_1),
            psqi_3b = hm(psqi_3))
  
  class(data$psqi_3b)
  class(data$psqi_1b)
  
  data$Hours_in_Bed <- as.double(data$psqi_3b,data$psqi_1b, units="hours")
  data$Hours_in_Bed
  
  Score_Comp4 <- rep(NA,nrow(data))
  Score_Comp4 <- data$psqi_4/Hours_in_Bed*100
  data$Comp4[Score_Comp4 >= 85] <- 0
  data$Comp4[Score_Comp4 >= 75 & Score_Comp4 < 85] <- 1
  data$Comp4[Score_Comp4 >= 65 & Score_Comp4 < 75] <- 2
  data$Comp4[Score_Comp4 < 65] <- 3
  
  ###Component 5### (need to check this one -- i think is because they are factors at the moment)
  
  
  data <- data %>% 
    mutate (Score_Comp5 = psqi_5b + psqi_5c + psqi_5d + psqi_5e + psqi_5f + psqi_5g + psqi_5h + psqi_5i + psqi_5othera)
  
  data$Score_Comp5
  
  data$Comp5[data$Score_Comp5 == 0] <- 0
  data$Comp5[data$Score_Comp5 >= 1 & data$Score_Comp5 <= 9] <- 1
  data$Comp5[data$Score_Comp5 >= 10 & data$Score_Comp5 <= 18] <- 2
  data$Comp5[data$Score_Comp5 >= 19 & data$Score_Comp5 <= 27] <- 3
  
  ###Component 6###
  data$Comp6 <- data$psqi_7 
  
  ###Component 7###
  Score_Comp7 <- data$psqi_8  + data$psqi_9
  data$Comp7[Score_Comp7==0] <- 0
  data$Comp7[Score_Comp7==1 | Score_Comp7==2] <- 1
  data$Comp7[Score_Comp7==3 | Score_Comp7==4] <- 2
  data$Comp7[Score_Comp7==5 | Score_Comp7==6] <- 3
  
  data <- data %>% 
    mutate (psqi = data$Comp1 + data$Comp2 + data$Comp3 + data$Comp4 + data$Comp5 + data$Comp6 + data$Comp7)
  

  describe (data$psqi)

  data$Comp7

  