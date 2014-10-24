## Coursera - Exploratory Data Analysis
##
## Project 2
## Questions 4 - Across the United States, how have emissions from
##  coal combustion-related sources changed from 1999–2008?
##
## 10/23/2014
##

# Libraries
library(ggplot2)

# Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get Coal SCC
coalSCC <- subset(SCC,grepl("*Coal*",EI.Sector))

# Get NEI for Coal
coalNEI <- subset(NEI,SCC %in% coalSCC$SCC)

# Plot
png(filename = "question4.png",
    width = 480, height = 480, units = "px")
p <- ggplot(coalNEI, aes(x = factor(year), y = Emissions)) +
  geom_bar(stat = "identity") +
  labs(x = "year",
       y = "Total PM2.5 Emitted",
       title = "PM2.5 from Coal vs Year")
print(p)
dev.off()