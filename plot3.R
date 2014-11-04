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

# plot
plot(s$datetime, s$Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering")
lines(s$datetime, s$Sub_metering_2, col = "red")
lines(s$datetime, s$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.7)
