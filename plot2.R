
## Exploratory Data Analysis - Project 1
## R Script plot1.R constructs Plot 2
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
png(file = "plot2.png", width = 480, height = 480)

# Set English locale. My locale is Russian_Russia.1251 
tmp_time_locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# Construct plot.
with(d, plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")) 

# Repair locale.
Sys.setlocale("LC_TIME", tmp_time_locale)

# Save the PNG file.
dev.off()

# Clear environment.
rm(list = "d")


