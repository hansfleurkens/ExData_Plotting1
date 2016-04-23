###############################################################################
# Assignment 1 Course Exploratory Data Analysis
# 
# Title : Create Plot3.png from household power consumption dataset
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

# create plot3
png(file="plot3.png")
dat$dtime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
plot(dat$dtime,dat$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(dat$dtime,dat$Sub_metering_2,col="red")
lines(dat$dtime,dat$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()