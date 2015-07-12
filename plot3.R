#project 1 from exploratory data analysis 
setwd("~/Myfolder/BIGDATA/Coursera/Signature_track/Data_science_Specialization/exploratorydataanalysis/week1/pr1")
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "epc.csv")

#Reading Data
dat <- read.delim("household_power_consumption.txt", sep=";" , header=TRUE)


dat <- na.omit(dat)
dat$Date <- strptime(paste0(as.character(dat$Date)," ", as.character(dat$Time) ), "%d/%m/%Y %H:%M:%S")

subdat <- subset(dat, Date >= strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") & Date <= strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S"))

png(filename = "plot3.png",
    width = 480, height = 480)


par(pch=" ")
with( subdat, 
      plot(Date,as.numeric(as.character(Sub_metering_1)) ,
           ylab = "Energy Submetering ",
          
           
      )
      
      
)

lines(x=subdat$Date, y=as.numeric(as.character(subdat$Sub_metering_1)), col="purple")

lines(x=subdat$Date, y=as.numeric(as.character(subdat$Sub_metering_2)), col="red")

lines(x=subdat$Date, y=as.numeric(as.character(subdat$Sub_metering_3)), col="blue")

legend(x= "topright", y=0.92, legend= c("Submetering_1","submetering_2", "Submetering_3"), lty=c(1,1, 1), lwd=c(2.5,2.5, 2.5), col=c("purple","red", "blue"))

dev.off()
