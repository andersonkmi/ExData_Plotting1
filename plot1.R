library(dplyr)

# Unzips the data set
unzip("household_power_consumption.zip", "household_power_consumption.txt")

# Loads the data set
power_consumption <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
scoped_power_data <- filter(power_consumption,Date %in% c("1/2/2007","2/2/2007")) 

png("plot1.png",width=480,height=480)
hist(scoped_power_data$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
dev.off()


