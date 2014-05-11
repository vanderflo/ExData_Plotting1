plot4 <- function(){

consum=read.table('household_power_consumption.txt',sep=';',header=T)
consumtrim=consum[which(consum$Date=='1/2/2007' | consum$Date=='2/2/2007' ),]
consumtrim$Date=as.Date(consumtrim$Date,format="%d/%m/%Y")
consumtrim$Global_active_power=as.numeric(as.character(consumtrim$Global_active_power))
consumtrim$Sub_metering_1=as.numeric(as.character(consumtrim$Sub_metering_1))
consumtrim$Sub_metering_2=as.numeric(as.character(consumtrim$Sub_metering_2))
consumtrim$Sub_metering_3=as.numeric(as.character(consumtrim$Sub_metering_3))
consumtrim$Voltage=as.numeric(as.character(consumtrim$Voltage))
consumtrim$Global_reactive_power=as.numeric(as.character(consumtrim$Global_reactive_power))  
consumtrim$DateHour=paste0(consumtrim$Time," ",consumtrim$Date,collapse=NULL,sep="")
consumtrim$DateHour=as.POSIXct(strptime(consumtrim$DateHour,"%H:%M:%S %Y-%m-%d"))  
png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

plot(consumtrim$DateHour,consumtrim$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(consumtrim$DateHour,consumtrim$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(consumtrim$DateHour,consumtrim$Sub_metering_1,type="l",ylim=yrange,xlab="",ylab="Energy sub metering")
par(new=T)
plot(consumtrim$DateHour,consumtrim$Sub_metering_2,type="l",ylim=yrange,col="red",axes=F,xlab="",ylab="")
par(new=T)
plot(consumtrim$DateHour,consumtrim$Sub_metering_3,type="l",ylim=yrange,col="blue",axes=F,xlab="",ylab="")
legend("topright", lty=1, col = c("black", "blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(consumtrim$DateHour,consumtrim$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
}