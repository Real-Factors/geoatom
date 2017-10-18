# unique-id

## Goal
 
To create an accurate, atomic unique identifier for every physical structure in the world. Unique ID aims to be the single source of truth on property identity.
 
## Data sources
 
### [OSCAR](https://www.wmo-sat.info/oscar/)
    -   A database of launched satellites
    -   TBD # of data points
    -   **TO DO**
        -   Use in phase 2 of the project to find quality satelite data
 
### [Openaddressess.io](https://openaddresses.io/)
    -   478m addresses globally
    -   Usage
        -   Use as a starting data source
    -   **TO DO**
        -   Setup Postgres database with data (both local and remote version)


 
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
    -   **TO DO**
        -   Negotiate Enterprise License so we can cache more than 30 days of data
        -   Model out pricing/cost for use case

### [Yelp](https://www.yelp.com/developers/documentation/v2/overview)
    -   TBD # of data points
    -   Usage
        -   Store listing data as a data source

 
### [Open Street Map](https://www.openstreetmap.org)
    -   TBD # of data points
    -   Usage
        -   Store data as a data source
        -   Geocoding & Reverse Geocoding API to fill in gaps in other datasets
            -   [LocationIQ](https://locationiq.org)
            -   [Nominatim](https://wiki.openstreetmap.org/wiki/Nominatim)
            -   [Opencage](https://geocoder.opencagedata.com/)
    -   Data
        -   [Planet OSM](http://planet.openstreetmap.org/)
        -   [Planet OSM - Downloading](https://wiki.openstreetmap.org/wiki/Planet.osm#Downloading)
        -   [BBBike](http://download.bbbike.org/osm/)
        -   [geofabrik.de](http://download.geofabrik.de/)
        -   [Mapzen - commercial serivice]https://mapzen.com/data/metro-extracts/)
        -   [OpenStreetMap direct] Database and API access](https://wiki.openstreetmap.org/wiki/Databases_and_data_access_APIs)
    -   **TO DO**
        -   Create proof of concept using free/open data sources (see: planet OSM)


## Misc Tools
Address parsing and normalization through [libpostal](https://github.com/openvenues/libpostal)
[geographic addresses format templates](https://github.com/OpenCageData/address-formatting)

 
 
 
 
