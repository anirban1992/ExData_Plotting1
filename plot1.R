#reads the file and stores it in a frame
hpc <- read.table(file = "household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880,
                  na.strings=c("?"))
hpc <- as.data.frame(hpc)

#edits the column names
colnames(hpc) <- c("Date", "Time", "GAP", "GRP", "Voltage","GI","SM1","SM2","SM3")

#converting the numeric data in proper formats accordingly
hpc$GAP <- as.numeric(hpc$GAP)

#stores it in image plot1.png
png("plot1.png", width = 480, height = 480)
hist(hpc$GAP, xlab = "Global Active Power (kilowatts)", main = "Global Active Power",col = "RED")

dev.off()