# Data extract request

# aim remove personal data - anonomise

anon_sightings_sf_data <- vessel_sightings_32f0_32f1_water %>% 
        dplyr::select(Date = HDate,
                      Time,
                      Working,
                      Gear = Activity...Gear.type,
                      geometry
                      )
# write to geopackage file
sf::write_sf(anon_sightings_data, "./anon_vessel_sightings_ices_32f0_32f1_2015_2020.gpkg", layer = "vessel_sightings_ices_32F0_32F1_20150101_20200601", driver = "GPKG")

# Prepare data for tabular export, keep original Lat Longs and set geometry to NULL for csv format
anon_sightings_tabular_data <- vessel_sightings_32f0_32f1_water %>% 
        dplyr::select(Date = HDate,
                      Time,
                      Working,
                      Gear = Activity...Gear.type,
                      Lattitude,
                      Lat_min,
                      Longitude,
                      Long_min
        )

st_geometry(anon_sightings_tabular_data) <- NULL

#write to csv
write_excel_csv(anon_sightings_tabular_data, "./anon_vessel_sightings_32f0_32f1_2015_2020.csv")


