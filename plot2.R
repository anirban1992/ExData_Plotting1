#reads the file and stores it in a frame
hpc <- read.table(file = "household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880,
                  na.strings=c("?"))
hpc <- as.data.frame(hpc)

#edits the column names
colnames(hpc) <- c("Date", "Time", "GAP", "GRP", "Voltage","GI","SM1","SM2","SM3")

#converting the numeric data in proper formats accordingly
hpc$GAP <- as.numeric(hpc$GAP)
hpc$DT <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

#stores it in image plot2.png
png("plot2.png", width = 480, height = 480)
plot(hpc$DT, hpc$GAP, type= "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()