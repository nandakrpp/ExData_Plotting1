# plot3.R
# 
# Extracts data only from dates of interest for creating a 3-line plot of sub
# metering data in relation to date and time of usages.
# Plots each dataset i.e. Sub_metering_1, Sub_metering_2 and Sub_metering_3 data 
# using black, red and blue line colours on y-axis;
# scratch dates of metering on the x-axis; 
# adds legend at the top right corner;
# and saves the plot in a png file.
# 
# TODO:
#         + submit
# 
# See further details in assignment page: https://class.coursera.org/exdata-011/human_grading/view/courses/973505/assessments/3/submissions
#
# Modified from plot1.R, plot2.R and plot3_0_4.R
# Last modified 2015-02-06
# by Nanda Khaorapapong | nanda.krpp@gmail.com


## Read all data as numeric into a data frame with column headers and 
## without missing values
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
               na.strings="?")


## Extract data only from 2 dates of interest W/O date conversion
df <- df[df$Date %in% c("1/2/2007","2/2/2007"), ] 


## Convert date and time variables into character variables of 
## "2007-02-01 00:00:00 GMT" format and contatenate them in a vector
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


## Open png graphic device
png("plot3.png", height=480, width=480) # This function saves but not plots the plot on the Plots window


## Plot data from 3 Sub Meterings on y-axis and datetime of usages on x-asix
## Start the first metering data using default colour i.e. black with 
## y-axis name defined. Then add the second and third metering data using a red 
## and blue line colours respectively.
# plot(datetime, df$Sub_metering_1, type="l", ylab="Energy sub metering") 
# ^ this automatically add x-axis lable
plot(datetime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, df$Sub_metering_2, type="l", col="red") 
lines(datetime, df$Sub_metering_3, type="l", col="blue") 
## Add legend at the top right corner with default line type and box's line; 
## with line width of 2 defined
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close png graphic device
dev.off()