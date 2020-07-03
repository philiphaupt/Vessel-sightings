# Data extract request

# aim remove personal data - anonomise

anon_sightings_sf_data <- vessel_sightings_32f0_32f1_water_gears %>% 
        dplyr::select(Date = HDate,
                      Time,
                      Working,
                      Main_Gear_Class = `Main Gear Class`,
                      geometry
                      )



# Prepare data for tabular export, keep original Lat Longs and set geometry to NULL for csv format
anon_sightings_tabular_data <- vessel_sightings_32f0_32f1_water_gears %>% 
        dplyr::select(Date = HDate,
                      Time,
                      Working,
                      Main_Gear_Class = `Main Gear Class`,
                      Lattitude,
                      Lat_min,
                      Longitude,
                      Long_min
        )

st_geometry(anon_sightings_tabular_data) <- NULL

print("Data anonymised, two pbjects created, anon_sightings_sf_data (spatial for GIS output) anon_sightings_tabular_data (tabular only for csv output.")

