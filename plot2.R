# Assignement 1 - Exploratory Data Analysis - plot2

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

# Making the plot 2

png("plot2.png") # To be outcommanded if you want to see the graph on screen

with(elec, plot(DateTime, Global_active_power, type = "l",
                ylab = 'Global Active Power (kilowatts', xlab = ""))

dev.off() # To be outcommanded if you want to see the graph on screen
