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

# plot
hist(s$Global_active_power, breaks = 12, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
