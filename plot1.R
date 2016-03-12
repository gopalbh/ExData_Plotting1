## Set the working directory ##
setwd("~/Desktop/Coursera/ExploratoryDataAnalysis")

## Import the csv file and create a Date column in date format ##
household_power_consumption <- read.csv("~/Desktop/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", header=TRUE, sep=";")
household_power_consumption$NewDate <-as.Date(household_power_consumption$Date, "%d/%m/%Y")

## Create the working data set for the two dates Feb 1st and 2nd of 2007 ##
mydata <-subset(household_power_consumption, NewDate =='2007-02-01'| NewDate == '2007-02-02')

## Convert the Global active power column to numeric ##
mydata$Global_active_power <- as.numeric(levels(mydata$Global_active_power))[mydata$Global_active_power]

## Create the required chart ##
hist(mydata$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)",main = "Global Active Power")

## Create a PNG file of the chart ##
dev.copy(png, file = "plot1.png")
dev.off()