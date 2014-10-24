## Coursera - Exploratory Data Analysis
##
## Project 2
## Questions 6 - Compare emissions from motor vehicle sources in 
##  Baltimore City with emissions from motor vehicle sources in 
##  Los Angeles County, California (fips == "06037"). Which city has
##  seen greater changes over time in motor vehicle emissions?
##
## 10/23/2014
##

# Libraries
library(ggplot2)

# Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get Emissions ~ Year for OnRoad types in Baltimore and Los Angeles
baltimoreAndLosAngelesOnroadNEI <- subset(NEI,
                                   (fips == "24510" | fips == "06037") 
                                    & type == "ON-ROAD")

baltimoreAndLosAngelesOnroadNEI$fips <- as.factor(
  baltimoreAndLosAngelesOnroadNEI$fips)
levels(baltimoreAndLosAngelesOnroadNEI$fips) <- c("Los Angeles", "Baltimore")


# Plot
png(filename = "question6.png",
    width = 480, height = 480, units = "px")
p <- ggplot(baltimoreAndLosAngelesOnroadNEI, aes(x = factor(year), y = Emissions)) +
  geom_bar(stat = "identity") +
  facet_grid(. ~ fips) +
  labs(x = "year",
       y = "Total PM2.5 Emitted",
       title = "PM2.5 vs Year for Motor Sources in Baltimore and Los Angeles")
print(p)
dev.off()