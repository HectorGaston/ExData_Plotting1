#Table format: values separated by ";", header present, decimal point as dot ".", NA characters as "?"
df <- read.table('household_power_consumption.txt', sep = ";", header = T, dec = ".", na.strings = "?")
df <- df[df[, 'Date'] == '1/2/2007' | df[, 'Date'] == '2/2/2007', ]

#Set graphical device PNG
png(filename = "plot1.png")

#Create a histogram
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

#Close graphical device
dev.off()