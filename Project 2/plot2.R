## Coursera - Exploratory Data Analysis
##
## Project 2
## Questions 2 - Have total emissions from PM2.5 decreased in the
##  Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use
##  the base plotting system to make a plot answering this question.
##
## 10/23/2014
##

# Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get Emissions ~ Year for Baltimore
baltimoreInd <- (NEI$fips == 24510)
tNEI <- tapply(NEI$Emissions[baltimoreInd], NEI$year[baltimoreInd], sum)


# Plot
png(filename = "question2.png",
    width = 480, height = 480, units = "px")
barplot(tNEI, 
        xlab = "year", 
        ylab = "Total PM2.5 Emitted", 
        main = "PM2.5 for Baltimore City MD vs Year")
dev.off()