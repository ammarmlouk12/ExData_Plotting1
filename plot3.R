plot3<-function() {
##make sure you set directory to file where the file:ExData1 is located
FileName <- read.table("ExData1/household_power_consumption.txt", skip = 66637, nrows = 69517 - 66637, sep = ";", na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
FileName$DateTime <- strptime(paste(FileName$Date, FileName$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", width=480, height=480)

plot(FileName$DateTime, FileName$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")

lines(FileName$DateTime, FileName$Sub_metering_1, type= "l", col="Black")
lines(FileName$DateTime, FileName$Sub_metering_2, type= "l", col="red")
lines(FileName$DateTime, FileName$Sub_metering_3, type= "l", col="blue")
dev.off()
}
plot3()
