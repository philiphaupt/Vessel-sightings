#Download UK adminstrative boundaries
library("GADMTools")
library("tmap")

uk_l3 <- gadm_sf_loadCountries("GBR", level = 3, basefile = "./")
uk_l2 <- gadm_sf_loadCountries("GBR", level = 2, basefile = "./")
uk_l1 <- gadm_sf_loadCountries("GBR", level = 1, basefile = "./")


# Keep only England
england <- uk_l1$sf %>% filter(NAME_1 == "England")


#isolate kent and essex
kent_and_essex <- uk_l2$sf %>% filter(NAME_2 == "Essex"|NAME_2 == "Kent")
# house keeping
rm(uk_l1, uk_l2, uk_l3)

print("two objects were created: england and kent and essex. England is for clipping (clipping vessel sightings that fall over land) and map making, and kent and essex for mapping only.")