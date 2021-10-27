import 'package:flutter/foundation.dart';

import 'pois_request.dart';
import 'pois_sortby.dart';
import 'boundary_rect.dart';
import '../utils/index.dart' show cleanMap, cleanList;
import '../utils/enum_utils.dart';

class PoisParams {
  final PoisRequest? request;
  final PoisGeometry? geometry;
  final PoisFilters? filters;
  final int? limit;
  final PoisSortby? sortBy;

  PoisParams({
    required this.request,
    this.geometry,
    this.filters,
    this.limit,
    this.sortBy,
  });

  PoisParams copyWith({
    PoisRequest? request,
    PoisGeometry? geometry,
    PoisFilters? filters,
    int? limit,
    PoisSortby? sortBy,
  }) {
    return PoisParams(
      request: request ?? this.request,
      geometry: geometry ?? this.geometry,
      filters: filters ?? this.filters,
      limit: limit ?? this.limit,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'request': EnumUtils.toStrng(request),
      'geometry': geometry?.toMap(),
      'filters': filters?.toMap(),
      'limit': limit,
      'sortby': EnumUtils.toStrng(sortBy),
    });
  }

  @override
  String toString() => 'PoisParams ('
      'request: $request, '
      'geometry: $geometry, '
      'filters: $filters, '
      'limit: $limit, '
      'sortBy: $sortBy'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PoisParams &&
        other.request == request &&
        other.geometry == geometry &&
        other.filters == filters &&
        other.limit == limit &&
        other.sortBy == sortBy;
  }

  @override
  int get hashCode =>
      Object.hashAll([request, geometry, filters, limit, sortBy]);
}

class PoisGeometry {
  final List<BoundaryRect>? bbox;
  final int? buffer;
  final dynamic geojson;

  PoisGeometry({
    this.bbox,
    this.buffer,
    this.geojson,
  });

  PoisGeometry copyWith({
    List<BoundaryRect>? bbox,
    int? buffer,
    dynamic geojson,
  }) {
    return PoisGeometry(
      bbox: bbox ?? this.bbox,
      buffer: buffer ?? this.buffer,
      geojson: geojson ?? this.geojson,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'bbox': bbox?.map((x) => x.toMap()).toList(),
      'buffer': buffer,
      'geojson': geojson,
    });
  }

  @override
  String toString() => 'PoisGeometry ('
      'bbox: $bbox, '
      'buffer: $buffer'
      'geojson: $geojson, '
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PoisGeometry &&
        listEquals(other.bbox, bbox) &&
        other.buffer == buffer &&
        other.geojson == geojson;
  }

  @override
  int get hashCode => Object.hashAll([bbox, geojson, buffer]);
}

class PoisFilters {
  final List<int>? categoryGroupIds;
  final List<int>? categoryIds;
  final List<String>? name;
  final List<String>? wheelchair;
  final List<String>? smoking;
  final List<String>? fee;

  PoisFilters({
    required this.categoryGroupIds,
    required this.categoryIds,
    required this.name,
    required this.wheelchair,
    required this.smoking,
    required this.fee,
  });

  PoisFilters copyWith({
    List<int>? categoryGroupIds,
    List<int>? categoryIds,
    List<String>? name,
    List<String>? wheelchair,
    List<String>? smoking,
    List<String>? fee,
  }) {
    return PoisFilters(
      categoryGroupIds: categoryGroupIds ?? this.categoryGroupIds,
      categoryIds: categoryIds ?? this.categoryIds,
      name: name ?? this.name,
      wheelchair: wheelchair ?? this.wheelchair,
      smoking: smoking ?? this.smoking,
      fee: fee ?? this.fee,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'category_group_ids': cleanList(categoryGroupIds),
      'category_ids': cleanList(categoryIds),
      'name':cleanList(name),
      'wheelchair': cleanList(wheelchair),
      'smoking': cleanList(smoking),
      'fee': cleanList(fee),
    });
  }

  @override
  String toString() => 'PoisFilters ('
      'categoryGroupIds: $categoryGroupIds, '
      'categoryIds: $categoryIds, '
      'name: $name, '
      'wheelchair: $wheelchair, '
      'smoking: $smoking, '
      'fee: $fee'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PoisFilters &&
        listEquals(other.categoryGroupIds, categoryGroupIds) &&
        listEquals(other.categoryIds, categoryIds) &&
        listEquals(other.name, name) &&
        listEquals(other.wheelchair, wheelchair) &&
        listEquals(other.smoking, smoking) &&
        listEquals(other.fee, fee);
  }

  @override
  int get hashCode => Object.hashAll([
        categoryGroupIds,
        categoryIds,
        name,
        wheelchair,
        smoking,
        fee,
      ]);
}
