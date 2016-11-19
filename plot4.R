#Read in data 
inputFile <- "C:/Users/david/Desktop/exploratorydata/household_power_consumption.txt"
DF <- read.csv(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset where date is 1/2/2007 or 2/2/2007
subsetDF <- subset(DF, Date %in% c("1/2/2007","2/2/2007"))

#Convert columns to numeric
subsetDF$Global_active_power <- as.numeric(as.character(subsetDF$Global_active_power))
subsetDF$Global_reactive_power <- as.numeric(as.character(subsetDF$Global_reactive_power))
subsetDF$Sub_metering_1 <- as.numeric(as.character(subsetDF$Sub_metering_1))
subsetDF$Sub_metering_2 <- as.numeric(as.character(subsetDF$Sub_metering_2))
subsetDF$Sub_metering_3 <- as.numeric(as.character(subsetDF$Sub_metering_3))
subsetDF$Voltage <- as.numeric(as.character(subsetDF$Voltage))

#Concatenate date and time in new column Timestamp   
subsetDF$Timestamp <-paste(subsetDF$Date, subsetDF$Time)

#Construct plot4.PNG plot
png(file= "plot4.png", width=480, height=480)

#Set up plotting in two rows and two columns, plotting by column first
par(mfcol = c(2,2))

#First plot (row 1, column 1)--date and time vs global_active_power_data
plot(strptime(subsetDF$Timestamp, "%d/%m/%Y %H:%M:%S"), subsetDF$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

#Second plot (row 2, column 1)--date and time vs Sub_metering_1  (black) 
plot(strptime(subsetDF$Timestamp, "%d/%m/%Y %H:%M:%S"), subsetDF$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")

#                  Add a line--date and time vs Sub_metering_2 (red)
lines(strptime(subsetDF$Timestamp, "%d/%m/%Y %H:%M:%S"), subsetDF$Sub_metering_2, type = "l", col = "red" )

#                  Add a line--date/time vs Sub_metering_3 (blue)
lines(strptime(subsetDF$Timestamp, "%d/%m/%Y %H:%M:%S"), subsetDF$Sub_metering_3, type = "l", col = "blue" )

#                  Add a legend
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Third plot (row 1, column 2)--Date and time vs Voltage
plot(strptime(subsetDF$Timestamp, "%d/%m/%Y %H:%M:%S"), subsetDF$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

#Fourth plot (row 2, column 2)--Date and Time vs. global_reactive_power
plot(strptime(subsetDF$Timestamp, "%d/%m/%Y %H:%M:%S"), subsetDF$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

#Close PNG Device
dev.off()
