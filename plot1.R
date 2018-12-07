#setup the working directory and unzip the data
getwd()
setwd("~/Desktop/Coursera/Course 4")
list.files(".")
unzip("household_power_consumption.zip")
# calculate required memory to read in the whole dataset
requiredmemory <- 2075259*9*8
requiredmemory
gb <- requiredmemory/2^30
gb

#read in the whole dataset
data <- read.table("household_power_consumption.txt",na.strings = "?",sep = ";",header = TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
head(data)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset data to grep data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(data, Date >= as.Date("2007-2-1")&Date <= as.Date("2007-2-2"))
DateTime <- paste(subdata$Date,subdata$Time)
names(DateTime) <- "DateTime"
#change variables data and time to one variable - DateTime
subdata <- cbind(DateTime,subdata[,3:9])
subdata$DateTime <- as.POSIXct(subdata$DateTime)

#generate plot1.png
plot.new()
hist(subdata$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Acitive Power")
dev.copy(png,"plot1.png",height=480,width=480)
dev.off()
