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
## create a plot
plot(DateAndTime, SubDat1$Global_active_power, type = "l", xlab = "", ylab = "Global Activ Power (Kilowatts)")
## Export as PNG file
dev.copy(png, file = "plot2.png")
dev.off()