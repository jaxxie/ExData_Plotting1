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

#change the submetering to numeric
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))


#plot
par(mar = c(2.5,4.5,2,2.5))
plot(data$DateTime, data$Sub_metering_1, type = "l",xlab="",ylab="Energy Sub metering",col="Black")
lines(data$DateTime, data$Sub_metering_2, type = "l",col="Red")
lines(data$DateTime, data$Sub_metering_3, type = "l",col="Blue")

#add legend
par(mar = c(1,1,1,1))
par(cex=0.6)
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.width=42000,lty = 1)

#save to png
dev.copy(device = png, filename = 'plot3.png', width = 480, height = 480)
dev.off()
