# Read the dataset, we save the dataset in the variable hpc
hpc <- read.csv("~/Documents/Online_Courses/Coursera/Exploratory_Data_Analysis/Projects/Data/household_power_consumption.txt", sep=";")
# Convert Date/time to R variables
hpc1 <- hpc

hpc1$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc1$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# Subset Data
hpc2 <- subset(hpc1, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot

y1 <- as.numeric(levels(hpc2$Global_active_power)[hpc2$Global_active_power])
y2 <- as.numeric(levels(hpc2$Voltage)[hpc2$Voltage])


png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12
)
    
par(mfrow=c(2,2))

with(hpc2, {
  plot(DateTime, y1, type='l', main="", xlab="", ylab="Global Active Power (kilowatts)")
  plot(DateTime, y2, type='l', main="", xlab="datetime", ylab="Voltage")
  plot(DateTime, Sub_metering_1, type='l', col="black", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, type='l', col="red")
  lines(DateTime, Sub_metering_3, type='l', col="blue")
  legend("topright", lwd=2, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type='l', main="", xlab="datetime", ylab="Global_reactive_power")
})

dev.off()

