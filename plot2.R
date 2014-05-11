plot2 <- function(){
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

png(filename = "plot2.png",width = 480, height = 480, units = "px")
  
plot(consumtrim$DateHour,consumtrim$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
dev.off()  
}