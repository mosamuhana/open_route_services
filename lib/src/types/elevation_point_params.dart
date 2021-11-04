import 'elevation_point_format.dart';

import '../utils/enum_utils.dart';
import '../utils/index.dart' show cleanMap;

class ElevationPointParams {
  final ElevationPointFormat formatIn;
  final String geometry;
  final ElevationPointFormat? formatOut;
  final String? dataset;

  ElevationPointParams({
    required this.formatIn,
    required this.geometry,
    this.formatOut,
    this.dataset,
  });

  ElevationPointParams copyWith({
    ElevationPointFormat? formatIn,
    ElevationPointFormat? formatOut,
    String? dataset,
    String? geometry,
  }) {
    return ElevationPointParams(
      formatIn: formatIn ?? this.formatIn,
      formatOut: formatOut ?? this.formatOut,
      dataset: dataset ?? this.dataset,
      geometry: geometry ?? this.geometry,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'format_in': EnumUtils.toStrng(formatIn),
      'format_out': EnumUtils.toStrng(formatOut),
      'dataset': dataset,
      'geometry': geometry,
    });
  }

  @override
  String toString() => 'ElevationPointParams ('
      'formatIn: $formatIn, '
      'formatOut: $formatOut, '
      'dataset: $dataset, '
      'geometry: $geometry'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ElevationPointParams &&
        other.formatIn == formatIn &&
        other.formatOut == formatOut &&
        other.dataset == dataset &&
        other.geometry == geometry;
  }

  @override
  int get hashCode => Object.hashAll([
        formatIn,
        formatOut,
        dataset,
        geometry,
      ]);
}
