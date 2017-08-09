##Getting and subseting the data set
Dat1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
SubDat1 <- Dat1[Dat1$Date  %in% c("1/2/2007","2/2/2007") ,]
## Orgnaize the data (Date, Time and numeric vectors)
SubDat1$Date<- as.Date(SubDat1$Date, "%d/%m/%Y")
SubDat1$Time <- as.ITime(SubDat1$Time, "%H:%M:%S")
for(i in 3:9) {SubDat1[,i] <- as.numeric(SubDat1[,i])}
## Making two rows and two columns
par(mfrow = c(2,2))
## Set the date and time to POSIXlt
DateAndTime <- paste(SubDat1$Date, SubDat1$Time)
DateAndTime<-  strptime(DateAndTime, "%d/%m/%Y %H:%M:%S")
## plot1
plot(DateAndTime, SubDat1$Global_active_power, type = "l", xlab = "", ylab = "Global Activ Power (Kilowatts)")
## plot2
plot(DateAndTime, SubDat1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
## plot3
plot(DateAndTime, SubDat1$Sub_metering_1, type = "l", ylab = "Energy submetering", xlab = "")
lines(DateAndTime, SubDat1$Sub_metering_2, col = "red")
lines(DateAndTime, SubDat1$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
## plot4
plot(DateAndTime, SubDat1$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
## Export as PNG file
dev.copy(png, "plot4.png")
dev.off()