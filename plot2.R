## Copyright 2014 Arun K Viswanathan
## All rights reserved

## Exploratory Data Analysis - Course Project 1
## Plot 2: Plot of global active power over time
## https://class.coursera.org/exdata-016/human_grading/view/courses/973759/assessments/3/submissions

## Read the power consumption data (assumed to be in "household_power_consumption.txt")
## Just get the subset for 2007-02-01 and 2007-02-02
## Note: uses data.table package

library(data.table)
data <- fread("household_power_consumption.txt")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", c(Date, Time, Global_active_power))
data <- transform(data, 
                  Global_active_power = as.numeric(Global_active_power), 
                  DateTime = strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

## Plot the Global_active_power data over time into a PNG file
png(filename = "plot2.png")
with(data, plot(DateTime, Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()