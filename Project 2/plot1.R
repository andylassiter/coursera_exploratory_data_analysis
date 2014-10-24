## Coursera - Exploratory Data Analysis
##
## Project 2
## Questions 1 - Have total emissions from PM2.5 decreased in the 
##  United States from 1999 to 2008? Using the base plotting system,
##  make a plot showing the total PM2.5 emission from all sources for 
##  each of the years 1999, 2002, 2005, and 2008.
##
## 10/23/2014
##

# Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get Emissions ~ Year
tNEI <- tapply(NEI$Emissions, NEI$year, sum)

# Plot
png(filename = "question1.png",
    width = 480, height = 480, units = "px")
barplot(tNEI, 
        xlab = "year", 
        ylab = "Total PM2.5 Emitted", 
        main = "PM2.5 vs Year")
dev.off()