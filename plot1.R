## Reading the data

## 2007-02-01 starts from line 66638 . So we have to skip the first 66637 lines.The final entry of date 2007-02-02 ends at line 69517. So there are (69517-66637=)2880 rows to be read.
household <- read.table("household_power_consumption.txt",skip=66637,nrow=2880,stringsAsFactors=FALSE,sep=";",header=FALSE)

## The column names are added to the dataframe separately
str="Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3"
names(household)=unlist(strsplit(str,";"))


## Actual plotting begins here

## Launching the png device with given height and width
png(filename="plot1.png",width=480,height=480,units="px")

## Drawing the histogram with the required options
hist(household$Global_active_power,col="RED",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")

## Closing the device
dev.off()