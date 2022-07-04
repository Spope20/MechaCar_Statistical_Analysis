# loading required packages
library(dplyr)

#loading csv file
path <- "MechaCar_mpg.csv"

mechacar_df <- read.csv(path, check.names=F,stringsAsFactors = F)

#Performing linear regression on dataframe
mechacar_reg <- lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechacar_df)
mechacar_reg

# summarizing linear regresion
summary(mechacar_reg)


#loading csv file
path <- "Suspension_Coil.csv"

suspension_df <- read.csv(path, check.names=F,stringsAsFactors = F)

#getting a summary of PSI overall and by lot
total_summary <- suspension_df %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
total_summary

lot_summary <- suspension_df %>% group_by(Manufacturing_Lot) %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
lot_summary
