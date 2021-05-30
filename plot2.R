## Preparing for data to load from
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
fname = "Assignment2_data.zip"
download.file(url,fname)

## File unzipped as
unzip(fname)

## Files are to be read as 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## plot2
## Baltimore only , fips == "24510"
# Aggregate emissions
Baltimore.NEI <- subset(NEI, fips == "24510")
Baltimore.Emissions <- aggregate(Baltimore.NEI$Emissions, 
                                 by=list(Baltimore.NEI$year), 
                                 FUN=sum)
names(Baltimore.Emissions)[1] <- "year"

# plot emission by year for Baltimore
png("plot2.png")
barplot(Baltimore.Emissions$x,
        Baltimore.Emissions$year,
        ylab = "PM2.5",
        xlab = "Years",
        names.arg = Baltimore.Emissions$year,
        main = "Total PM2.5 emission in Baltimore City, Maryland")
dev.off()
