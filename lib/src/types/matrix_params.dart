import 'package:flutter/foundation.dart';

import 'geo_location.dart';
import 'matrix_metrics.dart';
import 'unit.dart';
import '../utils/enum_utils.dart';
import '../utils/index.dart' show cleanMap;

class MatrixParams {
  final List<GeoLocation> locations;
  final String? destinations;
  final String? id;
  final List<MatrixMetrics>? metrics;
  final List<String>? metricsStrings;
  final bool? resolveLocations;
  final String? sources;
  final Unit? units;

  MatrixParams({
    required this.locations,
    this.destinations,
    this.id,
    this.metrics,
    this.metricsStrings,
    this.resolveLocations,
    this.sources,
    this.units,
  });

  MatrixParams copyWith({
    List<GeoLocation>? locations,
    String? destinations,
    String? id,
    List<MatrixMetrics>? metrics,
    List<String>? metricsStrings,
    bool? resolveLocations,
    String? sources,
    Unit? units,
  }) {
    return MatrixParams(
      locations: locations ?? this.locations,
      destinations: destinations ?? this.destinations,
      id: id ?? this.id,
      metrics: metrics ?? this.metrics,
      metricsStrings: metricsStrings ?? this.metricsStrings,
      resolveLocations: resolveLocations ?? this.resolveLocations,
      sources: sources ?? this.sources,
      units: units ?? this.units,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'locations': locations,
      'destinations': destinations,
      'id': id,
      'metrics': EnumUtils.toStrngList(metrics),
      'metricsStrings': metricsStrings, // as is from service
      'resolve_locations':
          resolveLocations == null ? null : resolveLocations!.toString(),
      'sources': sources,
      'units': EnumUtils.toStrng(units),
    });
  }

  @override
  String toString() => 'MatrixParams ('
      'locations: $locations, '
      'destinations: $destinations, '
      'id: $id, '
      'metrics: $metrics, '
      'metricsStrings: $metricsStrings, '
      'resolveLocations: $resolveLocations, '
      'sources: $sources, '
      'units: $units'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MatrixParams &&
        listEquals(other.locations, locations) &&
        other.destinations == destinations &&
        other.id == id &&
        listEquals(other.metrics, metrics) &&
        listEquals(other.metricsStrings, metricsStrings) &&
        other.resolveLocations == resolveLocations &&
        other.sources == sources &&
        other.units == units;
  }

  @override
  int get hashCode => Object.hashAll([
        locations,
        destinations,
        id,
        metrics,
        metricsStrings,
        resolveLocations,
        sources,
        units,
      ]);
}
