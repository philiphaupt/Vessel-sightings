# correct coordinates

library(sf)
library(sp)
library(tidyverse)
#library(stringr)

# isolate characters
# Decimal_degrees
chd = as.character(boat_sightings$Lattitude)

#temporary storage for minutes and decimal seconds
ddm_tmp <- stringr::str_split_fixed(string = as.character(boat_sightings$Lat_min),
                         pattern =  "[[:punct:]]",
                         n = 2)
#convert each its own vector
chm = ddm_tmp[,1]
chs = ddm_tmp[,2]

# concatenate lat and longs into single columns
boat_sightings %>% mutate(x_ddms == char2dms("Lattitude",""))


data(state)
dd2dms(state.center$x)
sp::char2dms()