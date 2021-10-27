import 'package:flutter/foundation.dart';

import 'geo_location.dart';
import 'custom_options.dart';
import 'unit.dart';
import 'location_type.dart';
import 'range_type.dart';
import 'isochrones_attribute.dart';

import '../utils/enum_utils.dart';

class IsochronesRequestParams {
  final List<GeoLocation> locations;
  final List<int> range;
  final List<IsochronesAttribute>? attributes;
  final String? id;
  final bool? intersections;
  final int? interval;
  final LocationType? locationType;
  final RangeType? rangeType;
  final int? smoothing;
  final Unit? areaUnits;
  final Unit? units;
  final CustomOptions? options;

  IsochronesRequestParams({
    required this.locations,
    required this.range,
    this.attributes,
    this.id,
    this.intersections,
    this.interval,
    this.locationType,
    this.rangeType,
    this.smoothing,
    this.areaUnits,
    this.units,
    this.options,
  });

  IsochronesRequestParams copyWith({
    List<GeoLocation>? locations,
    List<int>? range,
    List<IsochronesAttribute>? attributes,
    String? id,
    bool? intersections,
    int? interval,
    LocationType? locationType,
    RangeType? rangeType,
    int? smoothing,
    Unit? areaUnits,
    Unit? units,
    CustomOptions? options,
  }) {
    return IsochronesRequestParams(
      locations: locations ?? this.locations,
      range: range ?? this.range,
      attributes: attributes ?? this.attributes,
      id: id ?? this.id,
      intersections: intersections ?? this.intersections,
      interval: interval ?? this.interval,
      locationType: locationType ?? this.locationType,
      rangeType: rangeType ?? this.rangeType,
      smoothing: smoothing ?? this.smoothing,
      areaUnits: areaUnits ?? this.areaUnits,
      units: units ?? this.units,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'locations': locations.map((x) => x.toMap()).toList(),
      'range': range,
      'attributes': EnumUtils.toStrngList(attributes),
      'id': id,
      'intersections': intersections == null ? null : intersections!.toString(),
      'interval': interval,
      'location_type': EnumUtils.toStrng(locationType),
      'range_type': EnumUtils.toStrng(rangeType),
      'smoothing': smoothing,
      'area_units': EnumUtils.toStrng(areaUnits),
      'units': EnumUtils.toStrng(units),
      'options': options?.toMap(),
    };
  }

  @override
  String toString() {
    return 'IsochronesRequestParams ('
        'locations: $locations, '
        'range: $range, '
        'attributes: $attributes, '
        'id: $id, '
        'intersections: $intersections, '
        'interval: $interval, '
        'locationType: $locationType, '
        'rangeType: $rangeType, '
        'smoothing: $smoothing, '
        'areaUnits: $areaUnits, '
        'units: $units, '
        'options: $options'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IsochronesRequestParams &&
        listEquals(other.locations, locations) &&
        listEquals(other.range, range) &&
        listEquals(other.attributes, attributes) &&
        other.id == id &&
        other.intersections == intersections &&
        other.interval == interval &&
        other.locationType == locationType &&
        other.rangeType == rangeType &&
        other.smoothing == smoothing &&
        other.areaUnits == areaUnits &&
        other.units == units &&
        other.options == options;
  }

  @override
  int get hashCode => Object.hashAll([
        locations,
        range,
        attributes,
        id,
        intersections,
        interval,
        locationType,
        rangeType,
        smoothing,
        areaUnits,
        units,
        options,
      ]);
}
