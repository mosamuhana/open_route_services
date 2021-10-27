class AlternativeRoutes {
  final int shareFactor;
  final int targetCount;
  final int weightFactor;

  AlternativeRoutes({
    required this.shareFactor,
    required this.targetCount,
    required this.weightFactor,
  });

  AlternativeRoutes copyWith({
    int? shareFactor,
    int? targetCount,
    int? weightFactor,
  }) {
    return AlternativeRoutes(
      shareFactor: shareFactor ?? this.shareFactor,
      targetCount: targetCount ?? this.targetCount,
      weightFactor: weightFactor ?? this.weightFactor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'shareFactor': shareFactor,
      'targetCount': targetCount,
      'weightFactor': weightFactor,
    };
  }

  factory AlternativeRoutes.fromMap(Map<String, dynamic> map) {
    return AlternativeRoutes(
      shareFactor: map['shareFactor']?.toInt(),
      targetCount: map['targetCount']?.toInt(),
      weightFactor: map['weightFactor']?.toInt(),
    );
  }

  @override
  String toString() =>
      'AlternativeRoutes (shareFactor: $shareFactor, targetCount: $targetCount, weightFactor: $weightFactor)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AlternativeRoutes &&
        other.shareFactor == shareFactor &&
        other.targetCount == targetCount &&
        other.weightFactor == weightFactor;
  }

  @override
  int get hashCode => Object.hashAll([shareFactor, targetCount, weightFactor]);
}
