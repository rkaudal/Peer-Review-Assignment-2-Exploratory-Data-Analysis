## File sourced from
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
fname = "Assignment2_data.zip"
download.file(url,fname)

## File unzipped as 
unzip(fname)

## Files read as
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plot 6: Comparing the vehicle emissions between Baltimore and Los Angeles
Baltimore.NEI <- subset(NEI, fips == "24510" & type == "ON-ROAD")
Los Angeles.NEI <- subset(NEI, fips == "06037" & type == "ON-ROAD")

## Aggregated emissions
Baltimore.Emissions <- aggregate(Baltimore.NEI$Emissions,
                                 by=list(Baltimore.NEI$year),
                                 FUN=sum)
                                 
Los Angeles.Emissions <- aggregate(LA.NEI$Emissions,
                          by=list(LA.NEI$year),
                          FUN=sum)

Baltimore.Emissions$city = rep("Baltimore",nrow(Baltimore.Emissions))
Los Angeles.Emissions$city = rep("Los Angeles",nrow(Los Angeles.Emissions))

names(Baltimore.Emissions)[1] <- "year"
names(Los Angeles.Emissions)[1] <- "year"

## Single data frame from rbind
Emissions = rbind(Baltimore.Emissions, Los Angeles.Emissions)

## Histogram for the compartive plot
png("plot6.png", width = 700, height = 400)
ggplot(Emissions,
       aes(as.factor(year), x,
           fill = as.factor(year)))+
        x_lab("Year") +
        y_lab("PM2.5 emissions") +
        gg_title("Total vehicle PM 2.5 emission from 1998 to 2008") +
        geom_histogram(stat = "identity") +
        facet_grid(. ~ city) +
        scale_fill_discrete(name = "Year")
dev.off()

