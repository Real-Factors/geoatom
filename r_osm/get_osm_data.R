
## Load Libraries
  
  library(osmdata)
  library(magrittr)
  library(sf)

 ## Build a query
  
  query <- opq(bbox='Seattle, WA')
  query$bbox <- paste0(c(47.595,-122.345,47.62,-122.325),collapse=',') 
  bldgs <- query %>% 
    add_osm_feature(key = 'building') %>%
    osmdata_sf()

 ## Extract Polygons  
  
  bld_poly <- bldgs$osm_polygons

 ## Plot  
  
  plot(bld_poly$geometry)

  