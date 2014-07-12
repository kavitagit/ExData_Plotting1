## Read complete dataset
ElectricPowerConsumptionData <- read.csv("/Users/Kavita/Documents/Coursera - Data Science/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
ElectricPowerConsumptionData$Date <- as.Date(ElectricPowerConsumptionData$Date, format="%d/%m/%Y")

## Cleaning the data
SubsetData <- subset(ElectricPowerConsumptionData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting date and time
datetime <- paste(as.Date(SubsetData$Date), SubsetData$Time)
SubsetData$Datetime <- as.POSIXct(datetime)

# Saving Plot 4 as png
png(filename="plot4.png", height=480, width=480, units = "px")

## Creating Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# Topleft plot
plot(SubsetData$Datetime, SubsetData$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# Topright plot
plot(SubsetData$Datetime, SubsetData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# Bottomleft plot
plot(SubsetData$Datetime, SubsetData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
points(SubsetData$Datetime, SubsetData$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
points(SubsetData$Datetime, SubsetData$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", lty= 1,lwd = 2, cex=0.6,bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottomright plot
plot(SubsetData$Datetime, SubsetData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))

# Close the png file
dev.off()
