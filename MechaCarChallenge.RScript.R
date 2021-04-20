# Loading in package.
library(dplyr)

#Read CSV file
Mechacar_df <- read.csv("MechaCar_mpg.csv")

# looking at dataframe.
head(Mechacar_df)

# Performing linear regression
Mecha_regression <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
                         ground_clearance + AWD, data=Mechacar_df)

## Determining the P-Value
summary(Mecha_regression)

# Creating Visualizations for the Trip Data.

suspension_df <- read.csv("Suspension_Coil.csv")

#Analyzing the df
head(suspension_df)

# Creating a df of summary statistics.
total_summary <- suspension_df %>% summarize(Mean=mean(PSI), Median=median(PSI), 
                                             Variance=var(PSI), SD=sd(PSI))

# Creating a summary by lot
lot_summary <- suspension_df %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=format(round(mean(PSI),2),2), Median=format(round(median(PSI),1),1), 
            Variance=format(round(var(PSI),7),7), SD=format(round(sd(PSI),7),7), 
            .groups = 'keep')

## Performing t-test
t.test(log10(suspension_df$PSI),mu=1500)

### t-test() for lot 1.
t.test(subset(suspension_df, Manufacturing_Lot=='Lot1')$PSI,mu=1500)
### t-test for lot 2
t.test(subset(suspension_df, Manufacturing_Lot=='Lot2')$PSI,mu=1500)
### t-test for lot 3
t.test(subset(suspension_df, Manufacturing_Lot=='Lot3')$PSI,mu=1500)




