
library(data.table)
ep<-fread("household_power_consumption.txt",sep=";",header=T,stringsAsFactor=FALSE,colClasses="character")     
ep_plot<-subset(ep,Date=="1/2/2007" | Date=="2/2/2007")
dt<-strptime(paste(ep_plot$Date,ep_plot$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
sub1<-as.numeric(ep_plot$Sub_metering_1)
sub2<-as.numeric(ep_plot$Sub_metering_2)
sub3<-as.numeric(ep_plot$Sub_metering_3)
gap<-as.numeric(ep_plot$Global_active_power)
grp<-as.numeric(ep_plot$Global_reactive_power)
volt<-as.numeric(ep_plot$Voltage)
png(filename = "plot4.png",width=480,height=480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 1, 0, 0))
plot(dt,gap,type='l',ylab="Global Active Power",xlab="")
plot(dt,volt,type="l",ylab="Voltage",xlab="datetime")
plot(dt,sub1, type='l',ylab="Energy sub metering",xlab="",col="black")
lines(dt,sub2,type="l",col="red")
lines(dt,sub3,type="l",col="blue")
legend("topright",c("Sub-metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
plot(dt,grp,type="l",xlab="datetime",ylab="Global Reactive Power")
dev.off()






       