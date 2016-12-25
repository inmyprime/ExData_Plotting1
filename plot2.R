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

# Plot 2
with(used_data, plot(Global_active_power ~ datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# Save to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
