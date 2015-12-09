# plot1.R
# this is for the first course  project of the Exploratory Data Analysis course of the JHU Data Science Specialization
# started 120815 last modified 120915

# Clean out the state of the R workspace
rm(list = ls())

# while working, set working directory to the directory I am using for the cloned github repo.
# comment this out when complete.
# setwd("/home/mark/ExData_Plotting1/")

# read in the data which is stored in a semicolon separated file called "household_power_consumtion.txt", treating ? as NA
powerconsumption<-as.data.frame(read.table(file="household_power_consumption.txt", sep=";",header=TRUE,na.strings="?"))

# select the days of interest, 2007-02-01 and 2007-02-02
consumptionofinterest<-subset(powerconsumption, (Date=="1/2/2007"|Date=="2/2/2007"))

# open our 480x480 png device.  I noticed the actual ones on the instruction page are transparent background
# wasn't positive if we were meant  to do white or transparent, so I went with transparent
png("plot1.png",width=480,height=480,bg="transparent")

# Make a histogram of the Global_active_power, in red, with specified x-axis label and main title.
hist(consumptionofinterest$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power", col="red")

# close the png device
dev.off()

# working as of 12-09-15