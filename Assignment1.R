## Assignment 1, Exploratory Data Analysis Course
## Read in data and clean it up with respect to dates and times, put the relevant data into a smaller dataframe
data <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings = "?")
data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))
daydata <- data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]
daydata$Time <- as.POSIXlt(paste( daydata$Date, daydata$Time))

## Plot 1
png(filename = "plot1.png")
hist(daydata$Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

## Plot 2
png(filename = "plot2.png")
plot(daydata$Time, daydata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(daydata$Time, daydata$Global_active_power)
dev.off()


## Plot 3
png(filename = "plot3.png")
plot(daydata$Time, daydata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub Metering")
lines(daydata$Time, daydata$Sub_metering_1, col = "black")
lines(daydata$Time, daydata$Sub_metering_2, col = "red")
lines(daydata$Time, daydata$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col=c('black', 'red', 'blue'), legend = c('Sub Metering 1', 'Sub Metering 2', 'Sub Metering 3'))
dev.off()


## Plot 4
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(daydata$Time, daydata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(daydata$Time, daydata$Global_active_power)
plot(daydata$Time, daydata$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(daydata$Time, daydata$Voltage)
plot(daydata$Time, daydata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(daydata$Time, daydata$Sub_metering_1, col = 'black')
lines(daydata$Time, daydata$Sub_metering_2, col = "red")
lines(daydata$Time, daydata$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col=c('black', 'red', 'blue'), legend = c('Sub Metering 1', 'Sub Metering 2', 'Sub Metering 3'))
plot(daydata$Time, daydata$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(daydata$Time, daydata$Global_reactive_power)
dev.off()