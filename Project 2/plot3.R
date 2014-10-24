## Coursera - Exploratory Data Analysis
##
## Project 2
## Questions 3 - Of the four types of sources indicated by the type 
##  (point, nonpoint, onroad, nonroad) variable, which of these four 
##  sources have seen decreases in emissions from 1999–2008 for 
##  Baltimore City? Which have seen increases in emissions from 
##  1999–2008? Use the ggplot2 plotting system to make a plot answer
##  this question.
##
## 10/23/2014
##

# Libraries
library(ggplot2)

# Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get Emissions ~ Year for Baltimore
baltimoreNEI <- subset(NEI, fips == 24510)


# Plot
png(filename = "question3.png",
    width = 480, height = 480, units = "px")
p <- ggplot(baltimoreNEI, aes(x = factor(year), y = Emissions)) +
  geom_bar(stat = "identity") +
  facet_grid(. ~ type) +
  labs(x = "year",
       y = "Total PM2.5 Emitted",
       title = "PM2.5 for Baltimore City MD vs Year by Type")
print(p)
dev.off()