## Set the working directory ##
setwd("~/Desktop/Coursera/ExploratoryDataAnalysis")

## Import the csv file and create a Date column in date format ##
household_power_consumption <- read.csv("~/Desktop/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", header=TRUE, sep=";")
household_power_consumption$NewDate <-as.Date(household_power_consumption$Date, "%d/%m/%Y")

## Create the working data set for the two dates Feb 1st and 2nd of 2007 ##
mydata <-subset(household_power_consumption, NewDate =='2007-02-01'| NewDate == '2007-02-02')

## Convert the Global active power column to numeric ##
mydata$Global_active_power <- as.numeric(levels(mydata$Global_active_power))[mydata$Global_active_power]

## Create a DateTime column ##
x <- paste(mydata$NewDate, mydata$Time)
mydata$Date_time <- strptime(x, "%Y-%m-%d %H:%M:%S")

## Convert the Sub Metering Columns to numeric ##
mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)

## Convert the Voltage to numeric ##
mydata$Voltage <- as.numeric(mydata$Voltage)

## Create the required 2x2 chart ##
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
with(mydata, {
  with(mydata,plot(Date_time, Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type = "l"))
  with(mydata,plot(Date_time, Voltage, xlab="datetime", ylab = "Voltage", type = "l"))
  with(mydata,plot(Date_time,Sub_metering_1 , xlab="", ylab = "Energy sub metering", ylim = c(0,35), type = "l"))
  par(new=T)
  with(mydata,plot(Date_time,Sub_metering_2 , xlab="", ylab = "", type = "l", col = "red", ylim = c(0,35), axes=F))
  par(new=T)
  with(mydata,plot(Date_time,Sub_metering_3 , xlab="", ylab = "", type = "l", col = "blue", ylim = c(0,35), axes=F))
  legend("topright", lty = 1, cex=0.2, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  with(mydata,plot(Date_time, Global_active_power, xlab="datetime", ylab = "Global_active_power", type = "l"))
})

## Create a PNG file of the chart ##
dev.copy(png, file = "plot4.png")
dev.off()