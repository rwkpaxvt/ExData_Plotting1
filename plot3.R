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

#Plot line graphs
plot(datasub$DateTime, datasub$Sub_metering_1, type="l", xlab="", 
     ylab="Energy Sub Metering")

lines(datasub$DateTime, datasub$Sub_metering_2, type="l", col='red')

lines(datasub$DateTime, datasub$Sub_metering_3, type="l", col='blue')

#Save out plot as png
dev.copy(png, 'plot3.png')
dev.off()
