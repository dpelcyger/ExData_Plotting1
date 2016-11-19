#Read in data 
inputFile <- "C:/Users/david/Desktop/exploratorydata/household_power_consumption.txt"
DF <- read.csv(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset where date is 1/2/2007 or 2/2/2007
subsetDF <- subset(DF, Date %in% c("1/2/2007","2/2/2007"))

#Convert global_active_power to numeric
subsetDF$Global_active_power <- as.numeric(as.character(subsetDF$Global_active_power))

#Construct plot1.PNG plot
png(file= "plot1.png", width=480, height=480)

#Create histogram for Global_Active_Power
hist(subsetDF$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Close PNG Device
dev.off()
