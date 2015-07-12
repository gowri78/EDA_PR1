
#project 1 from exploratory data analysis 
setwd("~/Myfolder/BIGDATA/Coursera/Signature_track/Data_science_Specialization/exploratorydataanalysis/week1/pr1")
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "epc.csv")

#Reading Data
dat <- read.delim("household_power_consumption.txt", sep=";" , header=TRUE)


dat <- na.omit(dat)
dat$Date <- strptime(paste0(as.character(dat$Date)," ", as.character(dat$Time) ), "%d/%m/%Y %H:%M:%S")

subdat <- subset(dat, Date >= strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") & Date <= strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S"))


#plot1

png(filename = "plot1.png",
    width = 480, height = 480)


hist(as.numeric(as.character(subdat$Global_active_power)), col="red", 
     xlab="Global Active Power(kilowatts)", main = "Global Active Power", 
     xlim= range(as.numeric(as.character(subdat$Global_active_power))))

dev.off()



                 




