# Read in auxillary table about fishery and join data
library(dplyr)

gear_type_descriptive <- read_xlsx("./data/gear_types_sightings.xlsx") %>% 
  dplyr::rename(gear_code_specific = `SFC Specific Code`)

print("Gear types read in, gear_type_descriptive.")
# #keep only broad categories for anonomised data
# main_gear_types <- gear_type_descriptive %>% select(`SFC Specific Code`, 
#                                                     `Main Gear Class`)

# Join gear types to the full sightings data set
vessel_sightings_32f0_32f1_water_gears <- left_join(vessel_sightings_32f0_32f1_water, 
                                                    gear_type_descriptive, 
                                                    by = c("Activity...Gear.type" = "gear_code_specific"))

print("Gears types joined to data, now called, vessel_sightings_32f0_32f1_water_gears.")