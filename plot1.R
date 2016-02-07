
## Exploratory Data Analysis - Project 1
## R Script plot1.R constructs Plot 1
## This R Script: 
##   1. reads data set from file household_power_consumption.txt form work
##      directory.
##   2. Subsets dates 2007-02-01 and 2007-02-02.
##   3. Converts date and time.
##   4. Constructs plot.
##   5. Saves plot to a PNG file.


# Read data file.
d <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Subset dates 2007-02-01 and 2007-02-02.
d <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007",]

# Converts date and time.
d <- cbind(Date_Time = strptime(paste(d2$Date, d2$Time), "%d/%m/%Y %H:%M:%S"), d)

# Create The PNG file.
png(file = "plot1.png", width = 480, height = 480)

# Construct plot.
hist(d$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# Save the PNG file.
dev.off()

# Clear environment.
rm(list = "d")
