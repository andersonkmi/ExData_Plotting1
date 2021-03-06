library(dplyr)

# Unzips the data set
unzip("household_power_consumption.zip", "household_power_consumption.txt")

# Loads the data set
power_consumption <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
scoped_power_data <- filter(power_consumption,Date %in% c("1/2/2007","2/2/2007")) 
scoped_power_data$Timestamp <- strptime(paste(scoped_power_data$Date, scoped_power_data$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png",width=480,height=480)
plot(scoped_power_data$Timestamp, type = "l", scoped_power_data$Sub_metering_1, ylab="Energy sub metering", xlab = NA)
lines(scoped_power_data$Timestamp, type = "l", scoped_power_data$Sub_metering_2, col = "red")
lines(scoped_power_data$Timestamp, type = "l", scoped_power_data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()