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


total_ttest = t.test(suspension_df$PSI)
total_ttest


#seperating PSI by lot
lot1 <- suspension_df %>% filter(grepl("Lot1", Manufacturing_Lot))
lot2 <- suspension_df %>% filter(grepl("Lot2", Manufacturing_Lot))
lot3 <- suspension_df %>% filter(grepl("Lot3", Manufacturing_Lot))

lot1_test <- t.test(lot1$PSI)
lot1_test

lot2_test <- t.test(lot2$PSI)
lot2_test

lot3_test <- t.test(lot3$PSI)
lot3_test
