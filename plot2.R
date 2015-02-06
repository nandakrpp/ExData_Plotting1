# plot2.R
# 
# Extracts data only from dates of interest, creates a line type plot of Global_
# active_power unit in relation to date and time of usages, and saves in a png 
# file.
# See further details in assignment page: https://class.coursera.org/exdata-011/human_grading/view/courses/973505/assessments/3/submissions
#
# Modified from plot1.R and plot2_1_1.R
# Last modified 2015-02-06
# by Nanda Khaorapapong | nanda.krpp@gmail.com


## Read all data as numeric into a data frame with column headers and 
##  without missing values
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
               na.strings="?")


## Extract data only from 2 dates of interest W/O date conversion
df <- df[df$Date %in% c("1/2/2007","2/2/2007"), ] 


## Convert date and time variables into character variables in 
## "2007-02-01 00:00:00 GMT" format and contatenate them in a vector
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


## Open png graphic device
png("plot2.png", height=480, width=480) # This function saves but not plots the plot on the Plots window


## Plot data from Global_active_power on x-asix w/ label suppressed and datetime 
## on y-axis with its label
plot(datetime, df$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)") 


## Close png graphic device
dev.off()