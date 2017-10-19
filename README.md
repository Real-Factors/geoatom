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
    -   478m addresses globally
    -   Usage
        -   Starting data source
    -   TO DO
        -   Setup Postgres database with data (both local and remote version)

### [Open Street Map](https://www.openstreetmap.org)
    -   TBD # of data points
    -   Usage
        -   Store data as a data source
        -   Geocoding & Reverse Geocoding API to fill in gaps in other datasets
            -   [LocationIQ](https://locationiq.org)
            -   [Nominatim](https://wiki.openstreetmap.org/wiki/Nominatim)
                -   [Installation](http://nominatim.org/release-docs/latest/Installation)
            -   [Opencage](https://geocoder.opencagedata.com/)
    -   Data
        -   [Planet OSM](http://planet.openstreetmap.org/)
        -   [Planet OSM - Downloading](https://wiki.openstreetmap.org/wiki/Planet.osm#Downloading)
        -   [BBBike](http://download.bbbike.org/osm/)
        -   [geofabrik.de](http://download.geofabrik.de/)
        -   [Mapzen - commercial serivice](https://mapzen.com/data/metro-extracts/)
        -   [OpenStreetMap direct Database and API access](https://wiki.openstreetmap.org/wiki/Databases_and_data_access_APIs)
    -   TO DO
        -   Create proof of concept using free/open data sources (see: planet OSM)
 
### [Google Maps APIs](https://developers.google.com/maps)
    -   TBD # of data points
    -   Usage
        -   Store Places API data as a data source
        -   Geocoding & Reverse Geocoding API to fill in gaps in other datasets
    -   Documentation
        -   [Usage](https://developers.google.com/places/web-service/usage)
        -   [Search](https://developers.google.com/places/web-service/search)
        -   [Geolocation Intro](https://developers.google.com/maps/documentation/geolocation/intro)
        -   [PlaceID example](https://developers.google.com/places/web-service/place-id#example-using-the-places-api-web-service)
    -   TO DO
        -   Negotiate Enterprise License so we can cache more than 30 days of data
        -   Model out pricing/cost for use case

### [Yelp](https://www.yelp.com/developers/documentation/v2/overview)
    -   TBD # of data points
    -   Usage
        -   Store listing data as a data source

        
### [OSCAR](https://www.wmo-sat.info/oscar/)
    -   A database of launched satellites
    -   TBD # of data points
    -   TO DO
        -   Use in phase 2 of the project to find quality satelite data


## MISC TOOLS
Address parsing and normalization through [libpostal](https://github.com/openvenues/libpostal)
[geographic addresses format templates] (https://github.com/OpenCageData/address-formatting)

 
 
 
 
