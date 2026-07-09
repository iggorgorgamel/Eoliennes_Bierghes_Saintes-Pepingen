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
 muns <- st_transform(map, CRS("WGS84"))
# select only 3 municipalities
 muns<-map[map$libgeo_fr %in% c("Rebecq","Tubize","Pepingen"),]
# ################################################################################

# compute buffer around the three points

################################################################################
# 1. Create a spatial point and set it to a projected CRS (e.g., EPSG: 3857 in meters)
pt <- st_sfc(st_point(c(eols$long[1], eols$lat[1])), crs = "WGS84")
pt_projected <- st_transform(pt, crs = "WGS84")
# 2. Create a 400-meter buffer around the point
buf_4 <- st_buffer(pt_projected, dist = 400)
# buf_4 <- st_transform(map, CRS("EPSG:3812"))
buf_4_1 <- st_transform(buf_4, CRS("+proj=longlat +datum=WGS84"))


# 2. Create a 400-meter buffer around the point
buf_6 <- st_buffer(pt_projected, dist = 600)
# buf_4 <- st_transform(map, CRS("EPSG:3812"))
buf_6_1 <- st_transform(buf_6, CRS("+proj=longlat +datum=WGS84"))


# 2. Create a 400-meter buffer around the point
buf_8 <- st_buffer(pt_projected, 800)
# buf_4 <- st_transform(map, CRS("EPSG:3812"))
buf_8_1 <- st_transform(buf_8, CRS("+proj=longlat +datum=WGS84"))
# ################################################################################
################################################################################
# 1. Create a spatial point and set it to a projected CRS (e.g., EPSG: 3857 in meters)
pt <- st_sfc(st_point(c(eols$long[2], eols$lat[2])), crs = "WGS84")
pt_projected <- st_transform(pt, crs = "WGS84")
# 2. Create a 400-meter buffer around the point
buf_4 <- st_buffer(pt_projected, dist = 400)
# buf_4 <- st_transform(map, CRS("EPSG:3812"))
buf_4_2 <- st_transform(buf_4, CRS("+proj=longlat +datum=WGS84"))


# 2. Create a 400-meter buffer around the point
buf_6 <- st_buffer(pt_projected, dist = 600)
# buf_4 <- st_transform(map, CRS("EPSG:3812"))
buf_6_2 <- st_transform(buf_6, CRS("+proj=longlat +datum=WGS84"))


# 2. Create a 400-meter buffer around the point
buf_8 <- st_buffer(pt_projected, dist = 800)
# buf_4 <- st_transform(map, CRS("EPSG:3812"))
buf_8_2 <- st_transform(buf_8, CRS("+proj=longlat +datum=WGS84"))
# ################################################################################
################################################################################
# 1. Create a spatial point and set it to a projected CRS (e.g., EPSG: 3857 in meters)
pt <- st_sfc(st_point(c(eols$long[3], eols$lat[3])), crs = "WGS84")
pt_projected <- st_transform(pt, crs = "WGS84")
# 2. Create a 400-meter buffer around the point
buf_4 <- st_buffer(pt_projected, dist = 400)
# buf_4 <- st_transform(map, CRS("EPSG:3812"))
buf_4_3 <- st_transform(buf_4, CRS("+proj=longlat +datum=WGS84"))


# 2. Create a 400-meter buffer around the point
buf_6 <- st_buffer(pt_projected, dist = 600)
# buf_4 <- st_transform(map, CRS("EPSG:3812"))
buf_6_3 <- st_transform(buf_6, CRS("+proj=longlat +datum=WGS84"))


# 2. Create a 400-meter buffer around the point
buf_8 <- st_buffer(pt_projected, dist = 800)
# buf_4 <- st_transform(map, CRS("EPSG:3812"))
buf_8_3 <- st_transform(buf_8, CRS("+proj=longlat +datum=WGS84"))
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
