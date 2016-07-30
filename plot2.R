#Table format: values separated by ";", header present, decimal point as dot ".", NA characters as "?"
df <- read.table('household_power_consumption.txt', sep = ";", header = T, dec = ".", na.strings = "?")
df <- df[df[, 'Date'] == '1/2/2007' | df[, 'Date'] == '2/2/2007', ]

#Convert Date and Time to Date-Time column
df$Date <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

#Drop useless column
df$Time <- NULL

#Set graphical device PNG
png(filename = "plot2.png")

#Create a plot, type = lines ('l')
plot(df$Date, df$Global_active_power, 
     type = 'l', 
     xlab = "", ylab = "Global Active Power (kilowatts)")

#Close graphical device
dev.off()