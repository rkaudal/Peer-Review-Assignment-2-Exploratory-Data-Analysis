# Peer-Review-Assignment-2-Exploratory-Data-Analysis
Mission statement of the assignemnt: Explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. 
Background: Fine particulate matter (PM2.5), the hazardous air pollutant detrimental to human health, is monitored by United States, Environmental Protection Agencey (EPA). It keesp track of the emissions of the pollutant in the atmosphere. EPA releases database on emissions of PM2.5 which is referred as Natioanl Emissions Inventory(NEI) as linked in http://www.epa.gov/ttn/chief/eiinformation.html
The data is collected as the emissions (in tons) from particualr source in the entire year (the data we will be using are for years: 1999, 2002, 2005, 2008). The breath of the assignmnet encompasses 1. Data and its origin 2. queries that data addresses 3. communicate the results

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 1. Data and its origin
Data size is 29 MB. It is in the zip file with two units: The following array of data provides glimpses on how the first rows of the data looks like.
  no.     fips  SCC   Pollutant Emissions    type            year
 ##4    09001 10100401  PM25-PRI          15.714 POINT      1999
 ##8    09001 10100404  PM25-PRI          234.178 POINT     1999
 ##12   09001 10100501  PM25-PRI           0.128 POINT      1999
 ##16   09001 10200401  PM25-PRI            2.036 POINT     1999
 ##20   09001 10200504  PM25-PRI            0.388 POINT     1999
 ##24   09001 10200602  PM25-PRI            1.490 POINT     1999
 Terms definition
fips: A five-digit number (represented as a string) indicating the U.S. county
SCC: The name of the source as indicated by a digit string (see source code classification table)
Pollutant: A string indicating the pollutant
Emissions: Amount of PM2.5 emitted, in tons
type: The type of source (point, non-point, on-road, or non-road)
year: The year of emissions recorded

How to use Source Classification Code Table (Source_Classification_Code.rds)?
Via this table, a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source is done. The categories of sources are done in a few different ways from more general to more specific and freedom resides on user on choosing and expolring that he/she thinks to be useful. For instance, source “10100101” is categorized as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

The reading of each of the two files is done through readRDS() function in R.  The following code provides an expample of doing so as long as the current file is in the current working directory (This can be checked by calling dir() and see if those files are in the listing) 
This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 2. Queries that data addresses
The following questions and tasks are to be included in the exploratory analysis through plots.  R should be used to make the plot unless specified otherwise.
1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510"|}fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 3. Communicate the results
Each plot requires to construct the plot and save it to a PNG file.
Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file. Only include the code for a single plot (i.e. plot1.R should only include code for producing plot1.png)
Upload the PNG file on the Assignment submission page
Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
