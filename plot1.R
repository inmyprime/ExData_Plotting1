# Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Get the data we use
used_data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
rm(data)

# Plot 1
with(used_data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red"))

# Save to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()