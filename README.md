# unique-id

## OVERVIEW

The goal is to create an accurate, atomic unique identifier for every physical structure in the world. Unique ID aims to be the single source of truth on property identity.

## ROADMAP

**Phase 1**

During Phase I of the project we will identify relevant address data sources and work to integrate them into a single source of truth data store. Twhich represents validated, real world addresses across the United States. First we will build the data infrastructure to handle addressess across the U.S. After a proof-of-concept on a representative sample of addresses is successful, we will build out the system for the entire U.S. (and eventually, the world).

**Phase 2**

In Phase 2, we will use our single source of truth database created during Phase 1 to pair address data with satelite--and other non-traditional sources.

## DATA SOURCES

### [Openaddressess.io](https://openaddresses.io/)
478m addresses globally
#### Usage
Openaddressess will be a starting data source

#### To Do
- Load data files into "raw" data sources db
- Write ETL script to load into "raw" data sources DB, scrub/clean data as needed, and load into single source of truth

### [Open Street Map](https://www.openstreetmap.org)

#### Usage
Primary usage will be to store addresses in single source of truth db. Geocoding services seem cheaper than google so might be a good commercial option to fill in the gaps.

#### Data Download
- [Planet OSM](http://planet.openstreetmap.org/)  
- [Planet OSM - Downloading](https://wiki.openstreetmap.org/wiki/Planet.osm#Downloading)  
- [BBBike](http://download.bbbike.org/osm/)  
- [geofabrik.de](http://download.geofabrik.de/)  
- [Mapzen - commercial serivice](https://mapzen.com/data/metro-extracts/)
- [OpenStreetMap direct Database and API access](https://wiki.openstreetmap.org/wiki/Databases_and_data_access_APIs)

**Commercial Options**

- [LocationIQ](https://locationiq.org)  
- [Nominatim](https://wiki.openstreetmap.org/wiki/Nominatim)  
  - [Installation](http://nominatim.org/release-docs/latest/Installation)  
- [Opencage](https://geocoder.opencagedata.com/)  

#### To Do
- Download data from openstreetmap.org and review for features, completeness, and accuracy.
- Write ETL script to load into "raw" data sources DB, scrub/clean data as needed, and load into single source of truth
 
### [Google Maps APIs](https://developers.google.com/maps)
#### TBD # of data points
#### To Do
- Store Places API data as a data source  
- Geocoding & Reverse Geocoding API to fill in gaps in other datasets  

#### Documentation
- [Usage](https://developers.google.com/places/web-service/usage)  
- [Search](https://developers.google.com/places/web-service/search)  
- [Geolocation Intro](https://developers.google.com/maps/documentation/geolocation/intro)  
- [PlaceID example](https://developers.google.com/places/web-service/place-id#example-using-the-places-api-web-service)  

#### To Do
- Model out pricing/cost for use case
- If cost effective compared to free/open data sources, negotiate Enterprise License so we can cache more than 30 days of data  

### [Yelp](https://www.yelp.com/developers/documentation/v2/overview)
#### TBD # of data points

#### Usage
- Store listing address data for single source of truth db.
- Store review and other unstructured data as potential indicator of misclassification of buildings etc.

#### Documentation
- [Business API](https://www.yelp.com/developers/documentation/v2/business)
- [Search API](https://www.yelp.com/developers/documentation/v2/search_api)

#### To Do
- Review documentation/Yelp TOS to understand how much data we can legally cache
- Model out pricing/cost for use case

### [OSCAR](https://www.wmo-sat.info/oscar/)

A listing database of launched satellites

#### TBD # of data points
#### Usage
Find inexpensive and suitable satelite data sources for use in Phase 2.
#### To Do
Research which satelite data will provide most value to phase 2 of the project


## MISC TOOLS
- Address parsing and normalization through [libpostal](https://github.com/openvenues/libpostal)  
- [geographic addresses format templates](https://github.com/OpenCageData/address-formatting)

 
 
 
 
