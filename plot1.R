## Reads data from file only for dates 2/1/2007 & 2/2/2007
table1 <- read.csv("household_power_consumption.txt", colClasses = "character", sep=";")
table1 <- table1[table1[,1]=="1/2/2007" | table1[,1]=="2/2/2007",]

## Converts to numeric
for (i in 3:ncol(table1)) {
  table1[,i] <- suppressWarnings(as.numeric(table1[,i]))
}

## Plots histogram
hist(table1$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

## Saves as png file
dev.copy(png, file="plot1.png", width=580, height=538)
dev.off()
