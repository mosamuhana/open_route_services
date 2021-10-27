import 'dart:convert' show jsonDecode;

import 'geo_location.dart';

class Address {
  final GeoLocation coordinates;
  final String label;
  final String? id;
  final String? gid;
  final String? layer;
  final String? source;
  final String? sourceId;
  final String? name;
  final double? confidence;
  final String? matchType;
  final String? accuracy;
  final String? country;
  final String? countryGid;
  final String? countryA;
  final String? region;
  final String? regionGid;
  final String? regionA;
  final String? continent;
  final String? continentGid;
  final double? distance;
  final String? county;
  final String? countyGid;
  final String? countyA;

  Address._({
    required this.coordinates,
    required this.label,
    this.id,
    this.gid,
    this.layer,
    this.source,
    this.sourceId,
    this.name,
    this.confidence,
    this.matchType,
    this.accuracy,
    this.country,
    this.countryGid,
    this.countryA,
    this.region,
    this.regionGid,
    this.regionA,
    this.continent,
    this.continentGid,
    this.distance,
    this.county,
    this.countyGid,
    this.countyA,
  });

  Address copyWith({
    GeoLocation? coordinates,
    String? id,
    String? gid,
    String? layer,
    String? source,
    String? sourceId,
    String? name,
    double? confidence,
    String? matchType,
    String? accuracy,
    String? country,
    String? countryGid,
    String? countryA,
    String? region,
    String? regionGid,
    String? regionA,
    String? continent,
    String? continentGid,
    String? label,
    double? distance,
    String? county,
    String? countyGid,
    String? countyA,
  }) {
    return Address._(
      coordinates: coordinates ?? this.coordinates,
      id: id ?? this.id,
      gid: gid ?? this.gid,
      layer: layer ?? this.layer,
      source: source ?? this.source,
      sourceId: sourceId ?? this.sourceId,
      name: name ?? this.name,
      confidence: confidence ?? this.confidence,
      matchType: matchType ?? this.matchType,
      accuracy: accuracy ?? this.accuracy,
      country: country ?? this.country,
      countryGid: countryGid ?? this.countryGid,
      countryA: countryA ?? this.countryA,
      region: region ?? this.region,
      regionGid: regionGid ?? this.regionGid,
      regionA: regionA ?? this.regionA,
      continent: continent ?? this.continent,
      continentGid: continentGid ?? this.continentGid,
      label: label ?? this.label,
      distance: distance ?? this.distance,
      county: county ?? this.county,
      countyGid: countyGid ?? this.countyGid,
      countyA: countyA ?? this.countyA,
    );
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    /*
    "distance": 0.066,
    "county": "Khan Yunis",
    "county_gid": "whosonfirst:county:1091913333",
    "county_a": "KY",

    "id": "node/4296838298",
    "gid": "openstreetmap:venue:node/4296838298",
    "layer": "venue",
    "source": "openstreetmap",
    "source_id": "node/4296838298",
    "name": "60b",
    "confidence": 0.8,
    "accuracy": "point",
    "country": "Palestine",
    "country_gid": "whosonfirst:country:85633739",
    "country_a": "PSE",
    "region": "Gaza Strip",
    "region_gid": "whosonfirst:region:85681213",
    "region_a": "GZ",
    "continent": "Asia",
    "continent_gid": "whosonfirst:continent:102191569",
    "label": "60b, GZ, Palestine"
  */

    final coordinates = map['geometry']['coordinates'];
    final properties = map['properties'] as Map;
    return Address._(
      coordinates: GeoLocation(
        lat: coordinates[0]?.toDouble(),
        lon: coordinates[1]?.toDouble(),
      ),
      id: properties['id'],
      gid: properties['gid'],
      layer: properties['layer'],
      source: properties['source'],
      sourceId: properties['source_id'],
      name: properties['name'],
      confidence: properties['confidence']?.toDouble(),
      matchType: properties['match_type'],
      accuracy: properties['accuracy'],
      country: properties['country'],
      countryGid: properties['country_gid'],
      countryA: properties['country_a'],
      region: properties['region'],
      regionGid: properties['region_gid'],
      regionA: properties['region_a'],
      continent: properties['continent'],
      continentGid: properties['continent_gid'],
      label: properties['label'],
      distance: properties['distance']?.toDouble(),
      county: properties['county'],
      countyGid: properties['county_gid'],
      countyA: properties['county_a'],
    );
  }

  static List<Address> listFromMap(Map<String, dynamic> map) {
    final features = map['features'] as List;
    return features.map((x) => Address.fromMap(x)).toList();
  }

  static List<Address> listFromJson(String source) =>
      listFromMap(jsonDecode(source));

  @override
  String toString() => 'Address ('
      'coordinates: $coordinates, '
      'id: $id, '
      'gid: $gid, '
      'layer: $layer, '
      'source: $source, '
      'sourceId: $sourceId, '
      'name: $name, '
      'confidence: $confidence, '
      'matchType: $matchType, '
      'accuracy: $accuracy, '
      'country: $country, '
      'countryGid: $countryGid, '
      'countryA: $countryA, '
      'region: $region, '
      'regionGid: $regionGid, '
      'regionA: $regionA, '
      'continent: $continent, '
      'continentGid: $continentGid, '
      'label: $label '
      'label: $distance '
      'county: $county '
      'countyGid: $countyGid '
      'countyA: $countyA '
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Address &&
        other.coordinates == coordinates &&
        other.id == id &&
        other.gid == gid &&
        other.layer == layer &&
        other.source == source &&
        other.sourceId == sourceId &&
        other.name == name &&
        other.confidence == confidence &&
        other.matchType == matchType &&
        other.accuracy == accuracy &&
        other.country == country &&
        other.countryGid == countryGid &&
        other.countryA == countryA &&
        other.region == region &&
        other.regionGid == regionGid &&
        other.regionA == regionA &&
        other.continent == continent &&
        other.continentGid == continentGid &&
        other.label == label &&
        other.distance == distance &&
        other.county == county &&
        other.countyGid == countyGid &&
        other.countyA == countyA;
  }

  @override
  int get hashCode => Object.hashAll([
        coordinates,
        id,
        gid,
        layer,
        source,
        sourceId,
        name,
        confidence,
        matchType,
        accuracy,
        country,
        countryGid,
        countryA,
        region,
        regionGid,
        regionA,
        continent,
        continentGid,
        label,
        distance,
        county,
        countyGid,
        countyA,
      ]);
}
