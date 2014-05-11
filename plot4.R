setwd("/Users/virsingh/Downloads")
power<-read.table("household_power_consumption.txt", sep=";",header=TRUE,na.string="?")
power$Date_formatted<-as.Date(power$Date,"%d/%m/%Y")
power_range<-subset(power,power$Date_formatted>=as.Date("2007-02-01") & power$Date_formatted<=as.Date("2007-02-02"))
power_range$Date_Time<-strptime(paste(power_range$Date,power_range$Time),"%d/%m/%Y %H:%M:%S")
par(mar=c(10,8,2,2))
par(mfrow=c(2,2))
par(cex=.64)
with(power_range, {
  plot(Date_Time,Global_active_power,type='l',ylab="Global Active Power",xlab="")
  plot(Date_Time,Voltage,type='l')
{
    plot(Date_Time,Sub_metering_1,type='l',ylab="Energy Sub metering",xlab="" )
    lines(power_range$Date_Time,power_range$Sub_metering_2,col="red")
    lines(power_range$Date_Time,power_range$Sub_metering_3,col="blue")
    legend("topright",lty=1,bty="n",text.font=.5,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  }
plot(Date_Time,Global_reactive_power,type='l')
})
dev.copy(png,"plot4.png",height=480,width=480)
dev.off()


