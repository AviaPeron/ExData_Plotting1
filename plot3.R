##Getting and subseting the data set
Dat1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
SubDat1 <- Dat1[Dat1$Date  %in% c("1/2/2007","2/2/2007") ,]
## Orgnaize the data (Date, Time and numeric vectors)
SubDat1$Date<- as.Date(SubDat1$Date, "%d/%m/%Y")
SubDat1$Time <- as.ITime(SubDat1$Time, "%H:%M:%S")
for(i in 3:9) {SubDat1[,i] <- as.numeric(SubDat1[,i])}

## Set the date and time to POSIXlt
DateAndTime <- paste(SubDat1$Date, SubDat1$Time)
DateAndTime<-  strptime(DateAndTime, "%d/%m/%Y %H:%M:%S")
## Create a plot and add two lines
plot(DateAndTime, SubDat1$Sub_metering_1, type = "l", ylab = "Energy submetering", xlab = "")
lines(DateAndTime, SubDat1$Sub_metering_2, col = "red")
lines(DateAndTime, SubDat1$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
## Export as PNG file
dev.copy(png, "plot3.png")
dev.off()