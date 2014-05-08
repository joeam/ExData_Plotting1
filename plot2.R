plotGraph2 <- function(){
     if(!file.exists('./household_power_consumption.txt')){
          url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
          download.file(url, 'hpc.zip', method=ifelse(.Platform$OS.type=="windows", "internal", "curl"))
          unzip('hpc.zip')
     }
     png("plot2.png")
     
     hpc <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
     hpc <- hpc[hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007',]
     weekDays <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')
     plot(weekDays, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
     
     dev.off()
} 