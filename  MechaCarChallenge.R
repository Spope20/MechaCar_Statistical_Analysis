# loading required packages
library(dplyr)

#loading csv file
path <- "MechaCar_mpg.csv"

mechacar_df <- read.csv(path, check.names=F,stringsAsFactors = F)

#Performing linear regression on dataframe
mechacar_reg <- lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechacar_df)

# summarizing linear regresion
summary(mechacar_reg)
