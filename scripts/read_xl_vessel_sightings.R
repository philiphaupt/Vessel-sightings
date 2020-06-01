#REad in and access vessel sightings data

library(readxl)
library(tidyverse)

boat_sightings <- readxl::read_xlsx("C:/Users/Phillip Haupt/OneDrive - Kent & Essex Inshore Fisheries and Conservation Authority/Boat_sightings_20150101_to_20200601.xlsx") %>% 
  filter(!is.na(Lattitude)) %>% 
  filter(Lattitude != 0) %>% 
  filter(!is.na(Longitude)) %>% 
  filter(!is.na(Lat_min)) %>% 
  filter(!is.na(Long_min))
