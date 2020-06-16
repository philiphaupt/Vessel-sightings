#Main script
# Aim calls the helper scripts to run the sequence of scripts needed to read, cleananad produce mapable data outputs

# Read in the data
source("./scripts/read_xl_vessel_sightings.R")

# Convert the coordinates DMds to dd and add to object boat_sightings
source("./scripts/convert_coordinates.R")
#rm(list = setdiff(ls(), "boat_sightings")) # housekeeping: clean away unnecceasry objects

# Generate in ICES sqaures
source("./scripts/read_in_ices_squares.R")

# Find points of overlap between vessel sightings and ICES rectangles. Note that this also writes a csv file
source("./scripts/find_pts_in_ices_rect.R")

# Investigate plot: See the map
source("./scripts/investigate_plot.R")

#  Write to file
source("./scripts/write_gis_file.R")

