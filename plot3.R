# Plot 3
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

subset_data_date <- as.Date(subset_data$Date,"%d/%m/%Y")
new_subset <-cbind(subset, "dt" = as.POSIXct(paste(subset_data_date, subset$Time)))
png("purple.png", width = 480, height = 480)
with(new_subset, {plot(Sub_metering_1 ~ dt, type="l", xlab= "", ylab="Energy Sub Metering", col="black", main = "Energy sub metering")})
lines(new_subset$Sub_metering_2 ~ new_subset$dt, col = "red")
lines(new_subset$Sub_metering_3 ~ new_subset$dt, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

