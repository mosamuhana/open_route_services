import 'boundary_rect.dart';
import 'geo_location.dart';
import '../utils/index.dart' show listFrom, listEquals;

class GeocodingResult {
  final List<GeocodingFeature> features;
  final GeocodingMetadata? geocoding;
  final BoundaryRect? bbox;

  GeocodingResult._({
    required this.features,
    this.geocoding,
    this.bbox,
  });

  factory GeocodingResult.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('features')) throw Exception('Invalid json data');
    return GeocodingResult._(
      //features: List<GeocodingFeature>.from(map['features']?.map((x) => GeocodingFeature.fromMap(x))),
      features: GeocodingFeature._listFrom(map['features']),
      geocoding: GeocodingMetadata.fromMap(map['geocoding']),
      bbox: _toBoundaryRect(map['bbox']),
    );
  }

  @override
  String toString() => 'Result ('
      'geocoding: $geocoding, '
      'features: $features, '
      'bbox: $bbox'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GeocodingResult &&
        other.geocoding == geocoding &&
        other.bbox == bbox &&
        listEquals(other.features, features);
  }

  @override
  int get hashCode => Object.hashAll([geocoding, features, bbox]);
}

class GeocodingMetadata {
  final String? version;
  final String? attribution;
  final GeocodingQuery? query;
  final GeocodingEngine? engine;
  final int? timestamp;

  GeocodingMetadata._({
    this.version,
    this.attribution,
    this.query,
    this.engine,
    this.timestamp,
  });

  static GeocodingMetadata? fromMap(Map<String, dynamic> data) {
    final map = _toMap(data, const ['version', 'attribution', 'query', 'engine', 'timestamp']);
    if (map == null) return null;
    return GeocodingMetadata._(
      version: map['version'],
      attribution: map['attribution'],
      query: GeocodingQuery.fromMap(map['query']),
      engine: GeocodingEngine.fromMap(map['engine']),
      timestamp: map['timestamp']?.toInt(),
    );
  }

  @override
  String toString() => 'Geocoding ('
      'version: $version, '
      'attribution: $attribution, '
      'query: $query, '
      'engine: $engine, '
      'timestamp: $timestamp'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GeocodingMetadata &&
        other.version == version &&
        other.attribution == attribution &&
        other.query == query &&
        other.engine == engine &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode => Object.hashAll([
        version,
        attribution,
        query,
        engine,
        timestamp,
      ]);
}

class GeocodingQuery {
  final String? text;
  final String? parser;
  final String? parsedSubject;
  final String? parsedLocality;
  final int? size;
  final List<String>? layers;
  final List<String>? sources;
  final bool? private;
  final String? lang;
  final int? querySize;

  GeocodingQuery._({
    this.text,
    this.parser,
    this.parsedSubject,
    this.parsedLocality,
    this.size,
    this.layers,
    this.sources,
    this.private,
    this.lang,
    this.querySize,
  });

  static GeocodingQuery? fromMap(dynamic data) {
    final map = _toMap(
        data, const ['text', 'parser', 'parsed_text', 'size', 'layers', 'sources', 'private', 'lang', 'querySize']);
    if (map == null) return null;
    return GeocodingQuery._(
      text: map['text'],
      parser: map['parser'],
      parsedSubject: map['parsed_text']?['subject'],
      parsedLocality: map['parsed_text']?['locality'],
      size: map['size']?.toInt(),
      layers: listFrom<String>(map['layers']),
      sources: listFrom<String>(map['sources']),
      private: map['private'] == true,
      lang: map['lang']?['iso6391'],
      querySize: map['querySize']?.toInt(),
    );
  }

  @override
  String toString() => 'GeocodingQuery ('
      'text: $text, '
      'parser: $parser, '
      'parsedSubject: $parsedSubject, '
      'parsedSubject: $parsedLocality, '
      'size: $size, '
      'layers: $layers, '
      'sources: $sources, '
      'private: $private, '
      'lang: $lang, '
      'querySize: $querySize'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GeocodingQuery &&
        other.text == text &&
        other.parser == parser &&
        other.parsedSubject == parsedSubject &&
        other.parsedLocality == parsedLocality &&
        other.size == size &&
        listEquals(other.layers, layers) &&
        listEquals(other.sources, sources) &&
        other.private == private &&
        other.lang == lang &&
        other.querySize == querySize;
  }

  @override
  int get hashCode => Object.hashAll([
        text,
        parser,
        parsedSubject,
        parsedLocality,
        size,
        layers,
        sources,
        private,
        lang,
        querySize,
      ]);
}

class GeocodingEngine {
  final String? name;
  final String? author;
  final String? version;

  GeocodingEngine._({
    this.name,
    this.author,
    this.version,
  });

  static GeocodingEngine? fromMap(dynamic data) {
    final map = _toMap(data, const ['name', 'author', 'version']);
    if (map == null) return null;
    return GeocodingEngine._(
      name: map['name'],
      author: map['author'],
      version: map['version'],
    );
  }

  @override
  String toString() => 'GeocodingEngine ('
      'name: $name, '
      'author: $author, '
      'version: $version'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GeocodingEngine && other.name == name && other.author == author && other.version == version;
  }

  @override
  int get hashCode => Object.hashAll([name, author, version]);
}

