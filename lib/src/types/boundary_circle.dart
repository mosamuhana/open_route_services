import 'geo_location.dart';

class BoundaryCircle {
  final GeoLocation center;
  final double radius;

  BoundaryCircle({
    required this.center,
    required this.radius,
  });

  BoundaryCircle copyWith({
    GeoLocation? center,
    double? radius,
  }) {
    return BoundaryCircle(
      center: center ?? this.center,
      radius: radius ?? this.radius,
    );
  }

  Map<String, String> toQueryMap() {
    return {
      'boundary.circle.lon': center.lon.toString(),
      'boundary.circle.lat': center.lat.toString(),
      'boundary.circle.radius': radius.toString(),
    };
  }

  Map<String, dynamic>? toMap() {
    return {
      'center': center.toMap(),
      'radius': radius,
    };
  }

  @override
  String toString() => 'BoundaryCircle (center: $center, radius: $radius)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BoundaryCircle &&
        other.center == center &&
        other.radius == radius;
  }

  @override
  int get hashCode => Object.hashAll([center, radius]);
}
