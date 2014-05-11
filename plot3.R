require("sqldf")
powerSql <- "SELECT * from file where Date = '1/2/2007' OR Date = '2/2/2007'"
powerData <- read.csv.sql("./household_power_consumption.txt",sql=powerSql, sep=";")
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
powerData$DateTime <- as.POSIXct(paste(powerData$Date, powerData$Time), format="%Y-%m-%d %H:%M:%S")
powerData <- powerData[,c(1,2,10,3,4,5,6,7,8,9)]
png(file="plot3.png")
plot(powerData$Global_active_power~powerData$DateTime, type="l",main="", ylab="Energy sub metering", xlab="",ylim=c(0,30))
lines(x=powerData$DateTime,y=powerData$Sub_metering_2,type="l",col="red")
lines(x=powerData$DateTime,y=powerData$Sub_metering_3,type="l",col="blue")
legend("topright",col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()