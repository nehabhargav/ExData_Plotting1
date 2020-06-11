###############plot3excersise#################

library("data.table")
setwd("~/Desktop/ashes/datasciencecoursera/Exploratory_Data_Analysis")
power2<- data.table::fread(input = "data.txt", na.strings = "?")

#Reads in data from file then subsets data for specified dates
power2<- data.table::fread(input = "data.txt"
                           , na.strings="?"
)



# Prevents Scientific Notation
power2[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
power2[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
power2 <- power2[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

# Plot 3
plot(power2[, dateTime], power2[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power2[, dateTime], power2[, Sub_metering_2],col="red")
lines(power2[, dateTime], power2[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
