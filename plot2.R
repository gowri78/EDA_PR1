#project 1 from exploratory data analysis 
setwd("~/Myfolder/BIGDATA/Coursera/Signature_track/Data_science_Specialization/exploratorydataanalysis/week1/pr1")
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "epc.csv")

#Reading Data
dat <- read.delim("household_power_consumption.txt", sep=";" , header=TRUE)


dat <- na.omit(dat)
dat$Date <- strptime(paste0(as.character(dat$Date)," ", as.character(dat$Time) ), "%d/%m/%Y %H:%M:%S")

subdat <- subset(dat, Date >= strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") & Date <= strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S"))

png(filename = "plot2.png",
    width = 480, height = 480)


par(pch=" ")
with( subdat, 
      plot(Date,as.numeric(as.character(Global_active_power)) ,
           ylab = "Global Active Power(KiloWatts)"
           )
      
      
      )

lines(x=subdat$Date, y=as.numeric(as.character(subdat$Global_active_power)))

dev.off()
