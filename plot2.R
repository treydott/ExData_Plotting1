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

## Plots table
plot(table1$Global_active_power ~ date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saves as png file
dev.copy(png, file="plot2.png", width=580, height=538)
dev.off()
