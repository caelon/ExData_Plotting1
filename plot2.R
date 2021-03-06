require("sqldf")
powerSql <- "SELECT * from file where Date = '1/2/2007' OR Date = '2/2/2007'"
powerData <- read.csv.sql("./household_power_consumption.txt",sql=powerSql, sep=";")
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
powerData$DateTime <- as.POSIXct(paste(powerData$Date, powerData$Time), format="%Y-%m-%d %H:%M:%S")
powerData <- powerData[,c(1,2,10,3,4,5,6,7,8,9)]
png(file="plot2.png")
plot(powerData$Global_active_power~powerData$DateTime, type="l",main="", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()