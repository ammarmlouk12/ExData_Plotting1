plot4<-function() {
FileName <- "household_power_consumption.txt"

##column names
colNames = c("Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")
colClasses = c("character", "character", rep("numeric",7) )

##read file
DataFile <- read.table(FileName, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

##convert to Date type, then filter
DataFile$Date = as.Date(DataFile$Date, format="%d/%m/%Y")
DataFile = DataFile[DataFile$Date >= as.Date("2007-02-01") & DataFile$Date<=as.Date("2007-02-02"),]

##plot and save graph
png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

##1st 
plot(DataFile$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power")
axis(1, at=c(1, as.integer(nrow(DataFile)/2), nrow(DataFile)), labels=c("Thu", "Fri", "Sat"))

##2nd
plot(DataFile$voltage, type="l",xaxt="n",xlab="DateTime", ylab="Voltage")
axis(1, at=c(1, as.integer(nrow(DataFile)/2), nrow(DataFile)), labels=c("Thu", "Fri", "Sat"))


##3rd
with(DataFile, {
    plot(SubMetering1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
    lines(x=SubMetering2, col="red")
    lines(x=SubMetering3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(DataFile)/2), nrow(DataFile)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "transparent", bg="transparent")

##4th
plot(DataFile$GlobalReactivePower, type="l",xaxt="n",xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(DataFile)/2), nrow(DataFile)), labels=c("Thu", "Fri", "Sat"))

dev.off()
}
plot4()
