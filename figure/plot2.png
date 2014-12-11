electric <-read.table("household_power_consumption.txt", sep=";",colClasses="character")
electric <- electric[2:99996,]
electric$V1 <- as.Date(electric$V1, format ="%d/%m/%Y")
get.rows <- as.Date(electric$V1)==as.Date("2007-02-01") | as.Date(electric$V1)==as.Date("2007-02-02")
electric <- electric[get.rows,]

png(filename = "plot1.png", width = 480, height = 480, 
    units = "px", bg = "transparent", type = "cairo-png")
hist(as.numeric(electric$V3),col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
