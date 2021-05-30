 ## File downloaded from the following url
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
fname = "Assignment2_data.zip"
download.file(url, fname)
##  Files unzipped with following line of code
unzip(fname)
## Files be read from 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Creating plot1
##  Total PM2.5 emission from 1999 to 2008
Emissions <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
names(Emissions)[1] <- "Year"

## plot to be depicted in year
png("plot1.png")
barplot(Emissions$x,
        Emissions$Year,
        ylab = "PM2.5",
        xlab = "Year",
        names.arg = Emissions$Year,
        main = "Total PM2.5 emission"
)
dev.off()
