setwd("P:/Coursera/exploratorydataanlysis/")
Sys.setlocale(category = "LC_ALL", locale = "english")

#reads in data
power_data<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=FALSE, na.strings = "?",skip = 66637, nrow = 2880)

#names variabkes
header<-names(read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?",nrow = 1))
names(power_data)<-header
power_data$DateTime <- strptime(paste(power_data$Date, power_data$Time), format="%d/%m/%Y %H:%M:%S")

#checks if load is correct
table(power_data$Date)

#attach dataset for plotting
attach(power_data)

##PLOT1
hist(Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png,'plot1.png')
dev.off()

