## Data to be sourced from
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
fname = "Assignment2_data.zip"
download.file(url,fname)

## File unzipped as
unzip(fname)

## Files read as 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## plot 5: How is the motor emissions changed in Baltimore city over the time span on which the data are collected?
Baltimore.NEI <- subset(NEI, fips == "24510" & type == "ON-ROAD")

## Aggregated emissions
Baltimore.Emissions.motor <- aggregate(Baltimore.NEI$Emissions, 
                                       by=list(Baltimore.NEI$year), 
                                       FUN=sum)
names(Baltimore.Emissions.motor)[1] <- "year"

# Histogram_plot
png("plot5.png", width = 700, height = 400)
ggplot(Baltimore.Emissions.motor,
       aes(as.factor(year), x,
           label = round(x,digits = 0),
           fill = as.factor(year)))+
        x_lab("Year") +
        y_lab("PM2.5 emissions") +
        gg_title("Total vehicle PM 2.5 emission from 1998 to 2008\nBaltimore, MD") +
        geom_histogram(stat = "identity") +
        geom_text(vjust = 2) +
        scale_fill_discrete(name = "Year")
dev.off()
