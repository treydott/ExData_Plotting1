## Reads data from file only for dates 2/1/2007 & 2/2/2007
table1 <- read.csv("household_power_consumption.txt", colClasses = "character", sep=";")
table1 <- table1[table1[,1]=="1/2/2007" | table1[,1]=="2/2/2007",]

## Converts to numeric
for (i in 3:ncol(table1)) {
  table1[,i] <- suppressWarnings(as.numeric(table1[,i]))
}

## Converts date & time to POSIXct
table1[,1] <- as.Date(table1[,1], format = "%d/%m/%Y")
date_time <- as.POSIXct(paste(table1$Date,table1$Time))

## Set to graph multiple plots
par(mfcol=c(2,2))
## Plots table 1
plot(table1$Global_active_power ~ date_time, type="l", ylab="Global Active Power", xlab="")

## Plots table 2
with(table1, plot(x=date_time, y=Sub_metering_1, type='l', xlab="", ylab = "Energy sub metering"))
with(table1, points(date_time, Sub_metering_2, type='l', col="Red"))
with(table1, points(date_time, Sub_metering_3, type='l', col="Blue"))
legend("topright", legend=(c('Sub_metering_1','Sub_metering_2','Sub_metering_3')), lty=1, col = c("black","red","blue"), bty = 'n')

## Plots table 3
plot(table1$Voltage ~ date_time, type="l", ylab="Voltage", xlab="datetime")

## Plots table 4
with(table1, plot(Global_reactive_power ~ date_time, type="l", xlab="datetime"))

## Saves as png file
dev.copy(png, file="plot4.png", width=580, height=538)
dev.off()
