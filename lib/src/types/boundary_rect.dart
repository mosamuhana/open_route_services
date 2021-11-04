import 'geo_location.dart';

class BoundaryRect {
  final GeoLocation min;
  final GeoLocation max;

  BoundaryRect({
    required this.min,
    required this.max,
  });

  BoundaryRect copyWith({
    GeoLocation? min,
    GeoLocation? max,
  }) {
    return BoundaryRect(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }

  Map<String, String> toQueryMap() {
    return {
      'boundary.rect.min_lon': min.lon.toString(),
      'boundary.rect.min_lat': min.lat.toString(),
      'boundary.rect.max_lon': max.lon.toString(),
      'boundary.rect.max_lat': max.lat.toString(),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'min': min.toMap(),
      'max': max.toMap(),
    };
  }

  @override
  String toString() => 'BoundaryRect (min: $min, max: $max)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BoundaryRect && other.min == min && other.max == max;
  }

  @override
  int get hashCode => Object.hashAll([min, max]);
}
