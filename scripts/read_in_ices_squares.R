# read in ICES rectangles
library(mapplots)
library(sf)
library(lwgeom)

# enter names of ices rectangles as below
ICES_rect_names <- c("32F0", "32F1")
rect <- ices.rect(ICES_rect_names)

#test plot
basemap(xlim=range(boat_sightings$dd_lon), ylim=range(boat_sightings$dd_lat) )
draw.rect(rect)
points(boat_sightings$dd_lon,boat_sightings$dd_lat)

# Corner points of ICES rectanlges (bbox for each)
input_lst <- list()
for (i in seq_along(rect)) {
  rect_l_lon <- rect[i,1] - 0.5
  rect_r_lon <- rect[i,1] + 0.5
  rect_t_lat <- rect[i,2] - 0.25
  rect_b_lat <- rect[i,2] + 0.25
  input_matrix <- matrix(c(rect_l_lon, rect_t_lat, rect_r_lon, rect_t_lat, rect_r_lon, rect_b_lat, rect_l_lon, rect_b_lat, rect_l_lon, rect_t_lat), ncol = 2, byrow = TRUE)
  input_lst[i] <- list(input_matrix)
  }


# make it an sf polygon
(my_ices_rect = sf::st_polygon(input_lst))

# convert to sfc object
my_ices_rect_sfc <- st_sfc(my_ices_rect, crs = 4326, precision = 0, check_ring_dir = FALSE)
#my_ices_rect_sf <- st_sf(my_ices_rect_sfc)

#check shape
st_is_valid(my_ices_rect_sfc)
# correct geometry for sf object
correct <- st_make_valid(my_ices_rect_sfc)
my_ices_rect_sf <- st_sf(correct)
