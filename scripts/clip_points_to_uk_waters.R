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


# Using the plotting function:
tmap::tm_shape(shp = area_of_interest) +
  tm_fill(col = NA,
          alpha = 0) +
  tm_graticules(lwd = 0.8,
                col = "grey") +
  tm_shape(shp = england) +
  tm_borders("grey") +
  tm_fill("cornsilk1",
          alpha =1) +
  tm_shape(shp = kent_and_essex) +
  tm_borders("grey60", lwd = 0.5) +
  tm_text("NAME_2",
          size = 1.2,
          col = "black",
          just = "left") +
  tm_fill(col = "darkolivegreen3",
          alpha = 1) +
  tm_shape(vessel_sightings_32f0_32f1_water) +
  tm_bubbles(
    size = 0.1,
    col = "black",
    alpha = 1,
    border.col = "NA",
    border.lwd = 0
  ) +
  tm_layout(bg.color = "lightblue",
            main.title = "Vessel sightings in ICES 32f0 and 32f1 between 2015 and 2020",
            main.title.position = "center"
            #title.position = c("centre")
            #attr.position = c("TOP", "RIGHT")
            )+
  #tm_logo(file = "logo.PNG",
  #        just = 1)+
  tm_compass(type = "8star",
             position = c("right","top"))+
  tm_scale_bar(position = c("left", "top"))

             