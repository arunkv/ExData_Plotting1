## Copyright 2014 Arun K Viswanathan
## All rights reserved

## Exploratory Data Analysis - Course Project 1
## Plot 3: Plot of energy sub metering
## https://class.coursera.org/exdata-016/human_grading/view/courses/973759/assessments/3/submissions

## Read the power consumption data (assumed to be in "household_power_consumption.txt")
## Just get the subset for 2007-02-01 and 2007-02-02
## Note: uses data.table package

library(data.table)
data <- fread("household_power_consumption.txt")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", c(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3))
data <- transform(data, 
                  Sub_metering_1 = as.numeric(Sub_metering_1), 
                  Sub_metering_2 = as.numeric(Sub_metering_2), 
                  Sub_metering_3 = as.numeric(Sub_metering_3), 
                  DateTime = strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

## Plot the sub metering data into a single chart
png(filename = "plot3.png")
with(data, plot(DateTime, Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type="n"))
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty="solid")
with(data, points(DateTime, Sub_metering_1, type="l", col="black"))
with(data, points(DateTime, Sub_metering_2, type="l", col="red"))
with(data, points(DateTime, Sub_metering_3, type="l", col="blue"))
dev.off()