# read data
d <- read.csv("household_power_consumption.txt", sep=";", 
              colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
              na.strings = "?")

# combine time and date
d$datetime <- paste(d$Date, d$Time)
# convert date and time values
d$datetime <- strptime(d$datetime, "%d/%m/%Y %H:%M:%OS")

# subset to given dates
s <- subset(d, d$Date == "1/2/2007" | d$Date == "2/2/2007")

# set locale to English in Windows
Sys.setlocale("LC_TIME","English")

# plots
par(mfrow=c(2,2)) # all plots on one page
# plot #1
plot(s$datetime, s$Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power")
# plot #2
plot(s$datetime, s$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# plot #3
plot(s$datetime, s$Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering")
lines(s$datetime, s$Sub_metering_2, col = "red")
lines(s$datetime, s$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n", cex=0.65)
# plot #4
plot(s$datetime, s$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
