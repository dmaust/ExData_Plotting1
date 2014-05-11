library(lubridate)

power_consumption <- read.table('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE, header=TRUE)

date_range <- as.Date(c('2007-02-01', '2007-02-02'))
power_consumption <- power_consumption[as.Date(dmy(power_consumption$Date)) %in% date_range,]

png('plot2.png')

global_active_power = as.numeric(power_consumption$Global_active_power)
plot(
  as.POSIXlt(paste(dmy(power_consumption$Date), power_consumption$Time)), 
  as.numeric(power_consumption$Global_active_power), 
  type='l',
  xlab='',
  ylab='Global Active Power (kilowatts)'
  )
dev.off()
