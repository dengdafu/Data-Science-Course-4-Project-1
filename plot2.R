# Load and filter out the useful data
data <- read.csv("household_power_consumption.txt", sep = ";", colClasses = "character", na.strings = "?")
data <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007", ]
data <- data[complete.cases(data), ]

# Get the time line
TimeLine <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Produce plot2 in a png file
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(TimeLine, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()