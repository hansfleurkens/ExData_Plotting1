###############################################################################
# Assignment 1 Course Exploratory Data Analysis
# 
# Title : Create Plot4.png from household power consumption dataset
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

# create plot4
png(file="plot4.png")

dat$dtime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))
# 1st plot
plot(dat$dtime,dat$Global_active_power,type="l",ylab="Global Active Power",xlab="")

#2nd plot
plot(dat$dtime,dat$Voltage,type="l",ylab="Voltage",xlab="datetime")

# 3th plot
plot(dat$dtime,dat$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(dat$dtime,dat$Sub_metering_2,col="red")
lines(dat$dtime,dat$Sub_metering_3,col="blue")
legend("topright",bty="n",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#4th plot
plot(dat$dtime,dat$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()