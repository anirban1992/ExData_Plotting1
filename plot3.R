#reads the file and stores it in a frame
hpc <- read.table(file = "household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880,
                  na.strings=c("?"))
hpc <- as.data.frame(hpc)

#edits the column names
colnames(hpc) <- c("Date", "Time", "GAP", "GRP", "Voltage","GI","SM1","SM2","SM3")

#converting the numeric data in proper formats accordingly
hpc$SM1 <- as.numeric(hpc$SM1)
hpc$SM2 <- as.numeric(hpc$SM2)
hpc$SM3 <- as.numeric(hpc$SM3)
hpc$DT <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

#stores it in image plot3.png
png("plot3.png", width = 480, height = 480)
plot(hpc$DT, hpc$SM1, type = "l", ylab="Energy sub metering", xlab = "")
lines(hpc$DT, hpc$SM2, col="RED")
lines(hpc$DT, hpc$SM3, col="BLUE")
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), lwd = c(1, 1, 1), col = c("BLACK", "RED", "BLUE")) 

dev.off()