## Coursera - Exploratory Data Analysis
##
## Project 2
## Questions 5 - How have emissions from motor vehicle sources 
##  changed from 1999–2008 in Baltimore City?
##
## 10/23/2014
##

# Libraries
library(ggplot2)

# Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get Emissions ~ Year for OnRoad types in Baltimore
baltimoreOnroadNEI <- subset(NEI,
                             fips == 24510 & type == "ON-ROAD")


# Plot
png(filename = "question5.png",
    width = 480, height = 480, units = "px")
p <- ggplot(baltimoreOnroadNEI, aes(x = factor(year), y = Emissions)) +
  geom_bar(stat = "identity") +
  labs(x = "year",
       y = "Total PM2.5 Emitted",
       title = "PM2.5 in Baltimore City MD vs Year for Motor Sources")
print(p)
dev.off()