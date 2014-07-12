## Read complete dataset
ElectricPowerConsumptionData <- read.csv("/Users/Kavita/Documents/Coursera - Data Science/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
ElectricPowerConsumptionData$Date <- as.Date(ElectricPowerConsumptionData$Date, format="%d/%m/%Y")

## Cleaning the data
SubsetData <- subset(ElectricPowerConsumptionData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting date and time
datetime <- paste(as.Date(SubsetData$Date), SubsetData$Time)
SubsetData$Datetime <- as.POSIXct(datetime)

# Saving Plot 3 as png
png(filename="plot3.png", height=480, width=480, units = "px")

## Creating Plot 3
plot(SubsetData$Datetime, SubsetData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(SubsetData$Datetime, SubsetData$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(SubsetData$Datetime, SubsetData$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", col=c("black", "red", "blue"),lty= 1,lwd = 2, cex=0.8, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the png file
dev.off()