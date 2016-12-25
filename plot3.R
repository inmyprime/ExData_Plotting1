# Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Get the data we use
used_data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
rm(data)

# Convert date/time format
used_data$datetime <- strptime(paste(used_data$Date, used_data$Time), "%Y-%m-%d %H:%M:%S")
used_data$datetime <- as.POSIXct(used_data$datetime)

# Plot 3
with(used_data, {
  plot(Sub_metering_1 ~ datetime, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ datetime, col = "red")
  lines(Sub_metering_3 ~ datetime, col = "blue")
})
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()