#load necessary libraries

library(data.table)
library(dplyr)

#download electric data

if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileURL,destfile = "./data/power.zip",method = "curl")

unzip("./data/power.zip") #unzip file

list.files() #find file name

#create function for loading data

power_data <- function () {
  file = "household_power_consumption.txt"
  
  #read data into R
  
  power <- fread(file, na.strings = "?") 
  
  #convert date and time variables to Date/Time class
  
  power$Date <- as.Date(power$Date, "%d/%m/%Y")
  
  power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
  
  #subset the dates
  
  power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")
  
  return(power)
}

#make first plot

png("plot1.png", width=400, height=400)

active <- as.numeric(power$Global_active_power)

hist(active, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "red")

dev.off()

#make second plot

png("plot1.png", width=400, height=400)

dev.off()

#make third plot

png("plot1.png", width=400, height=400)

dev.off()

#make fourth plot

png("plot1.png", width=400, height=400)

dev.off()