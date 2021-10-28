# open_route_services package

## Dart implementations for [OpenRouteServices API](https://openrouteservice.org)

### Directions Service
Openrouteservice’s directions can be used all around the globe. Consume rich route instructions in your applications for cars, trucks, different bike profiles, walking, hiking or wheelchair. Make use of plenty of options, ranging from different kinds of road restrictions to vehicle dimensions.

### Isochrones Service
Reachability has become a crucial component for many organizations from all different kinds of domains. To this end, you can use openrouteservice to obtain isochrones which will help you determine which areas objects are able reach in given times or distances.

### Time-Distance Matrix Service
Matrices allow you to compute many-to-many distances and the times of routes much faster than consuming the directions api over and over again. This application is frequently used by logistics organizations trying to figure out the most optimal route for deliveries.

### Pelias Geocoding Service
Geocoding transforms a description of a location, such as a place name, street address or postal code, into a normalized description of the location with a point geometry. Our geocoding service is built on top of the sophisticated  [Pelias Stack](https://github.com/pelias/pelias)  which aggregates several data sources.

### POIs Service
[Openpoiservice](https://github.com/GIScience/openpoiservice)  allows you to find places of interest around or within given geographic coordinates. You can search for categories of points of interest around a point, path or even within a given polygon and consume the rich meta information returned by the api for your needs.

### Elevation Service
Use our  [Openelevationservice](https://github.com/GIScience/openelevationservice)  to easily enrich your 2D geometries with height information based on SRTM data. Pass Point or Line geometries in different formats and recieve the 3 dimensional version back within milliseconds in your preferred format.

### Optimization Service
Traveling Salesmen and other Vehicle Routing Problems are no problem for our optimization endpoint. Based on the excellent  [Vroom project](https://github.com/VROOM-Project/vroom)  this service provides you with optimal routes while considering your specific vehicle and time constraints.


## Getting started
- Create account [signup to openrouteservice.org](https://openrouteservice.org/dev/#/signup)
- Go to Dashboard and create token (keep token secret)
- Use it with the package
example 

OpenRouteServices.init(apiKey: 'your token here');

## Usage
TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.
copy ".env.example" to ".env" and add your token to API_KEY 

API_KEY=xxxxxxxxxxxxxxxxxxxxxxx

## Additional information
TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
