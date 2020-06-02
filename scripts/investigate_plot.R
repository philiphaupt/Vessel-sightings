# aim is to plot the boat sighitngs points to get an overview
library(tmap)

tmap::tmap_mode("view")

sightings_sf %>% 
  tm_shape() +
  tmap::tm_symbols()
