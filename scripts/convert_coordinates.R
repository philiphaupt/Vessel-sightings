# correct coordinates

library(sf)
library(sp)
library(tidyverse)

#isolate cahracters
chd = boat_sightings$Lattitude
chm <- strsplit(x = as.character(boat_sightings$Lat_min),
         split =  "[[:punct:]]")
gsub(pattern = "*.", x = boat_sightings$Lat_min)
chm = substr(boat_sightings$Lat_min, 1, 2)
chs = substr(boat_sightings$Lat_min, 3, 2)

# concatenate lat and longs into single columns
boat_sightings %>% mutate(x_ddms == ("Lattitude",""))


data(state)
dd2dms(state.center$x)
sp::char2dms()