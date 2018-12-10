

##reading data into r, converting to date, and getting correct dates
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
first <- subset(power, power$Date=="2007-02-01")
second <- subset(power, power$Date=="2007-02-02")
hpc <- rbind(first,second)
datetime <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%Y-%m-%d %H:%M:%S")


##Converting to numeric
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)
hpc$Voltage <- as.numeric(hpc$Voltage)
hpc$Global_intensity <- as.numeric(hpc$Global_intensity)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)




##plot4


par(mfrow = c(2, 2))

plot(datetime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")
lines(datetime, hpc$Sub_metering_2, type="l", col="red")
lines(datetime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()

