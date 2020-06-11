
install.packages("data.table")
library("data.table")
setwd("~/Desktop/ashes/datasciencecoursera/Exploratory_Data_Analysis")
power <- data.table::fread(input = "data.txt", na.strings = "?")
head(power)
class(power)
lapply
power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
power <- power[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(power[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()



