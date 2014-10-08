### Load packages
library(ggplot2)
library(dplyr)

### Bring in Gapminder data
gd_url <- "http://tiny.cc/gapminder"
gDat <- read.delim(file = gd_url)

### Subset the Gapminder data
h_countries <- c("Egypt", "Haiti", "Romania", "Thailand", "Venezuela")
hDat <- gDat %>%
  filter(country %in% h_countries) %>%
  droplevels
hDat %>% str
table(hDat$country)
levels(hDat$country)
nlevels(hDat$country)

# note:
# <droplevels> do the same as 
# droplevels(subset(gDat, country %in% h_countries))


### write.table()

write.table(hDat, "hDat.txt")    
# create a "txt" file, BUT there is row names, variable names are in quotes

# 1st, use no arguments ... 
write.table(hDat, "hDat.csv", sep = ",", row.names = FALSE, quote = FALSE) 
# create a "csv" file, divide columns by ",", delete the "row names" and "quotation marks"

# inspect the levels of country






