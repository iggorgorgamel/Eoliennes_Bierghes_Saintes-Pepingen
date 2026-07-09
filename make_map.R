################################################################################
# Packages

library(sf)
library(leaflet)
library(sp)
library(quarto)


# source of data
# https://finances.belgium.be/fr/experts-partenaires/donnees-ouvertes-patrimoine/jeux-donnees/portail-telechargement
# descirption of data
# https://opendata.fin.belgium.be/download/TechnicalSpecifications/PP-FiscSit_20230101_TechSpec_FR.pdf


# ################################################################################
# # make map
# # read shape
# map <- st_read(dsn = "data/capa/",layer = "Bpn_CaPa")
# # project
# map <- st_transform(map, CRS("+proj=longlat +datum=WGS84"))

# ################################################################################
# # read data
# text <- pdf_text("proprietes_communales.PDF")
# # subset for page 3
# test <- text[[3]]
# # split at end of line
# test <-strsplit(test,"03-05-24\n")
# test <- test[[1]]
# # remove unneeded spaces
# test <- unlist(lapply(seq_along(test),function(x){gsub("^ *|(?<= ) | *$", "", test[x], perl = TRUE)}))
# # split at space
# paca <- lapply(seq_along(test),function(x){strsplit(test[x]," ")})
# # get elemnt with / and take element starting with 25
# paca <- lapply(seq_along(paca),function(x){
#   sub <- paca[[x]][[1]][grep('/', paca[[x]][[1]],perl = TRUE)]
#   fin <- sub[grep("25",sub)]
#   return(fin)
# })
# # unlist
# paca <- unlist(paca)
# # some character are badly read and must be changed
# paca <- gsub("O","0",paca)
# paca <- gsub("Û","0",paca)

# # some manual changes
# paca[paca ==  "25007BQ214/00B000"] <- "25007B0214/00B000"
# paca[paca ==  "25088A0Q04/00A000"] <- "25088A0004/00A000"
# paca[paca ==  "25088A0H3/00C000"] <- "25088A0113/00C000"
# paca[paca ==  "25088B0060/000000"] <- "25088B0060/00D000"

# # check if some still missing
# paca[!(paca %in% map$CaPaKey)]

# ################################################################################
# # read data
# text <- pdf_text("proprietes_communales.PDF")
# # subset for page 3
# test <- text[[4]]
# # split at end of line
# test <-strsplit(test,"03-05-24\n")
# test <- test[[1]]
# # remove unneeded spaces
# test <- unlist(lapply(seq_along(test),function(x){gsub("^ *|(?<= ) | *$", "", test[x], perl = TRUE)}))
# # split at space
# paca2 <- lapply(seq_along(test),function(x){strsplit(test[x]," ")})
# # get elemnt with / and take element starting with 25
# paca2 <- lapply(seq_along(paca2),function(x){
#   sub <- paca2[[x]][[1]][grep('/', paca2[[x]][[1]],perl = TRUE)]
#   fin <- sub[grep("25",sub)]
#   return(fin)
# })
# # unlist
# paca2 <- unlist(paca2)
# # some character are badly read and must be changed
# paca2 <- gsub("O","0",paca2)
# paca2 <- gsub("Û","0",paca2)

# # some manual changes

# map$CaPaKey[grep("25090B0024/02C000",map$CaPaKey)]
# paca2[paca2 ==  "25090B0024/02C00D"] <- "25090B0024/02C000"

# map$CaPaKey[grep("25090B0028/02K000",map$CaPaKey)]
# paca2[paca2 ==  "25090B0028/02KD00"] <- "25090B0028/02K000"

# map$CaPaKey[grep("25090B0028/02W000",map$CaPaKey)]
# paca2[paca2 ==  "25090B0028/D2W000"] <- "25090B0028/02W000"

# map$CaPaKey[grep("25090B0028/02Y000",map$CaPaKey)]
# paca2[paca2 ==  "25090B0028/02Y00D"] <- "25090B0028/02Y000"

# map$CaPaKey[grep("25090B0029/00F000",map$CaPaKey)]
# paca2[paca2 ==  "25090B0D29/00F000"] <- "25090B0029/00F000"

# map$CaPaKey[grep("25090B0063/00_000",map$CaPaKey)]
# paca2[paca2 ==  "2509080063/00_000"] <- "25090B0063/00_000"

# map$CaPaKey[grep("25090B0302/00K000",map$CaPaKey)]
# paca2[paca2 ==  "2509080302/00K000"] <- "25090B0302/00K000"

# map$CaPaKey[grep("25090C0190/00B003",map$CaPaKey)]
# paca2[paca2 ==  "25090C0190/D0B003"] <- "25090C0190/00B003"

# map$CaPaKey[grep("25090C0269/02",map$CaPaKey)]
# paca2[paca2 ==  "25090C0269/02"] <- "25090C0269/02_000"

# map$CaPaKey[grep("25090C0460/03",map$CaPaKey)]
# paca2[paca2 ==  "25090C0460/03"] <- "25090C0460/03_000"

