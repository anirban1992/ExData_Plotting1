#reads the file and stores it in a frame
hpc <- read.table(file = "household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880,
                  na.strings=c("?"))
hpc <- as.data.frame(hpc)

#edits the column names
colnames(hpc) <- c("Date", "Time", "GAP", "GRP", "Voltage","GI","SM1","SM2","SM3")

#converting the numeric data in proper formats accordingly
hpc$GAP <- as.numeric(hpc$GAP)
hpc$Voltage <- as.numeric(hpc$Voltage)
hpc$GRP <- as.numeric(hpc$GRP)
hpc$SM1 <- as.numeric(hpc$SM1)
hpc$SM2 <- as.numeric(hpc$SM2)
hpc$SM3 <- as.numeric(hpc$SM3)
hpc$DT <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

#stores it in image plot4.png
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#plot 1
plot(hpc$DT, hpc$GAP, type= "l", xlab = "", ylab="Global Active Power (kilowatts)")

#plot 2
plot(hpc$DT, hpc$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#plot 3
plot(hpc$DT, hpc$SM1, type="l", ylab = "Energy sub metering", xlab = "")
lines(hpc$DT, hpc$SM2, col = "RED")
lines(hpc$DT, hpc$SM3, col = "BLUE")
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), lwd = c(1, 1, 1), col = c("BLACK", "RED", "BLUE")) 

#plot 4
plot(hpc$DT, hpc$GRP, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()