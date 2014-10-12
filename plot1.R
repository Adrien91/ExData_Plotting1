
#Read data (separated by ";" and assigning class to columns)
hpc<-read.csv("household_power_consumption.txt",na.strings="?", header=TRUE, 
              sep=";", colClasses=c("character","character",rep("numeric",7)))

#Transforming the Date into Date format
hpc$Date<-as.Date(hpc$Date, format="%d/%m/%Y")

#Subsetting between "2007-02-01" and "2007-02-02"
hpc_jan<-hpc[hpc$Date>="2007-02-01" & hpc$Date<="2007-02-02",]


#Create a new variable that is the concatenation of the Date and the time
hpc_jan$time_date<-paste(hpc_jan$Date,hpc_jan$Time, sep=", ")
#Transforming the variable into Datetime format
hpc_jan$time_date<-strptime(hpc_jan$time_date, "%d/%m/%Y, %H:%M:%S")


#Plot 1
#Start the png device
png(file="plot1.png")

#Histogram of Global Active Power
hist(hpc_jan$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off() #Close the png device
