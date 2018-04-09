# Load and filter out the useful data
data <- read.csv("household_power_consumption.txt", sep = ";", colClasses = "character", na.strings = "?")
data <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007", ]
data <- data[complete.cases(data), ]

# Get the time line
TimeLine <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Produce plot4 in a png file
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(TimeLine,data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(TimeLine,data$Voltage, type = "l", xlab = "datetime", ylab = "Votage")
plot(TimeLine, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(TimeLine, data$Sub_metering_2, col = "red")
lines(TimeLine, data$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1, bty = "n")
plot(TimeLine,data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()