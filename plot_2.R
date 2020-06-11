
#library("data.table")
library("data.table")
setwd("~/Desktop/ashes/datasciencecoursera/Exploratory_Data_Analysis")
power1<- data.table::fread(input = "data.txt", na.strings = "?")

#Reads in data from file then subsets data for specified dates
power1<- data.table::fread(input = "data.txt"
                           , na.strings="?"
)

# Prevents Scientific Notation
power1[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
power1[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
power1 <- power1[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = power1[, dateTime]
     , y = power1[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

