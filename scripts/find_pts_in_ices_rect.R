#intersect_with_ices_rectangles

overlap_points <- sf::st_intersection(sightings_sf, my_ices_rect_sf)
vessel_sightings_32f0_32f1 <- overlap_points

# remove geometry and save it as an excel file
#st_geometry(vessel_sightings_32f0_32f1) <- NULL
#write_excel_csv(vessel_sightings_32f0_32f1, "./vessel_sightings_32f0_32f1.csv")
print("Two objects were created: overlap_points and vessel_sightings_32f0_32f1 - at this stage they are identical")
