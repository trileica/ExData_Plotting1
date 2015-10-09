library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.string = c("?", " "))
data$Date <- as.Date(as.character(data[,1]),"%d/%m/%Y")
data$temp <- paste(data$Date, data$Time)
data$Time <- strptime(data$temp, format = "%Y-%m-%d %H:%M:%S")

d1 <- subset(data, data$Date=="2007-02-01")
d2 <- subset(data, data$Date=="2007-02-02")
dat <- rbind(d1, d2)
dat$temp <- NULL

#Plot2
png(filename = "plot2.png")
plot(dat$Time, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active power (kilowatts)")
dev.off()
