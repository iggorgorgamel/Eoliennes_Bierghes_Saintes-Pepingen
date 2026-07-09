################################################################################
# Packages

library(sf)
library(leaflet)
library(sp)
library(quarto)


##### Eol position

eols <- read.csv("data/eol_pos.csv",sep=";")

# center eol

lat_center<-sum(eols$lat)/3
long_center<-sum(eols$long)/3

# ################################################################################
#  make map
#  read shape
# https://www.atlas-belgique.be/index.php/fr/ressources/donnees-cartographiques/
 muns <- st_read(dsn = "data/communes_L08/",layer = "Commune-2025-01-01")
 # project
 muns <- st_transform(map, CRS("+proj=longlat +datum=WGS84"))
# select only 3 municipalities
 muns<-map[map$libgeo_fr %in% c("Rebecq","Tubize","Pepingen"),]
# ################################################################################

# compute buffer around the three points


# ################################################################################
# # make map
# # read shape
# map <- st_read(dsn = "data/capa/",layer = "Bpn_CaPa")
# # project
# map <- st_transform(map, CRS("+proj=longlat +datum=WGS84"))



# # # map the leaflet map
# # 
# # leaflet() %>%
# #   addTiles() %>%
# #   addPolygons(data = map,fill =  cols, weight=2,col = '#A9A9A9',
# #               fillColor = cols,fillOpacity = op,
# #                   highlightOptions = highlightOptions(color='white',weight=3,
# #                                     bringToFront = TRUE))
save.image("wd.RData")
