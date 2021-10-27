import '../utils/index.dart' show cleanMap;

class RoundTrip {
  final int length;
  final int points;
  final int seed;

  RoundTrip({
    required this.length,
    required this.points,
    required this.seed,
  });

  RoundTrip copyWith({
    int? length,
    int? points,
    int? seed,
  }) {
    return RoundTrip(
      length: length ?? this.length,
      points: points ?? this.points,
      seed: seed ?? this.seed,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'length': length,
      'points': points,
      'seed': seed,
    });
  }

  @override
  String toString() => 'RoundTrip ('
      'length: $length, '
      'points: $points, '
      'seed: $seed'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RoundTrip &&
        other.length == length &&
        other.points == points &&
        other.seed == seed;
  }

  @override
  int get hashCode => Object.hashAll([length, points, seed]);
}
