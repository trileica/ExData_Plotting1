library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.string = c("?", " "))
data$Date <- as.Date(as.character(data[,1]),"%d/%m/%Y")
data$temp <- paste(data$Date, data$Time)
data$Time <- strptime(data$temp, format = "%Y-%m-%d %H:%M:%S")

d1 <- subset(data, data$Date=="2007-02-01")
d2 <- subset(data, data$Date=="2007-02-02")
dat <- rbind(d1, d2)
dat$temp <- NULL

#Plot3
png(filename = "plot3.png")
plot(dat$Time, dat$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(dat$Time, dat$Sub_metering_1)
lines(dat$Time, dat$Sub_metering_2, col = "red")
lines(dat$Time, dat$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
