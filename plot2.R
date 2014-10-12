# Download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("exdata1.zip")){
     download.file(fileUrl, destfile="exdata1.zip")
}
dateDownloaded <- date()
dateDownloaded

# Unzip the data
if(!file.exists("household_power_consumption.txt")){
     unzip("exdata1.zip")
}

# Creat vector with variables names
vn <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
       "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Read data only for 2007-02-01 and 2007-02-02
exdata2 = read.table("household_power_consumption.txt",sep=";",header=T,
                     skip=66636, nrows=2880,col.names=vn,
                     colClasses=c('character','character',rep('numeric',7)))

# convert the Date and Time variables
datetime <- as.POSIXct(paste(exdata2[,1], exdata2[,2]), format="%d/%m/%Y %H:%M:%S")


#Plot 2
png("plot2.png", width=480, height=480)
plot(datetime,exdata2[,3],type='l',
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()


