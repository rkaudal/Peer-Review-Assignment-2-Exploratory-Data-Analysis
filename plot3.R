## Preparation to data to be read from following URL
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
fname = "Assignment2_data.zip"
download.file(url,fname)

## File unzipped as 
unzip(fname)

## Files are read as
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## plot3
library(ggplot2)

## Only Baltimore, fips == "24510" and divide emission by "type"
Baltimore.NEI <- subset( NEI, fips == "24510")

## Aggregated emissions
Baltimore.Emissions <- aggregate(Baltimore.NEI$Emissions, 
                                 by=list(Baltimore.NEI$year), 
                                 FUN=sum)
names(Baltimore.Emissions)[1] <- "year"

## Emission divided by "type"
png("plot3.png", width = 700, height = 400)
ggplot(Baltimore.NEI, aes(as.factor(year), log(Emissions), fill = type)) +
        x_lab("Year") +
        y_lab("log PM2.5 emissions") +
        gg_title("PM 2.5 emission from 1998 to 2008 per type\n Baltimore City, MD") +
        geom_jitter(alpha = 0.1) +
        geom_boxplot() +
        labs(fill = "type") +
        facet_grid(. ~ type)
dev.off()

