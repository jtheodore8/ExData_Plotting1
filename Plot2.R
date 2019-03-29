## With the file "household_power_consuption.txt" in your working directory, write table
## "data" to be used for creating plot.
library(sqldf)
data<-read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=F,
                   sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

## Merge and convert Date and Time fields to proper class
library(lubridate)
data$DateTime<-dmy_hms(paste(data$Date, data$Time, sep = "-"))

## Plot 2
plot(data$DateTime, data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot2.png", width = 480, height = 480)
dev.off()
