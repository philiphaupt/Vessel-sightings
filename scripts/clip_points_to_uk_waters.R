# Only keep vessel sightings over water 

library(sf)

#intersect (outside of the intersection)
vessel_sightings_32f0_32f1_water <-
  st_difference(overlap_points, england)

# Inspect the output
tmap::tmap_mode("plot")

# set the area of interest for zooming the map into
area_of_interest <-
  st_as_sfc(sf::st_bbox(vessel_sightings_32f0_32f1_water))


#
print("New objects: vessel_sightings_32f0_32f1_water (points over water) and area of interest (for map plotting)")

             