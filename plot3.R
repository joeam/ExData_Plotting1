plotGraph3 <- function(){
     if(!file.exists('./household_power_consumption.txt')){
          url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
          download.file(url, 'hpc.zip', method=ifelse(.Platform$OS.type=="windows", "internal", "curl"))
          unzip('hpc.zip')
     }
     png("plot3.png")
     
     hpc <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
     hpc <- hpc[hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007',]
     weekDays <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')
     plot(weekDays, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
     lines(weekDays, hpc$Sub_metering_2, type="l", col="red")
     lines(weekDays, hpc$Sub_metering_3, type="l", col="blue")
     legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5,2.5),col=c("black", "red","blue"))
     
     dev.off()
} 