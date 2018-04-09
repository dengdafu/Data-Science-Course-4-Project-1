# Load in the "sqldf" package, which provides "read.csv.sql"
library(sqldf)

# Read in useful data
data <- read.csv.sql("household_power_consumption.txt", sep = ";",
                     sql = "select * from file where Date in ('1/2/2007','2/2/2007')")


# Produce plot1 in a png file
png(file = "plot1.png", width = 480, height = 480, units = "px")

hist(data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     col = "red")

dev.off()
