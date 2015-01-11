##uncomment next line if you want to see weekdays in English
##Sys.setlocale("LC_ALL","English")

##load data
filePath <- "household_power_consumption.txt"
if (!file.exists(filePath)) stop("Error: file doesn't exist")
data <- read.table(filePath, sep=";",header = T, na.strings = '?',
                   colClasses = c(rep("character",2),rep("numeric",7)) )

# Get requirement data
sdata <- subset(data, data$Date == "1/2/2007" | 
                  data$Date == "2/2/2007")

# Create new variable DateTime for producing plots
sdata$DateTime <- paste(sdata$Date, sdata$Time)
sdata$DateTime <- strptime(sdata$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Open graphic device (png)
png(filename = "plot2.png", width = 480, height = 480)

# Produce plot of Global_active_power over time
plot(sdata$DateTime, as.numeric(sdata$Global_active_power),
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Close graphic device
dev.off()