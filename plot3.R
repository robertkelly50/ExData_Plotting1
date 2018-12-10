

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



##plot3

png("plot3.png", width=480, height=480)
plot(datetime, hpc$Sub_metering_1, col="grey", type="l")
lines(datetime, hpc$Sub_metering_2, col="red")
lines(datetime, hpc$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()