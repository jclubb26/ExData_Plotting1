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

png('plot2.png')
with(power_sub, plot(Date, Global_active_power, type = "l", 
                     xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

