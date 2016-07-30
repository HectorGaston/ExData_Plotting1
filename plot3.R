#Table format: values separated by ";", header present, decimal point as dot ".", NA characters as "?"
df <- read.table('household_power_consumption.txt', sep = ";", header = T, dec = ".", na.strings = "?")
df <- df[df[, 'Date'] == '1/2/2007' | df[, 'Date'] == '2/2/2007', ]

#Convert Date and Time to Date-Time column
df$Date <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

#Drop useless column
df$Time <- NULL

#Set graphical device PNG
png(filename = "plot3.png")

#Create a plot, then add lines
plot(df$Date, df$Sub_metering_1, 
     type = 'n', 
     xlab = "", ylab = "Energy sub metering")
lines(df$Date, df$Sub_metering_1, col = "red")
lines(df$Date, df$Sub_metering_2, col = "green")
lines(df$Date, df$Sub_metering_3, col = "blue")
legend('topright', col = c('red', 'green', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       lty = c(1, 1, 1))

#Close graphical device
dev.off()