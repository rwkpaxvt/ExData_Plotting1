
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

#Plot global active power histogram
hist(datasub$Global_active_power, main = paste("Global Active Power"), xlab=
       "Global Active Power (kilowatts)",ylab = "Frequency", col="red")

#Save out plot as png
dev.copy(png, 'plot1.png')
dev.off()