# map$CaPaKey[grep("25090E0107/02A000",map$CaPaKey)]
# paca2[paca2 ==  "25090E0107/02A000\n"] <- "25090E0107/02A000"

# map$CaPaKey[grep("25090E0159/02A000",map$CaPaKey)]
# paca2[paca2 ==  "2509DE0159/02A000"] <- "25090E0159/02A000"

# map$CaPaKey[grep("25090E0242/00_000",map$CaPaKey)]
# paca2[paca2 ==  "25090E0242/00..000"] <- "25090E0242/00_000"

# map$CaPaKey[grep("25090G0053/02_000",map$CaPaKey)]
# paca2[paca2 ==  "25090G0053/02..000"] <- "25090G0053/02_000"

# map$CaPaKey[grep("25090E0205/02_000",map$CaPaKey)]
# paca2[paca2 ==  "25090F.0205/02„000"] <- "25090E0205/02_000"

# map$CaPaKey[grep("25090E0230/00B000",map$CaPaKey)]
# paca2[paca2 ==  "25090E0230/00B00Q"] <- "25090E0230/00B000"

# map$CaPaKey[grep("25090G0046/02",map$CaPaKey)]
# paca2[paca2 ==  "25090G0046/02"] <- "25090G0046/02_000"

# # map$CaPaKey[grep("25090G0069/00B000",map$CaPaKey)]
# paca2[paca2 ==  "2509DG0069/00B000"] <- "25090G0069/00B000"


# paca2[!(paca2 %in% map$CaPaKey)]

# ################################################################################
# # read data
# text <- pdf_text("proprietes_communales.PDF")
# # subset for page 3
# test <- text[[5]]
# # split at end of line
# test <-strsplit(test,"03-05-24\n")
# test <- test[[1]]
# # remove unneeded spaces
# test <- unlist(lapply(seq_along(test),function(x){gsub("^ *|(?<= ) | *$", "", test[x], perl = TRUE)}))
# # split at space
# paca3 <- lapply(seq_along(test),function(x){strsplit(test[x]," ")})
# # get elemnt with / and take element starting with 25
# paca3 <- lapply(seq_along(paca3),function(x){
#   sub <- paca3[[x]][[1]][grep('/', paca3[[x]][[1]],perl = TRUE)]
#   fin <- sub[grep("25",sub)]
#   return(fin)
# })
# # unlist
# paca3 <- unlist(paca3)
# # some character are badly read and must be changed
# paca3 <- gsub("O","0",paca3)
# paca3 <- gsub("Û","0",paca3)

# paca3[!(paca3 %in% map$CaPaKey)]


# paca3[paca3 ==  "25090G0097/0QG000"] <- "25090G0097/00G000"
# paca3[paca3 ==  "2509080051/020000"] <- "25090B0051/02D000"
# paca3[paca3 ==  "25090C0190/00K003\n"] <- "25090C0190/00K003"

# # thes two were not found
# paca3[!(paca3 %in% map$CaPaKey)]

# # "25090B0069/00G000"
# # not found
# map$CaPaKey[grep("25090B0069/00G000",map$CaPaKey)]
# # two guesses : 
# map$CaPaKey[grep("25090B0069",map$CaPaKey)]

# # best guesses
# paca3 == "25090B0069/00E000"
# paca3 == "25090B0069/00D000"

# # too many
# map$CaPaKey[grep("00G000",map$CaPaKey)]

# # "25394E0332/00A000"
# # not found
# map$CaPaKey[grep("25394E0332/00A000",map$CaPaKey)]
# # too many
# map$CaPaKey[grep("00A000",map$CaPaKey)]
# # not found
# map$CaPaKey[grep("25394E0332",map$CaPaKey)]




# # sum(map$CaPaKey == "25090B0069/00G000")
# # 

# # all thre together
# paca <- c(paca,paca2,paca3)

# ################################################################################
# # make map
# # read shape
# map <- st_read(dsn = "data/capa/",layer = "Bpn_CaPa")
# # project
# map <- st_transform(map, CRS("+proj=longlat +datum=WGS84"))


# # vector for colors of parcel not commune
# cols <- rep("white",length(map$CaPaKey)) 
# # define colors for commune
# colco <- "chartreuse"#8fc9b6
# # set colors of polygons for CaPaKey in commune
# cols[map$CaPaKey %in% paca] <- colco
# # make vector fo opacity
# op <- rep(0.5,length(cols))
# op[cols == colco] <- 1


# to_check <- sum(!(paca %in% map$CaPaKey))
# max_to_check <- length(paca)

# # # map the leaflet map
# # 
# # leaflet() %>%
# #   addTiles() %>%
# #   addPolygons(data = map,fill =  cols, weight=2,col = '#A9A9A9',
# #               fillColor = cols,fillOpacity = op,
# #                   highlightOptions = highlightOptions(color='white',weight=3,
# #                                     bringToFront = TRUE))
# save.image("wd.RData")
