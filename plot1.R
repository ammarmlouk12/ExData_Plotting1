plot1<-function() {
##file name
FileName <- "household_power_consumption.txt"

##column names
colNames = c("Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")
colClasses = c("character", "character", rep("numeric",7) )

##read file
DataFile <- read.table(fn, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

##convert to Date type, then filter
DataFile$Date = as.Date(DataFile$Date, format="%d/%m/%Y")
DataFile = DataFile[DataFile$Date >= as.Date("2007-02-01") & DataFile$Date<=as.Date("2007-02-02"),]

##plot and save graph
png(filename="plot1.png", width=480, height=480, units="px")
hist(DataFile$GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
}
