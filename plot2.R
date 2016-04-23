###############################################################################
# Assignment 1 Course Exploratory Data Analysis
# 
# Title : Create Plot2.png from household power consumption dataset
#
# Author: Hans Fleurkens
#
###############################################################################

# Download file, unzip it and read the resulting table into R
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileURL, destfile = temp)
unzip(temp)
unlink(temp)
alldata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")


# Dates are in format d/m/y, we are only interested in two days
seldat<- alldata[(alldata$Date == "2/2/2007" | alldata$Date == "1/2/2007"),]
good <- complete.cases(seldat)
dat <- seldat[good,1:9]

# create plot2
png(file="plot2.png")
dat$dtime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
plot(dat$dtime,dat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()