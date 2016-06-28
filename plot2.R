# Plot 2
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot2.png", width = 480, height = 480)
newobject <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subset$Global_active_power)
plot(newobject, globalactivepower, type="l", xlab =  "", ylab="Global Active Power (kilowatts)")
dev.off()
