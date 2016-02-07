
## Exploratory Data Analysis - Project 1
## R Script plot1.R constructs Plot 4
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
png(file = "plot4.png", width = 480, height = 480)

# Set English locale. My locale is Russian_Russia.1251 
tmp_time_locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# Construct plots.
par(mfrow = c(2,2))

# Top left plot
with(d, plot(Date_Time, d$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# Top right plot
with(d, plot(Date_Time, d$Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# Bottom left plot
with(d, { 
    plot(Date_Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(Date_Time, Sub_metering_1, col = "black")
    lines(Date_Time, Sub_metering_2, col = "red")
    lines(Date_Time, Sub_metering_3, col = "blue")
})

legend("topright", col = c("black", "blue", "red"), lty = c(1,1,1), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom right plot
with(d, plot(Date_Time, d$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))


# Repair locale.
Sys.setlocale("LC_TIME", tmp_time_locale)

# Save the PNG file.
dev.off()

# Clear environment.
rm(list = "d")


