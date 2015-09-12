###
library(data.table)
ep<-fread("household_power_consumption.txt",sep=";",header=T,stringsAsFactor=FALSE,colClasses="character")     
ep_plot<-subset(ep,Date=="1/2/2007" | Date=="2/2/2007")
ep_plot$Global_active_power<-as.numeric(ep_plot$Global_active_power)
dt<-strptime(paste(ep_plot$Date,ep_plot$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png",width=480,height=480)
plot(dt,ep_plot$Global_active_power,type='l',ylab="Global Active Power(kilowatt)",xlab="")
dev.off()

