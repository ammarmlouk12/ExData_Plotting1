plot2 <- function() {

FileName <- "household_power_consumption.txt"

colNames = c("Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")
colClasses = c("character", "character", rep("numeric",7))

DataFile <- read.table(FileName, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

DataFile$date = as.Date(DataFile$Date, format="%d/%m/%Y")
DataFile = DataFile[DataFile$Date >= as.Date("2007-02-01") & DataFile$Date<=as.Date("2007-02-02"),]

png(filename="plot2.png", width=480, height=480, units="px")
plot(DataFile$GlobalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(DataFile)/2), nrow(DataFile)), labels=c("Thu", "Fri", "Sat"))
dev.off()
}
plot2()