class GeocodingFeature {
  final GeoLocation coordinates;
  final BoundaryRect? bbox;
  final String? id;
  final String? gid;
  final String? layer;
  final String? source;
  final String? sourceId;
  final String? name;
  final String? accuracy;
  final String? country;
  final String? countryGid;
  final String? countryA;
  final String? continent;
  final String? continentGid;
  final String? label;

  final String? region;
  final String? regionGid;
  final String? regionA;

  final String? county;
  final String? countyGid;
  final String? countyA;

  final String? locality;
  final String? localityGid;
  final dynamic addendum;
  //addendum: "_InternalLinkedHashMap<String, dynamic>",

  GeocodingFeature._({
    required this.coordinates,
    required this.bbox,
    this.id,
    this.gid,
    this.layer,
    this.source,
    this.sourceId,
    this.name,
    this.accuracy,
    this.country,
    this.countryGid,
    this.countryA,
    this.continent,
    this.continentGid,
    this.label,
    this.region,
    this.regionGid,
    this.regionA,
    this.county,
    this.countyGid,
    this.countyA,
    this.locality,
    this.localityGid,
    this.addendum,
  });

  static List<GeocodingFeature> _listFrom(dynamic data) {
    List<GeocodingFeature> list = [];
    if (data != null && data is Iterable) {
      return data.map((x) => GeocodingFeature.fromMap(x)).where((x) => x != null).map((x) => x!).toList();
    }
    return list;
  }

  static GeocodingFeature? fromMap(dynamic data) {
    final map = _toMap(data);
    if (map == null) return null;
    final coordinates = _toGeoLocation(map['geometry']?['coordinates']);
    final properties = _toMap(map['properties']);
    if (coordinates == null || properties == null) return null;
    return GeocodingFeature._(
      coordinates: coordinates,
      bbox: _toBoundaryRect(map['bbox']),
      id: properties['id'],
      gid: properties['gid'],
      layer: properties['layer'],
      source: properties['source'],
      sourceId: properties['source_id'],
      name: properties['name'],
      accuracy: properties['accuracy'],
      country: properties['country'],
      countryGid: properties['country_gid'],
      countryA: properties['country_a'],
      continent: properties['continent'],
      continentGid: properties['continent_gid'],
      label: properties['label'],
      region: properties['region'],
      regionGid: properties['region_gid'],
      regionA: properties['region_a'],
      county: properties['county'],
      countyGid: properties['county_gid'],
      countyA: properties['county_a'],
      locality: properties['locality'],
      localityGid: properties['locality_gid'],
      addendum: properties['addendum'],
    );
  }

  @override
  String toString() => 'GeocodingFeature ('
      'id: $id, '
      'gid: $gid, '
      'layer: $layer, '
      'source: $source, '
      'sourceId: $sourceId, '
      'name: $name, '
      'accuracy: $accuracy, '
      'country: $country, '
      'countryGid: $countryGid, '
      'countryA: $countryA, '
      'continent: $continent, '
      'continentGid: $continentGid, '
      'label: $label, '
      'region: $region, '
      'regionGid: $regionGid, '
      'regionA: $regionA, '
      'county: $county, '
      'countyGid: $countyGid, '
      'countyA: $countyA, '
      'locality: $locality, '
      'localityGid: $localityGid'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GeocodingFeature &&
        other.coordinates == coordinates &&
        other.bbox == bbox &&
        other.id == id &&
        other.gid == gid &&
        other.layer == layer &&
        other.source == source &&
        other.sourceId == sourceId &&
        other.name == name &&
        other.accuracy == accuracy &&
        other.country == country &&
        other.countryGid == countryGid &&
        other.countryA == countryA &&
        other.continent == continent &&
        other.continentGid == continentGid &&
        other.label == label &&
        other.region == region &&
        other.regionGid == regionGid &&
        other.regionA == regionA &&
        other.county == county &&
        other.countyGid == countyGid &&
        other.countyA == countyA &&
        other.locality == locality &&
        other.localityGid == localityGid;
  }

  @override
  int get hashCode => Object.hashAll([
        coordinates,
        bbox,
        id,
        gid,
        layer,
        source,
        sourceId,
        name,
        accuracy,
        country,
        countryGid,
        countryA,
        continent,
        continentGid,
        label,
        region,
        regionGid,
        regionA,
        county,
        countyGid,
        countyA,
        locality,
        localityGid,
      ]);
}

BoundaryRect? _toBoundaryRect(dynamic input) {
  if (input == null || input is! List || input.length != 4) return null;
  return BoundaryRect(
    min: GeoLocation(lon: input[0].toDouble(), lat: input[1].toDouble()),
    max: GeoLocation(lon: input[2].toDouble(), lat: input[3].toDouble()),
  );
}

GeoLocation? _toGeoLocation(dynamic input) {
  if (input == null || input is! List || input.length != 2) return null;
  return GeoLocation(lon: input[0].toDouble(), lat: input[1].toDouble());
}

Map<String, dynamic>? _toMap(dynamic data, [List<String>? keys]) {
  if (data == null || data is! Map) return null;
  final map = data.cast<String, dynamic>();
  if (keys != null) {
    if (!keys.any((key) => map.containsKey(key))) return null;
  }
  return map;
}
