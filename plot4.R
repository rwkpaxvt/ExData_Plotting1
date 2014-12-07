#Read in data
data = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#Subset data
data[,1] = as.character(data[,1])
dataind1 = data[,1] == "1/2/2007"
dataind2 = data[,1] == "2/2/2007"
datasub1 = data[dataind1,]
datasub2 = data[dataind2,]
datasub = rbind(datasub1, datasub2)

#Clean up
rm(dataind1,dataind2,datasub1,datasub2,data)

#Convert date column to date format
datasub$DateTime = paste(datasub$Date, datasub$Time, sep=" ")
datasub$DateTime = strptime(datasub$DateTime, format="%d/%m/%Y %H:%M:%S")

#Set number of plots to print out
par(mfcol=c(2,2))

#Plot global active power histogram from plot 1
hist(datasub$Global_active_power, main = paste("Global Active Power"), xlab=
       "Global Active Power (kilowatts)",ylab = "Frequency", col="red")

#Plot line graphs from plot 3
plot(datasub$DateTime, datasub$Sub_metering_1, type="l", xlab="", 
     ylab="Energy Sub Metering")

lines(datasub$DateTime, datasub$Sub_metering_2, type="l", col='red')

lines(datasub$DateTime, datasub$Sub_metering_3, type="l", col='blue')

#Plot line graph for voltage
plot(datasub$DateTime, datasub$Voltage, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

#Plot line grap from plot 4
plot(datasub$DateTime, datasub$Global_reactive_power, type="l", xlab="", 
     ylab="Energy Sub Metering")

#Save out plot as png
dev.copy(png, 'plot4.png')
dev.off()
