# Plot 4
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

new_subset <-cbind(subset, "dt" = as.POSIXct(paste(subset_data_date, subset$Time)))
globalactivepower <- as.numeric(subset$Global_active_power)
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
newobject <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(newobject, globalactivepower, type="l", xlab =  "", ylab="Global Active Power (kilowatts)")
plot(new_subset$Voltage ~ new_subset$dt, type="l", xlab = "datetime", ylab = "Voltage")
with(new_subset, {plot(Sub_metering_1 ~ dt, type="l", xlab= "", ylab="Energy Sub Metering", col="black", main = "Energy sub metering")})
lines(new_subset$Sub_metering_2 ~ new_subset$dt, col = "red")
lines(new_subset$Sub_metering_3 ~ new_subset$dt, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(new_subset$Global_reactive_power ~ new_subset$dt, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
