#Download UK adminstrative boundaries
library("GADMTools")
library("tmap")

uk_l2 <- gadm_sf_loadCountries("GBR", level = 3, basefile = "./")
uk_l2 <- gadm_sf_loadCountries("GBR", level = 2, basefile = "./")
uk_l1 <- gadm_sf_loadCountries("GBR", level = 1, basefile = "./")


# Keep only England
england <- uk_l1$sf %>% filter(NAME_1 == "England")


#isolate kent and essex
kent_and_essex <- uk_l2$sf %>% filter(NAME_2 == "Essex"|NAME_2 == "Kent")
# house keeping
rm(uk_l1, uk_l2)