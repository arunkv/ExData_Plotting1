## Copyright 2014 Arun K Viswanathan
## All rights reserved

## Exploratory Data Analysis - Course Project 1
## Plot1: Plot of global active power
## https://class.coursera.org/exdata-016/human_grading/view/courses/973759/assessments/3/submissions

## Read the power consumption data (assumed to be in "household_power_consumption.txt")
## Just get the subset for 2007-02-01 and 2007-02-02
## Note: uses data.table package

library(data.table)
data <- fread("household_power_consumption.txt")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", Global_active_power)
data <- transform(data, Global_active_power = as.numeric(Global_active_power))

## Plot a histogram of the Global_active_power data into a PNG file
png(filename = "plot1.png")
hist(data$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red")
dev.off()