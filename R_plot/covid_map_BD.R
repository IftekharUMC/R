# install.packages("maps")
# install.packages("mapdata")
# install.packages("RgoogleMaps")
# install.packages("maptools")


library(maps)
library(mapdata)
library(plyr)
library(graphics)
library(ggplot2)
library(ggmap)
library(RgoogleMaps)

library(stats)
library(reshape2)
library(maptools)

library(dplyr)

library(scales)

corona <- read.csv("bd_covid19_map.csv",header=TRUE,skip=4,sep=",")
dhaka <- subset(gwbang,subset=(DIVISION == "Dhaka"))
dhakadis <- subset(dhaka,subset=(DISTRICT == "Dhaka"))

RgoogleMaps()


