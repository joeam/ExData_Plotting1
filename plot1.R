plotGraph1 <- function(){
     if(!file.exists('./household_power_consumption.txt')){
          url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
          download.file(url, 'hpc.zip', method=ifelse(.Platform$OS.type=="windows", "internal", "curl"))
          unzip('hpc.zip')
     }
     png("plot1.png")
     
     hpc <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
     hpc <- hpc[hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007',]
     hist(hpc$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main="Global Active Power")
     dev.off()
     
}