library(dplyr)

# Unzips the data set
unzip("household_power_consumption.zip", "household_power_consumption.txt")
power_consumption <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
power_feb <- filter(power_consumption,Date %in% c("1/2/2007","2/2/2007")) 

png("plot1.png",width=480,height=480)
hist(power_feb$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
dev.off()


