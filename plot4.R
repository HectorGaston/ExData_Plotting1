#Table format: values separated by ";", header present, decimal point as dot ".", NA characters as "?"
df <- read.table('household_power_consumption.txt', sep = ";", header = T, dec = ".", na.strings = "?")
df <- df[df[, 'Date'] == '1/2/2007' | df[, 'Date'] == '2/2/2007', ]

#Convert Date and Time to Date-Time column
df$Date <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

#Drop useless column
df$Time <- NULL

#Set graphical device PNG
png(filename = "plot4.png")

#Set a 4x4 canvas
par(mfcol = c(2, 2))
#Fill in plots
plot(df$Date, df$Global_active_power, 
     type = 'l', 
     xlab = "", ylab = "Global Active Power (kilowatts)")

plot(df$Date, df$Sub_metering_1, 
     type = 'n', 
     xlab = "", ylab = "Energy sub metering")
lines(df$Date, df$Sub_metering_1, col = "red")
lines(df$Date, df$Sub_metering_2, col = "green")
lines(df$Date, df$Sub_metering_3, col = "blue")
legend('topright', col = c('red', 'green', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       lty = c(1, 1, 1))

plot(df$Date, df$Voltage, 
     type = 'l', 
     xlab = "datetime", ylab = "Voltage")

plot(df$Date, df$Global_reactive_power, 
     type = 'l', 
     xlab = "datetime", ylab = "Global_reactive_power")

#Close graphical device
dev.off()