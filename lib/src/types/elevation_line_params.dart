import 'elevation_line_format.dart';

import '../utils/enum_utils.dart';
import '../utils/index.dart' show cleanMap;

class ElevationLineParams {
  final ElevationLineFormat formatIn;
  final String geometry;
  final ElevationLineFormat? formatOut;
  final String? dataset;

  ElevationLineParams({
    required this.formatIn,
    required this.geometry,
    this.formatOut,
    this.dataset,
  });

  ElevationLineParams copyWith({
    ElevationLineFormat? formatIn,
    ElevationLineFormat? formatOut,
    String? dataset,
    String? geometry,
  }) {
    return ElevationLineParams(
      formatIn: formatIn ?? this.formatIn,
      formatOut: formatOut ?? this.formatOut,
      dataset: dataset ?? this.dataset,
      geometry: geometry ?? this.geometry,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'formatIn': EnumUtils.toStrng(formatIn),
      'formatOut': EnumUtils.toStrng(formatOut),
      'dataset': dataset,
      'geometry': geometry,
    });
  }

  @override
  String toString() => 'ElevationLineParams ('
      'formatIn: $formatIn, '
      'formatOut: $formatOut, '
      'dataset: $dataset, '
      'geometry: $geometry'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ElevationLineParams &&
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
