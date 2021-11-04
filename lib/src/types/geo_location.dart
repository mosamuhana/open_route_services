class GeoLocation {
  final double lon;
  final double lat;

  GeoLocation({
    required this.lon,
    required this.lat,
  });

  GeoLocation copyWith({
    double? lon,
    double? lat,
  }) {
    return GeoLocation(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  Map<String, String> toQueryPoint() {
    return {
      'point.lon': lon.toString(),
      'point.lat': lat.toString(),
    };
  }

  Map<String, String> toQueryFocusPoint() {
    return {
      'focus.point.lon': lon.toString(),
      'focus.point.lat': lat.toString(),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }

  String get asStringPair => '$lon,$lat';

  factory GeoLocation.fromMap(Map<String, dynamic> map) {
    return GeoLocation(
      lon: map['lon']?.toDouble() ?? 0.0,
      lat: map['lat']?.toDouble() ?? 0.0,
    );
  }

  static List<GeoLocation>? fromList(dynamic list) {
    if (list is! Iterable) return null;
    final a = list.map((x) => GeoLocation.fromMap(x)).toList();
    return a;
  }

  @override
  String toString() => 'GeoLocation (lon: $lon, lat: $lat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GeoLocation && other.lon == lon && other.lat == lat;
  }

  @override
  int get hashCode => Object.hashAll([lon, lat]);
}
