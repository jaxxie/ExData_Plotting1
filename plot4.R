#set the working directory.
#PLEASE SET TO YOUR WORKING DIRECTORY FOR THIS TO WORK
setwd("/Users/kindaixin/Dropbox-work/Dropbox/coursera/04 Exploratory Data Analysis/Project 1/ExData_Plotting1")

#Unzip the file
unzip("exdata-data-household_power_consumption.zip")

#Read the data
data_all <- read.table("household_power_consumption.txt",head=TRUE,sep=";")

#Convert column 'Date' and 'Time' to R Time object
datetime <- paste(data_all$Date, data_all$Time)
datetime <-strptime(datetime, "%d/%m/%Y %H:%M:%S")

#Add the Datetime vector to the original data
data_all$DateTime <- datetime

#subset the data
data <- subset(data_all,DateTime >= '2007-02-01' & DateTime < '2007-02-03')

#change the global active power to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#change the global reactive power to numeric
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

#change the voltage to number
data$Voltage <- as.numeric(as.character(data$Voltage))

#change the submetering to numeric
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))


#set display to be 2 by 2 plot
par(mfrow = c(2,2)) 
par(mar = c(4.5,4.5,2,2))

#Plot top left
plot(data$DateTime, data$Global_active_power, type = "l",xlab="",ylab="Global Active Power")

#Plot top right
plot(data$DateTime, data$Voltage, type = "l",xlab="datetime",ylab="Voltage",col="Black")

#Plot bottom left
plot(data$DateTime, data$Sub_metering_1, type = "l",xlab="",ylab="Energy Sub metering",col="Black")
lines(data$DateTime, data$Sub_metering_2, type = "l",col="Red")
lines(data$DateTime, data$Sub_metering_3, type = "l",col="Blue")
par(cex=0.6) #change the font size to keep legend small
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",text.width=80000,lty = 1)


#Plot bottom right
par(cex=0.8) #change the font size
plot(data$DateTime, data$Global_reactive_power, type = "l",xlab="datetime",ylab="Global_reactive_power",col="Black")


#save to png
dev.copy(device = png, filename = 'plot4.png', width = 480, height = 480)
dev.off()

