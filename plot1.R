###
library(data.table)
ep<-fread("household_power_consumption.txt",sep=";",header=T,stringsAsFactor=FALSE,colClasses="character")     
ep_plot<-subset(ep,Date=="1/2/2007" | Date=="2/2/2007")
bks<-seq(0,8,0.5)
png(filename = "plot1.png",width=480,height=480)
hist(as.numeric(ep_plot$Global_active_power),bks,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off() 