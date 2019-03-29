## With the file "household_power_consuption.txt" in your working directory, write table
## "data" to be used for creating plot.
library(sqldf)
data<-read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=F,
                   sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

## Merge and convert Date and Time fields to proper class
library(lubridate)
data$DateTime<-dmy_hms(paste(data$Date, data$Time, sep = "-"))

## Plot 3
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub meeting")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "blue", "red"), cex = 0.9)
dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()
