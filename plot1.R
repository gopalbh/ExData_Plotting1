setwd("~/Desktop/Coursera/Exploratory Data Analysis")
household_power_consumption <- read.csv("~/Desktop/Coursera/Exploratory Data Analysis/household_power_consumption.txt", header=TRUE, sep=";")
household_power_consumption$NewDate <-as.Date(household_power_consumption$Date, "%d/%m/%Y")
mydata <-subset(household_power_consumption, NewDate =='2007-02-01'| NewDate == '2007-02-02')
mydata$Global_active_power <- as.numeric(levels(mydata$Global_active_power))[mydata$Global_active_power]
hist(mydata$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)",main = "Global Active Power")