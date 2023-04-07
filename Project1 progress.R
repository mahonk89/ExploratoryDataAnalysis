rm(electric)
#function to create data frame of required dates in global
electric<-function(nread=1,nskip=0){
  colclass<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  hhpc<<-read.table("household_power_consumption.txt",nrow=nread,skip=nskip,sep=";",header=T,
                    na.strings = c("?","","NA"),colClasses = colclass,col.names = colheaders)
  
  #sapply(hhpc[,1],as.Date,format="%d/%m/%Y")

  
  return("Your new data frame named 'hhpc' has been created")
  
}

electric(1) #run for first line of data to get colnames
columnheaders<-colnames(hhpc)
electric(2879,66636) #creates data frame for required dates
hhpc$Date<-as.Date(hhpc$Date,"%d/%m/%Y") #formats col1 to date
class(hhpc$Date) #check

hhpc$DateTime<-paste(hhpc$Date,hhpc$Time) #adds new column combining date&time
class(hhpc$DateTime) #check // character // POSIXct POSIXt
hhpc$DateTime<-as.POSIXct(hhpc$DateTime)
hhpc[2,]

hhpc$DateTime[5]
hhpc$DateTime[6]
?hist
?dev.copy
?dev.copy2eps
?legend

par(mfrow=c(1,2))

# plot1.png / plot1.R - Global Active Power
with(hhpc,hist(hhpc$Global_active_power,col = "red"
               ,xlab = "Global Active Power (kilowatts)"
               ,main="Global Active Power"))
dev.copy(png,file="Plot1.png",width=480,height=480) 
# width/height forces file size to w*h pixels
dev.off

with(hhpc,hist(hhpc$Global_active_power,col = "red"
               ,xlab = "Global Active Power (kilowatts)"
               ,main="Global Active Power"))
dev.copy(png,file="Plot1-test.png",width=600,height=600)
dev.off()


# plot2 - Global Active power
with(hhpc,plot(hhpc$DateTime,hhpc$Global_active_power,type = "l"
               ,ylab="Global Active Power (kilowatts)"))
#type="l" makes it so the plot shows a continuous line, not points
dev.copy(png,file="Plot2.png",width=480,height=480)
dev.off()

# plot3 - Energy Sub Metering (1,2,3)
with(hhpc,plot(hhpc$DateTime,hhpc$Sub_metering_1,type = "l"
               ,ylab="Energy Sub Metering",xlab="",col="black"))
lines(hhpc$DateTime,hhpc$Sub_metering_2,col="red")
lines(hhpc$DateTime,hhpc$Sub_metering_3,col="blue")
legend("topright",lty=rep(1,3),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"))
# I had trouble with the ordering of arguments for legend, lty first helped I guess.
dev.copy(png,file="Plot3.png",width=480,height=480)
dev.off()



# plot4 - Global Active Power / Voltage / Energry Sub Metering / Global Reactive

  # copy from datadir "Plot4.R"
datadir<-"C:/Users/Kevin/Documents/R/Projects/ExploratoryDataAnalysis"

par(mfrow=c(2,2))
with(hhpc,{
  plot(hhpc$DateTime,hhpc$Global_active_power,type="l",ylab="Global Active Power",xlab="")
  plot(hhpc$DateTime,hhpc$Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(hhpc$DateTime,hhpc$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
  lines(hhpc$DateTime,hhpc$Sub_metering_2,col="red")
  lines(hhpc$DateTime,hhpc$Sub_metering_3,col="blue")
  legend("topright",lty=rep(1,3),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),bty = "n")
  plot(hhpc$DateTime,hhpc$Global_reactive_power,type="l",xlab="datetime")
})
dev.copy(png,file="Plot4.png",width=480,height=480)
dev.off()
