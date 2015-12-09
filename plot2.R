# plot2.R
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
png("plot2.png",width=480,height=480,bg="transparent")

# Make a plot of Global_active_power vs. time with the specified y-axis label and no x-axis label.
plot(consumptionofinterest$datetime,consumptionofinterest$Global_active_power,type="l",xlab="",ylab="Global active power (kilowatts)")

# close the png device
dev.off()

# working as of 12-09-15