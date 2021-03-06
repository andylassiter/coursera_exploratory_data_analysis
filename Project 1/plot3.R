# plot3.R
#
# Coursera - Exploratory Data Analysis
# Project 1
#
# Andy Lassiter
# Oct 11, 2014
#

# Read Data
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert Dates and Times
dateAndTime <- paste(data$Date, data$Time)
dateAndTime <- strptime(x = dateAndTime, format = "%d/%m/%Y %H:%M:%S")
dateAndTime <- data.frame(dateAndTime)

data$Date <- NULL
data$Time <- NULL

data <- cbind(dateAndTime, data)

# Subset data
DATE1 <- strptime("2007-02-01", format = "%Y-%m-%d")
DATE2 <- strptime("2007-02-03", format = "%Y-%m-%d")

data <- data[data$dateAndTime >= DATE1 & data$dateAndTime < DATE2, ]

# Plot
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
with(data,
     plot(dateAndTime, Sub_metering_1,
          type = 'l',
          xlab = "",
          ylab = "Energy sub metering"))
with(data,
     lines(dateAndTime, Sub_metering_2, col = 'red'))
with(data,
     lines(dateAndTime, Sub_metering_3, col = 'blue'))
legend("topright", # Location
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), # Labels
       lty=c(1,1), # Line Type
       lwd=c(2.5,2.5), # Line Weight
       col=c("black", "red", "blue")) # Line Color
dev.off()

