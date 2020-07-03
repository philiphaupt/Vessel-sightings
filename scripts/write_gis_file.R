# Write to GIS file

#full data set
#sf::write_sf(vessel_sightings_32f0_32f1_water, dsn = "./vessel_sightings_ices_32F0_32F1_20150101_20200601.gpkg", layer = "vessel_sightings_ices_32F0_32F1_20150101_20200601", driver = "GPKG")

# write anonomised and land-overlap points removed to geopackage file
sf::write_sf(anon_sightings_sf_data, "./outputs/anon_vessel_sightings_ices_32f0_32f1_2015_2020.gpkg", layer = "vessel_sightings_ices_32F0_32F1_20150101_20200601", driver = "GPKG")


#write anonomised and land-overlap points removed (and no geometry) to csv
write_excel_csv(anon_sightings_tabular_data, "./outputs/anon_vessel_sightings_32f0_32f1_2015_2020.csv")


print("Output files written and stored in outputs folder, and named: anon_vessel_sightings_ices_32f0_32f1_2015_2020.gpkg (GIS file) and anon_vessel_sightings_32f0_32f1_2015_2020.csv (tabular file)")