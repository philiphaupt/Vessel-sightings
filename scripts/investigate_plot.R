# aim is to plot the boat sighitngs points to get an overview
library(tmap)

tmap::tmap_mode("view")


# Plot rectangles
my_ices_rect_sf %>% 
  tm_shape()+
  tm_fill(col = "salmon",
          alpha = 0.5)

tmap::tmap_mode("plot")
# Plot sightings data
sightings_sf %>% sample_frac(size = 0.1) %>% #randomly select 10 % of points for test plot
  tm_shape() +
  tmap::tm_symbols(size = 0.6)+
  my_ices_rect_sf %>% 
  tm_shape()+
  tm_fill(col = "salmon",
          alpha = 0.5)



# Plot only points inside
# Plot sightings data
overlap_points %>% 
  tm_shape() +
  tmap::tm_symbols(size = 0.3)+
  my_ices_rect_sf %>% 
  tm_shape()+
  tm_fill(col = "salmon",
          alpha = 0.5)

