## Copyright 2014 Arun K Viswanathan
## All rights reserved

## Exploratory Data Analysis - Course Project 1
## Plot 4: Plot of global active power, voltage, energy sub metering and global reactive power
## https://class.coursera.org/exdata-016/human_grading/view/courses/973759/assessments/3/submissions

## Read the power consumption data (assumed to be in "household_power_consumption.txt")
## Just get the subset for 2007-02-01 and 2007-02-02
## Note: uses data.table package

library(data.table)
data <- fread("household_power_consumption.txt")
data <- subset(data, 
               Date == "1/2/2007" | Date == "2/2/2007", 
               c(Date, Time, Global_active_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3, Global_reactive_power))
data <- transform(data, 
                  Global_active_power = as.numeric(Global_active_power),
                  Voltage = as.numeric(Voltage),
                  Sub_metering_1 = as.numeric(Sub_metering_1), 
                  Sub_metering_2 = as.numeric(Sub_metering_2), 
                  Sub_metering_3 = as.numeric(Sub_metering_3), 
                  Global_reactive_power = as.numeric(Global_reactive_power),
                  DateTime = strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

## Plot four graphs into one file
png(filename = "plot4.png")
par(mfrow=c(2,2))

## Plot the global active power
with(data, plot(DateTime, Global_active_power, type="l", main="", xlab="", ylab="Global Active Power"))

## Plot the voltage
with(data, plot(DateTime, Voltage, type="l", main="", xlab="datetime", ylab="Voltage"))

## Plot the sub metering
with(data, plot(DateTime, Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type="n"))
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n",
       col=c("black", "red", "blue"),
       lty="solid")
with(data, points(DateTime, Sub_metering_1, type="l", col="black"))
with(data, points(DateTime, Sub_metering_2, type="l", col="red"))
with(data, points(DateTime, Sub_metering_3, type="l", col="blue"))

## Plot the global reactive power
with(data, plot(DateTime, Global_reactive_power, type="l", main="", xlab="datetime", ylab="Global_reactive_power"))

dev.off()