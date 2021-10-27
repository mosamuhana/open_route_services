import 'package:flutter/foundation.dart';

import 'avoid_borders.dart';
import 'avoid_features.dart';
import 'roundtrip.dart';
import '../utils/enum_utils.dart';
import '../utils/index.dart' show cleanMap;

class CustomOptions {
  final AvoidBorders? avoidBorders;
  final List<int> avoidCountries;
  final List<AvoidFeatures>? avoidFeatures;
  final String? avoidPolygons;
  final RoundTrip? roundTrip;

  CustomOptions({
    required this.avoidBorders,
    required this.avoidCountries,
    required this.avoidFeatures,
    required this.avoidPolygons,
    required this.roundTrip,
  });

  CustomOptions copyWith({
    AvoidBorders? avoidBorders,
    List<int>? avoidCountries,
    List<AvoidFeatures>? avoidFeatures,
    String? avoidPolygons,
    RoundTrip? roundTrip,
  }) {
    return CustomOptions(
      avoidBorders: avoidBorders ?? this.avoidBorders,
      avoidCountries: avoidCountries ?? this.avoidCountries,
      avoidFeatures: avoidFeatures ?? this.avoidFeatures,
      avoidPolygons: avoidPolygons ?? this.avoidPolygons,
      roundTrip: roundTrip ?? this.roundTrip,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'avoid_borders': EnumUtils.toStrng(avoidBorders),
      'avoid_countries': avoidCountries,
      'avoid_features': EnumUtils.toStrngList(avoidFeatures),
      'avoid_polygons': avoidPolygons,
      'round_trip': roundTrip?.toMap(),
    });
  }

  @override
  String toString() => 'CustomOptions ('
      'avoidBorders: $avoidBorders, '
      'avoidCountries: $avoidCountries, '
      'avoidFeatures: $avoidFeatures, '
      'avoidPolygons: $avoidPolygons, '
      'roundTrip: $roundTrip'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomOptions &&
        other.avoidBorders == avoidBorders &&
        listEquals(other.avoidCountries, avoidCountries) &&
        listEquals(other.avoidFeatures, avoidFeatures) &&
        other.avoidPolygons == avoidPolygons &&
        other.roundTrip == roundTrip;
  }

  @override
  int get hashCode => Object.hashAll([
        avoidBorders,
        avoidCountries,
        avoidFeatures,
        avoidPolygons,
        roundTrip,
      ]);
}
