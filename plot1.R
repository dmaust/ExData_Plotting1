library(lubridate)

power_consumption <- read.table('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE, header=TRUE)

date_range <- as.Date(c('2007-02-01', '2007-02-02'))
power_consumption <- power_consumption[as.Date(dmy(power_consumption$Date)) %in% date_range,]

png('plot1.png')

global_active_power = as.numeric(power_consumption$Global_active_power)
hist(global_active_power, 
     col='red',
     xlab='Global Active Power (kilowatts)',
     main='Global Active Power')
dev.off()
