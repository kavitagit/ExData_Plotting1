## Read complete dataset
ElectricPowerConsumptionData <- read.csv("/Users/Kavita/Documents/Coursera - Data Science/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
ElectricPowerConsumptionData$Date <- as.Date(ElectricPowerConsumptionData$Date, format="%d/%m/%Y")

## Cleaning the data
SubsetData <- subset(ElectricPowerConsumptionData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting date and time
datetime <- paste(as.Date(SubsetData$Date), SubsetData$Time)
SubsetData$Datetime <- as.POSIXct(datetime)

## Creaing Plot 2
plot(SubsetData$Global_active_power~SubsetData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving Plot 2
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()