# Read the dataset, we save the dataset in the variable hpc
hpc <- read.csv("~/Documents/Online_Courses/Coursera/Exploratory_Data_Analysis/Projects/Data/household_power_consumption.txt", sep=";")
# Convert Date/time to R variables
hpc1 <- hpc

hpc1$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc1$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# Subset Data
hpc2 <- subset(hpc1, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot

y <- as.numeric(levels(hpc2$Global_active_power)[hpc2$Global_active_power])
x <- hpc2$DateTime

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12
)

plot(x,y, type='l', main="", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
