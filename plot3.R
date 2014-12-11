electric <-read.table("household_power_consumption.txt", sep=";",colClasses="character")
electric <- electric[2:99996,]
electric$V1 <- as.Date(electric$V1, format ="%d/%m/%Y")
get.rows <- as.Date(electric$V1)==as.Date("2007-02-01") | as.Date(electric$V1)==as.Date("2007-02-02")
electric <- electric[get.rows,]
x=paste(electric$V1,electric$V2)
x <- as.POSIXlt(strptime(x,format="%Y-%m-%d %H:%M:%S"),"GMT")
png(filename = "plot3.png", width = 480, height = 480, 
    units = "px", bg = "transparent", type = "cairo-png")

ggplot(electric)+geom_line(aes(x,as.numeric(electric$V7)),col="black")+geom_line(aes(x,as.numeric(electric$V8)),col="blue")+geom_line(aes(x,as.numeric(electric$V9)),col="red")+labs(y="Energy sub metering")
dev.off()
