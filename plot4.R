# plot4.R
# started 120915 last modified 120915
# This is for the first course project of the Exploratory Data Analysis course in the JHU Data Scientist Specialization

# Clean out the state of the R workspace
rm(list = ls())

# while working, set working directory to the directory I am using for the cloned github repo.
# comment this out when complete.
# setwd("/home/mark/ExData_Plotting1/")

# read in the data which is stored in a semicolon separated file called "household_power_consumtion.txt", treating ? as NA
powerconsumption<-as.data.frame(read.table(file="household_power_consumption.txt", sep=";",header=TRUE,na.strings="?"))

# select the days of interest, 2007-02-01 and 2007-02-02
consumptionofinterest<-subset(powerconsumption, (Date=="1/2/2007"|Date=="2/2/2007"))

# add a real date-time to the frame
library(lubridate)
consumptionofinterest$pasted<-paste(consumptionofinterest$Date, consumptionofinterest$Time)
consumptionofinterest$datetime<-dmy_hms(consumptionofinterest$pasted)

# open our 480x480 png device.  I noticed the actual ones on the instruction page are transparent background-
# I wasn't positive if we were meant to do white or transparent, so I went with transparent
png("plot4.png",width=480,height=480,bg="transparent")

# Set up to do a 2x2grid of plots
par(mfrow=c(2,2))

# Make a plot of Global_active_power vs. time with the specified y-axis label and no x-axis label.  This is just plot 2 again with slightly changed y-label
plot(consumptionofinterest$datetime,consumptionofinterest$Global_active_power,type="l",xlab="",ylab="Global active power")

# Make a new plot of Voltage vs. time with the indicated x-axis and y-axis labels
plot(consumptionofinterest$datetime,consumptionofinterest$Voltage, type="l",xlab="datetime",ylab="Voltage")

# recreate plot 3, but with no border around the legend
# Make a plot of the Sub_metering_1 power, in black, with specified y-axis label and no x-axis label.
plot(consumptionofinterest$datetime,consumptionofinterest$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
# Add Sub__metering_2 in red
lines(consumptionofinterest$datetime,consumptionofinterest$Sub_metering_2,col="red")
# Add Sub_metering_3 in blue
lines(consumptionofinterest$datetime,consumptionofinterest$Sub_metering_3,col="blue")
# Add legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"),bty="n")

# Plot Global_reactive_power vs. time and add the indicated x and y axis labels
plot(consumptionofinterest$datetime,consumptionofinterest$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

# close the png device
dev.off()

# working as of 12-09-15