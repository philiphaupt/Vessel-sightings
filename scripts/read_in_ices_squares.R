# read in ICES rectanlges
# install.packages("mapplots")
library(mapplots)

# enter names of ices rectangles as below
ICES_rect_names <- c("32F0", "32F1")
rect <- ices.rect(ICES_rect_names)

#test plot
# rect <- ices.rect2(lon,lat)
basemap(xlim=range(boat_sightings$dd_lon), ylim=range(boat_sightings$dd_lat) )
draw.rect(rect)
points(boat_sightings$dd_lon,boat_sightings$dd_lat)
#text(boat_sightings$dd_lon,boat_sightings$dd_lat,rect,cex=0.7,pos=3)

#
make.grid()

# points_of_ICES_rectanlges
input_lst <- list()
for (i in seq_along(rect)) {
  rect_l_lon[i] <- rect[i,1] - 0.5
  rect_r_lon[i] <- rect[i,1] + 0.5
  rect_t_lat[i] <- rect[i,2] - 0.25
  rect_b_lat[i] <- rect[i,2] + 0.25
  input_matrix <- matrix(c(rect_l_lon[i], rect_t_lat[i], rect_r_lon[i], rect_t_lat[i], rect_r_lon[i], rect_b_lat[i], rect_l_lon[i], rect_b_lat[i], rect_l_lon[i], rect_t_lat[i]), ncol = 2, byrow = TRUE)
  input_lst[i] <- list(input_matrix)
  rm(input_matrix)
  }


# make it an sf polygon
(my_ices_rect = sf::st_polygon(input_lst))
# my_ices_rect_spdf <- as(my_ices_rect, "Spatial")
# sf:::as_Spatial(my_ices_rect, "sf")
# as(my_ices_rect, "sf")

my_ices_rect_sfc <- st_sfc(my_ices_rect, crs = 4326, precision = 0, check_ring_dir = FALSE)
my_ices_rect_sf <- st_sf(my_ices_rect_sfc)
# my_ices_rect_spdf <- st_crs(my_ices_rect_spdf, 4326)
my_ices_rect_sf <- st_as_sf(my_ices_rect$)#crs = 4326


my_ices_rect$rect_name <- ICES_rect_names
# proj4string(my_ices_rect) <- 4326
# st_transform(my_ices_rect, crs = 4326)
# st_crs(my_ices_rect) <- 4326

