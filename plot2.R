#Data has been downloaded and unzipped into working directory as a .txt file
#This stores the data and takes the target dates we want
mydata <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
mydata$timestamp <- strptime(paste(mydata$Date, mydata$Time),format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate <- strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate <- strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
mydata <- mydata[mydata$timestamp >= startDate & mydata$timestamp <= endDate, ]

#Now we make a graph out of the data
png(filename="plot2.png", width=480, height=480)
plot(mydata$timestamp, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
