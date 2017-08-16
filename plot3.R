getwd()
setwd("C:/Users/FIRSTBEAT/Documents/R/Coursera/Exploratory Data Analysis Assignment")

fileURL <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"

download.file(fileURL, mode = "wb",
              destfile = "Exploratory Data Analysis Assignment.zip")

unzip("Exploratory Data Analysis Assignment.zip")

power <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?",
                    header = TRUE, colClasses = c("character", "factor", "numeric",
                                                  "numeric", "numeric", "numeric",
                                                  "numeric", "numeric", "numeric"))

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
power_sub <- power[power$Date %in% d1:d2, ]

power_sub$Date <- as.POSIXct(paste(power_sub$Date, power_sub$Time), 
                             format = "%Y-%m-%d %H:%M:%S")

png('plot3.png')
with(power_sub, plot(Date, Sub_metering_1, type = "n",
                     xlab = "", ylab = "Energy sub metering"))
with(power_sub, points(Date, Sub_metering_1, type = "l"))
with(power_sub, points(Date, Sub_metering_2, type = "l", col = "red"))
with(power_sub, points(Date, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()
