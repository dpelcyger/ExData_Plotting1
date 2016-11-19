#Read in data 
inputFile <- "C:/Users/david/Desktop/exploratorydata/household_power_consumption.txt"
DF <- read.csv(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset rows where date is 1/2/2007 or 2/2/2007
subsetDF <- subset(DF, Date %in% c("1/2/2007","2/2/2007"))

#Convert Sub_metering_1, Sub_metering_2, Sub_metering_3 to numeric

subsetDF$Sub_metering_1 <- as.numeric(as.character(subsetDF$Sub_metering_1))
subsetDF$Sub_metering_2 <- as.numeric(as.character(subsetDF$Sub_metering_2))
subsetDF$Sub_metering_3 <- as.numeric(as.character(subsetDF$Sub_metering_3))

#Concatenate date and time in new column Timestamp   
subsetDF$Timestamp <-paste(subsetDF$Date, subsetDF$Time)

#Construct plot3.PNG plot
png(file= "plot3.png", width=480, height=480)

#Set up plot in black--date and time vs Sub_metering_1
plot(strptime(subsetDF$Timestamp, "%d/%m/%Y %H:%M:%S"), subsetDF$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

#Add line in red--date and time vs Sub_metering_2
lines(strptime(subsetDF$Timestamp, "%d/%m/%Y %H:%M:%S"), subsetDF$Sub_metering_2, type = "l", col = "red" )

#Add line in blue--date/time vs Sub_metering_3
lines(strptime(subsetDF$Timestamp, "%d/%m/%Y %H:%M:%S"), subsetDF$Sub_metering_3, type = "l", col = "blue" )

#Add a legend
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close PNG Device
dev.off()
