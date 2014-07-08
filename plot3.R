## Reading the data

## 2007-02-01 starts from line 66638 . So we have to skip the first 66637 lines.The final entry of date 2007-02-02 ends at line 69517. So there are (69517-66637=)2880 rows to be read.
household <- read.table("household_power_consumption.txt",skip=66637,nrow=2880,stringsAsFactors=FALSE,sep=";",header=FALSE)

## The column names are added to the dataframe separately
str="Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3"
names(household)=unlist(strsplit(str,";"))



## Actual plotting begins here

## Create a date-time sequence. The data begins from 2007-02-01 00:00:00 and ends at 2007-02-02 23:59:00. There are 24(hours)*60(minutes)*2(2 days) entries
x=seq(as.POSIXct("2007-02-01 00:00:00"),by="min",length.out=24*60*2)

## Launching the png device with given height and width
png(filename="plot3.png",width=480,height=480,units="px")

## Create the 3 plots with requried colors and empty xlab & ylab on the same plot.
with(household,plot(x,household$Sub_metering_1,type="l",col="black",xlab="",ylab=""))
with(household,lines(x,household$Sub_metering_2,type="l",col="red",xlab="",ylab=""))
with(household,lines(x,household$Sub_metering_3,type="l",col="blue",xlab="",ylab=""))

## Add the correct xlab and ylab
title(main="",xlab="",ylab="Energy sub metering")

## Add the legend
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)

## Closing the device
dev.off()