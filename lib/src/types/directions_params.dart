import 'geo_location.dart';
import 'custom_options.dart';
import 'directions_attribute.dart';
import 'extra_info.dart';
import 'instructions_format.dart';
import 'directions_preference.dart';
import 'unit.dart';
import 'alternative_routes.dart';
import '../utils/enum_utils.dart';
import '../utils/index.dart' show cleanMap, cleanList, listEquals;

class DirectionsParams {
  final List<GeoLocation> coordinates;
  final List<DirectionsAttribute>? attributes;
  final bool? continueStraight;
  final bool? elevation;
  final List<ExtraInfo>? extraInfo;
  final bool? geometrySimplify;
  final String? id;
  final bool? instructions;
  final InstructionsFormat? instructionsFormat;
  final String? language;
  final bool? maneuvers;
  final DirectionsPreference? preference;
  final List<int>? radiuses;
  final bool? roundAboutExits;
  final List<int>? skipSegments;
  final bool? suppressWarnings;
  final Unit? units;
  final bool? geometry;
  final double? maximumSpeed;
  final AlternativeRoutes? alternativeRoutes;
  final CustomOptions? options;

  DirectionsParams({
    required this.coordinates,
    this.attributes,
    this.continueStraight,
    this.elevation,
    this.extraInfo,
    this.geometrySimplify,
    this.id,
    this.instructions,
    this.instructionsFormat,
    this.language,
    this.maneuvers,
    this.preference,
    this.radiuses,
    this.roundAboutExits,
    this.skipSegments,
    this.suppressWarnings,
    this.units,
    this.geometry,
    this.maximumSpeed,
    this.alternativeRoutes,
    this.options,
  });

  DirectionsParams copyWith({
    List<GeoLocation>? coordinates,
    List<DirectionsAttribute>? attributes,
    bool? continueStraight,
    bool? elevation,
    List<ExtraInfo>? extraInfo,
    bool? geometrySimplify,
    String? id,
    bool? instructions,
    InstructionsFormat? instructionsFormat,
    String? language,
    bool? maneuvers,
    DirectionsPreference? preference,
    List<int>? radiuses,
    bool? roundAboutExits,
    List<int>? skipSegments,
    bool? suppressWarnings,
    Unit? units,
    bool? geometry,
    double? maximumSpeed,
    AlternativeRoutes? alternativeRoutes,
    CustomOptions? options,
  }) {
    return DirectionsParams(
      coordinates: coordinates ?? this.coordinates,
      attributes: attributes ?? this.attributes,
      continueStraight: continueStraight ?? this.continueStraight,
      elevation: elevation ?? this.elevation,
      extraInfo: extraInfo ?? this.extraInfo,
      geometrySimplify: geometrySimplify ?? this.geometrySimplify,
      id: id ?? this.id,
      instructions: instructions ?? this.instructions,
      instructionsFormat: instructionsFormat ?? this.instructionsFormat,
      language: language ?? this.language,
      maneuvers: maneuvers ?? this.maneuvers,
      preference: preference ?? this.preference,
      radiuses: radiuses ?? this.radiuses,
      roundAboutExits: roundAboutExits ?? this.roundAboutExits,
      skipSegments: skipSegments ?? this.skipSegments,
      suppressWarnings: suppressWarnings ?? this.suppressWarnings,
      units: units ?? this.units,
      geometry: geometry ?? this.geometry,
      maximumSpeed: maximumSpeed ?? this.maximumSpeed,
      alternativeRoutes: alternativeRoutes ?? this.alternativeRoutes,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'coordinates': coordinates.map((x) => x.toMap()).toList(),
      'attributes': attributes == null ? null : EnumUtils.toStrngList(attributes),
      'continue_straight': continueStraight?.toString(),
      'elevation': elevation?.toString(),
      'extra_info': extraInfo == null ? null : EnumUtils.toStrngList(extraInfo),
      'geometry_simplify': geometrySimplify?.toString(),
      'id': id,
      'instructions': instructions?.toString(),
      'instructions_format': EnumUtils.toStrng(instructionsFormat),
      'language': language,
      'maneuvers': maneuvers == null ? null : maneuvers!.toString(),
      'preference': EnumUtils.toStrng(preference),
      'radiuses': cleanList(radiuses),
      'roundabout_exits': roundAboutExits?.toString(),
      'skip_segments': cleanList(skipSegments),
      'suppress_warnings': suppressWarnings?.toString(),
      'units': EnumUtils.toStrng(units),
      'geometry': geometry?.toString(),
      'maximum_speed': maximumSpeed,
      'alternative_routes': alternativeRoutes?.toMap(),
      'options': options?.toMap(),
    });
  }

  @override
  String toString() => 'DirectionsPostParams ('
      'coordinates: $coordinates, '
      'attributes: $attributes, '
      'continueStraight: $continueStraight, '
      'elevation: $elevation, '
      'extraInfo: $extraInfo, '
      'geometrySimplify: $geometrySimplify, '
      'id: $id, '
      'instructions: $instructions, '
      'instructionsFormat: $instructionsFormat, '
      'language: $language, '
      'maneuvers: $maneuvers, '
      'preference: $preference, '
      'radiuses: $radiuses, '
      'roundaboutExits: $roundAboutExits, '
      'skipSegments: $skipSegments, '
      'suppressWarnings: $suppressWarnings, '
      'units: $units, '
      'geometry: $geometry, '
      'maximumSpeed: $maximumSpeed, '
      'alternativeRoutes: $alternativeRoutes, '
      'options: $options'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DirectionsParams &&
        listEquals(other.coordinates, coordinates) &&
        listEquals(other.attributes, attributes) &&
        other.continueStraight == continueStraight &&
        other.elevation == elevation &&
        listEquals(other.extraInfo, extraInfo) &&
        other.geometrySimplify == geometrySimplify &&
        other.id == id &&
        other.instructions == instructions &&
        other.instructionsFormat == instructionsFormat &&
        other.language == language &&
        other.maneuvers == maneuvers &&
        other.preference == preference &&
        listEquals(other.radiuses, radiuses) &&
        other.roundAboutExits == roundAboutExits &&
        listEquals(other.skipSegments, skipSegments) &&
        other.suppressWarnings == suppressWarnings &&
        other.units == units &&
        other.geometry == geometry &&
        other.maximumSpeed == maximumSpeed &&
        other.alternativeRoutes == alternativeRoutes &&
        other.options == options;
  }

  @override
  int get hashCode => Object.hashAll([
        coordinates,
        attributes,
        continueStraight,
        elevation,
        extraInfo,
        geometrySimplify,
        id,
        instructions,
        instructionsFormat,
        language,
        maneuvers,
        preference,
        radiuses,
        roundAboutExits,
        skipSegments,
        suppressWarnings,
        units,
        geometry,
        maximumSpeed,
        alternativeRoutes,
        options,
      ]);
}
