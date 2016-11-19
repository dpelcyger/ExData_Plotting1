#Read in data 
inputFile <- "C:/Users/david/Desktop/exploratorydata/household_power_consumption.txt"
DF <- read.csv(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset where date is 1/2/2007 or 2/2/2007
subsetDF <- subset(DF, Date %in% c("1/2/2007","2/2/2007"))

#Convert global_active_power to numeric
subsetDF$Global_active_power <- as.numeric(as.character(subsetDF$Global_active_power))

#Concatenate date and time into new column Timestamp  
subsetDF$Timestamp <-paste(subsetDF$Date, subsetDF$Time)

#Construct plot2.PNG plot
png(file= "plot2.png", width=480, height=480)

#Plot date/time vs Global_active_power
plot(strptime(subsetDF$Timestamp, "%d/%m/%Y %H:%M:%S"), subsetDF$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

#Close PNG Device
dev.off()
