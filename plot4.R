# Assignement 1 - Exploratory Data Analysis - plot4

# The link for the dataset is in the README file

# Libraries
library(data.table)

# Load the data and read only from the 1/2/2007 and the 2/2/2007 while keeping
# the headers
elec <- fread("household_power_consumption.txt", 
              skip = "1/2/2007",
              nrow = 2880,
              col.names = colnames(fread("household_power_consumption.txt", nrow = 1,
                                         header = TRUE)))

# Convert Date and Time columns into one column named DateTime
elec$DateTime <- as.POSIXct(paste(elec$Date, elec$Time, sep = " "),
                            format = "%d/%m/%Y %H:%M:%S")


# Making plot 4 which is composed of 4 different plots (ABCD)

png("plot4.png") # To be outcommanded if you want to see the graph on screen

par(mfrow = c(2, 2)) # set up to get the four graphs in one page

#plotA
with(elec, plot(DateTime, Global_active_power, type = "l",
                ylab = 'Global Active Power (kilowatts', xlab = ""))

#plotB
with(elec, plot(DateTime, Voltage, type = "s", xlab = "datetime"))

#plotC
with(elec, plot(DateTime, Sub_metering_1, type = "s", 
                ylab = "Energy sub metering", xlab = ""))
with(elec, lines(DateTime, Sub_metering_2, type = "s", col = "red"))
with(elec, lines(DateTime, Sub_metering_3, type = "s", col = "blue"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty =1, bty = "n")

#plotD
with(elec, plot(DateTime, Global_reactive_power, type = "s", xlab = "datetime"))

dev.off() # To be outcommanded if you want to see the graph on screen
