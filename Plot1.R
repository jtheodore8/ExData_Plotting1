## With the file "household_power_consuption.txt" in your working directory, write table
## "data" to be used for creating plot.
library(sqldf)
data<-read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=F,
                   sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

## Merge and convert Date and Time fields to proper class
library(lubridate)
data$DateTime<-dmy_hms(paste(data$Date, data$Time, sep = "-"))

## Plot 1
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.copy(png, file = "Plot1.png", width = 480, height = 480)
dev.off()
