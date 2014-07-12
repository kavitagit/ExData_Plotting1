## Read complete dataset
ElectricPowerConsumptionData <- read.csv("/Users/Kavita/Documents/Coursera - Data Science/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
ElectricPowerConsumptionData$Date <- as.Date(ElectricPowerConsumptionData$Date, format="%d/%m/%Y")

## Cleaning the data
SubsetData <- subset(ElectricPowerConsumptionData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting date and time
datetime <- paste(as.Date(SubsetData$Date), SubsetData$Time)
SubsetData$Datetime <- as.POSIXct(datetime)

## Creating Plot 1
hist(SubsetData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving Plot 1
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()