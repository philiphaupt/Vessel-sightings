#Main script
# Aim calls the helper scripts to run the sequence of scripts needed to read, cleananad produce mapable data outputs

# libraries

library(sf)
library(sp)
library(tidyverse)

# Read in the data
source("./scripts/read_xl_vessel_sightings.R")

# Convert the coordinates DMds to dd and add to object boat_sightings
source("./scripts/convert_coordinates.R") # currently has to be read in manually - does not run from calling source?

# Generate in ICES sqaures
source("./scripts/read_in_ices_squares.R")

# housekeeping: clean away unnecceasry objects
rm(list = setdiff(ls(), c("boat_sightings", "my_ices_rect_sf", "sightings_sf"))) 

# Find points of overlap between vessel sightings and ICES rectangles. Note that this also writes a csv file
source("./scripts/find_pts_in_ices_rect.R")
# Investigate plot: See the map - only use this if you want to examine the outputs
# source("./scripts/investigate_plot.R") # outputs: vessel_sightings_32f0_32f1 and overlap_points

# remove points that overlap with land
# download land boundaries
source("./scripts/download_uk_boundaries.R") #output name england
# then clip 
source("./scripts/clip_points_to_uk_waters.R")
# see plot if you like (make a map)
# source("./scripts/output_map_plot.R")

# Read in gear types
source("./scripts/read_in_gear_types_and_join_sightings_dat.R")

# Anonomise data
source("./scripts/anonomise.R")

# Export./save to file
source("./scripts/write_gis_file.R")

