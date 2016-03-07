setwd("~/Desktop/Coursera/Exploratory Data Analysis")
household_power_consumption <- read.csv("~/Desktop/Coursera/Exploratory Data Analysis/household_power_consumption.txt", header=TRUE, sep=";")
household_power_consumption$NewDate <-as.Date(household_power_consumption$Date, "%d/%m/%Y")
mydata <-subset(household_power_consumption, NewDate =='2007-02-01'| NewDate == '2007-02-02')
x <- paste(mydata$NewDate, mydata$Time)
mydata$Date_time <- strptime(x, "%Y-%m-%d %H:%M:%S")
mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)
with(mydata,plot(Date_time,Sub_metering_1 , xlab="", ylab = "Energy sub metering", ylim = c(0,35), type = "l"))
par(new=T)
with(mydata,plot(Date_time,Sub_metering_2 , xlab="", ylab = "", type = "l", col = "red", ylim = c(0,35), axes=F))
par(new=T)
with(mydata,plot(Date_time,Sub_metering_3 , xlab="", ylab = "", type = "l", col = "blue", ylim = c(0,35), axes=F))