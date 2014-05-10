library(lubridate)

power_consumption <- read.table('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE, header=TRUE)

date_range <- as.Date(c('2007-02-01', '2007-02-02'))
power_consumption <- power_consumption[as.Date(dmy(power_consumption$Date)) %in% date_range,]

png('plot4.png')

par(mfrow=c(2,2))
x = as.POSIXlt(paste(dmy(power_consumption$Date), power_consumption$Time))


plot(
  x, 
  as.numeric(power_consumption$Global_active_power), 
  type='n',
  xlab='',
  ylab='Global Active Power'
)
lines(x, as.numeric(power_consumption$Global_active_power))

plot(
  x, 
  as.numeric(power_consumption$Voltage), 
  type='n',
  xlab='datetime',
  ylab='Voltage'
)
lines(x, as.numeric(power_consumption$Voltage))

plot(
  x, 
  as.numeric(power_consumption$Sub_metering_1), 
  type='n',
  xlab='',
  ylab='Energy sub metering'
  )
lines(as.POSIXlt(paste(dmy(power_consumption$Date), power_consumption$Time)), as.numeric(power_consumption$Sub_metering_1), col='black')
lines(as.POSIXlt(paste(dmy(power_consumption$Date), power_consumption$Time)), as.numeric(power_consumption$Sub_metering_2), col='red')
lines(as.POSIXlt(paste(dmy(power_consumption$Date), power_consumption$Time)), as.numeric(power_consumption$Sub_metering_3), col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black','red','blue'), lty=1, bty='n')

plot(
  x, 
  as.numeric(power_consumption$Global_reactive_power), 
  type='n',
  xlab='datetime',
  ylab='Voltage'
)
lines(x, as.numeric(power_consumption$Global_reactive_power))
dev.off()
