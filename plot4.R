electric <-read.table("household_power_consumption.txt", sep=";",colClasses="character")
electric <- electric[2:99996,]
electric$V1 <- as.Date(electric$V1, format ="%d/%m/%Y")
get.rows <- as.Date(electric$V1)==as.Date("2007-02-01") | as.Date(electric$V1)==as.Date("2007-02-02")
electric <- electric[get.rows,]

x=paste(electric$V1,electric$V2)
x <- as.POSIXlt(strptime(x,format="%Y-%m-%d %H:%M:%S"),"GMT")

png(filename = "plot4.png", width = 480, height = 480, 
    units = "px", bg = "transparent", type = "cairo-png")
par(mfrow=c(2,2))
plot(x,as.numeric(electric$V3),ylab="Global Active Power (kilowatts)",xlab="",type="l")
plot(x,as.numeric(electric$V5),ylab="Voltage",xlab="datetime",type="l")
plot(x,as.numeric(electric$V4),ylab="Global Reactive Power",xlab="datetime",type="l")
