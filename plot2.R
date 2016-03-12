## Set the working directory ##
setwd("~/Desktop/Coursera/ExploratoryDataAnalysis")

## Import the csv file and create a Date column in date format ##
household_power_consumption <- read.csv("~/Desktop/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", header=TRUE, sep=";")
household_power_consumption$NewDate <-as.Date(household_power_consumption$Date, "%d/%m/%Y")

## Create the working data set for the two dates Feb 1st and 2nd of 2007 ##
mydata <-subset(household_power_consumption, NewDate =='2007-02-01'| NewDate == '2007-02-02')

## Create a DateTime column ##
x <- paste(mydata$NewDate, mydata$Time)
mydata$Date_time <- strptime(x, "%Y-%m-%d %H:%M:%S")

## Create the required chart ##
with(mydata,plot(Date_time, Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type = "l"))

## Create a PNG file of the chart ##
dev.copy(png, file = "plot2.png")
dev.off()