#Step 1: Getting data

#Setting column names
colnam <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
            "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Read in only required data
df <- read.table('data/household_power_consumption.txt', header = FALSE, sep = ";", 
                 dec = ".", na.strings = "?", col.names = colnam,
                 skip = grep("31/1/2007;23:59", readLines('data/household_power_consumption.txt')),
                 nrows = 2880)

##Comments on read.table arguments:
##skip was set so that all previous date and time points before 1/2/2007;00:00:00 were ignored
##nrows was calculated given that during 2 days every minute was measured (2*24*60)

#Step 2: Preparing data

#Change date and time format

#Change time with strptime()
df$Date <- as.character(df$Date)
df$Time <- as.character(df$Time)
df$Time <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
##Comment on this prcedure:
##strptime(df$Time, format = "%H:%M:%S") is of no use here, since it would only
##take the time component into account and - because of missing date component -
##attribute today's date to the time, which makes plotting correct time series 
##impossible!

#Change date with as.Date()
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#Step 3: Plotting

#Create plot on screen device
hist(df$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#Copy plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")

#closing PNG device
dev.off()



