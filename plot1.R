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

#plot
hist(data$Global_active_power,main ="Global Active Power",xlab="Global Active Power (kilowatts)", ylab = "Frequency",col = "Red")

#save to png
dev.copy(device = png, filename = 'plot1.png', width = 480, height = 480)
dev.off()