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

  Map<String, dynamic> toMap() {
    return {
      'min': min.toMap(),
      'max': max.toMap(),
    };
  }

  factory BoundaryRect.fromMap(Map<String, dynamic> map) {
    return BoundaryRect(
      min: GeoLocation.fromMap(map['min']),
      max: GeoLocation.fromMap(map['max']),
    );
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
