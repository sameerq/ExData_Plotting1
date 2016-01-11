#Data has been downloaded and unzipped into working directory as a .txt file
#This stores the data and takes the target dates we want
mydata <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
mydata$Date = as.Date(mydata$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
mydata = mydata[mydata$Date >= startDate & mydata$Date <= endDate, ]

#Now we make a graph out of the data
png(filename="plot1.png", width=480, height=480)
globalActivePower <- as.numeric(mydata$Global_active_power)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
