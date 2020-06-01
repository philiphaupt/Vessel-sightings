# correct coordinates

library(sf)
library(sp)
library(tidyverse)
#library(stringr)

# aim convert and concatenate coordinates to decimal degrees: from Deciomal degrees + decimal minutes to decimal degrees
# method: split minutes decimal seconds into two columns, then multiply the decimal seconds with 60 and concatenate three coliumns to get DMS Then use sp char2DMS to get an offical data type. then convert to numeric to get decimal degrees

# isolate characters
# Decimal_degrees
d_y <-  as.character(boat_sightings$Lattitude)
d_x <- as.character(boat_sightings$Longitude)

# Minutes 
m_y <- stringr::str_split_fixed(string = as.character(boat_sightings$Lat_min),
                                                         pattern =  "[[:punct:]]",
                                                         n = 2)[,1]
m_x <- stringr::str_split_fixed(string = as.character(boat_sightings$Long_min),
                                                         pattern =  "[[:punct:]]",
                                                         n = 2)[,1]
# Seconds
s_y <- stringr::str_split_fixed(string = as.character(boat_sightings$Lat_min),
                                pattern =  "[[:punct:]]",
                                n = 2)[,2] %>% 
   as.numeric() *100 / 60 #%>% 
  # as.character()

s_x <- stringr::str_split_fixed(string = as.character(boat_sightings$Long_min),
                                pattern =  "[[:punct:]]",
                                n = 2)[,2] %>% 
  as.numeric() *100 / 60 #%>% 
  # as.character()

# concatenate into a single character
dms_y <- paste0(d_y, "°",m_y,"′",as.character(s_y), "″W")
dms_y_2 <- char2dms(dms_y, chd = "°", chm = "′", chs = "″")


#convert to decimal coordinates
dd_y <- as.numeric(dms_y_2)
