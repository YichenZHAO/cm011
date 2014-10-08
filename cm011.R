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

### inspect the levels of country
levels(hDat$country)

## reorder country according to one of the summary stats we have played with
iDat <- hDat %>%
  mutate(country = reorder(country, lifeExp, max))
data.frame(levels(hDat$country), levels(iDat$country))

## write to file with write.table()
write.table(iDat, "hDat.csv", sep = ",", row.names = FALSE, quote = FALSE) 
# delete the R object from the workspace
rm(iDat)
# check if iDat is still there
iDat
# re-import in csv file
iDat <- read.csv("hDat.csv")

levels(iDat$country)

#reorder the country factor
iDat <- hDat %>%
  mutate(country = reorder(country, lifeExp, max))
data.frame(levels(hDat$country), levels(iDat$country))

# write to file with saveRDS()
saveRDS(iDat, "iDat.rds")
# delete the R object from the workspace
rm(iDat)
# check if iDat is still there
iDat
# re-import in RDS file
iDat <- readRDS("iDat.rds")
str(iDat)
levels(iDat$country)

## write to file with dput()
dput(iDat,"iDat-dput.txt")
str(iDat)
levels(iDat$country)

