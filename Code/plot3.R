# Read the dataset, we save the dataset in the variable hpc
hpc <- read.csv("~/Documents/Online_Courses/Coursera/Exploratory_Data_Analysis/Projects/Data/household_power_consumption.txt", sep=";")
# Convert Date/time to R variables
hpc1 <- hpc

hpc1$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc1$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# Subset Data
hpc2 <- subset(hpc1, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot
x <- hpc2$DateTime

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12
)

plot(x, hpc2$Sub_metering_1, type='l', col="black", xlab="", ylab="Energy sub metering")
lines(x, hpc2$Sub_metering_2, type='l', col="red")
lines(x, hpc2$Sub_metering_3, type='l', col="blue")
legend("topright", lwd=2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
