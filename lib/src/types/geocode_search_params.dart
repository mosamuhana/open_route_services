import 'package:flutter/foundation.dart';

import 'boundary_rect.dart';
import 'boundary_circle.dart';
import 'geo_location.dart';
import 'source.dart';
import 'layer.dart';
import '../utils/enum_utils.dart';

/*
  "'null' is an invalid layers parameter. Valid options: coarse,address,venue,street,country,macroregion,region,county,localadmin,locality,borough,neighbourhood,continent,empire,dependency,macrocounty,macrohood,microhood,disputed,postalcode,ocean,marinearea",
  "'null' is an invalid sources parameter. Valid options: osm,oa,gn,wof,no_gn,openstreetmap,openaddresses,geonames,whosonfirst"
*/

class GeocodeSearchParams {
  final List<ServiceSource> sources;
  final List<ServiceLayer> layers;
  final String? text;
  final GeoLocation? point;
  final BoundaryRect? rect;
  final BoundaryCircle? circle;
  final String? country;
  final String? gid;
  final GeoLocation? focus;
  final int? size;

  GeocodeSearchParams({
    required this.sources,
    required this.layers,
    this.text,
    this.point,
    this.rect,
    this.circle,
    this.country,
    this.gid,
    this.focus,
    this.size,
  });

  GeocodeSearchParams copyWith({
    List<ServiceSource>? sources,
    List<ServiceLayer>? layers,
    String? text,
    GeoLocation? point,
    BoundaryRect? rect,
    BoundaryCircle? circle,
    String? country,
    String? gid,
    GeoLocation? focus,
    int? size,
  }) {
    return GeocodeSearchParams(
      sources: sources ?? this.sources,
      text: text ?? this.text,
      point: point ?? this.point,
      layers: layers ?? this.layers,
      rect: rect ?? this.rect,
      circle: circle ?? this.circle,
      country: country ?? this.country,
      gid: gid ?? this.gid,
      focus: focus ?? this.focus,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toQueryMap() {
    return {
      'sources': EnumUtils.toStrngList(sources)!.join(','),
      'layers': EnumUtils.toStrngList(layers)!.join(','),
      'text': text,
      'point.lon': point?.lon,
      'point.lat': point?.lat,
      'rect': rect?.toMap(),
      'circle': circle?.toMap(),
      'country': country,
      'gid': gid,
      'focus': focus?.toMap(),
      'size': size,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'sources': EnumUtils.toStrngList(sources)!.join(','),
      'layers': EnumUtils.toStrngList(layers)!.join(','),
      'text': text,
      'point': point?.toMap(),
      'rect': rect?.toMap(),
      'circle': circle?.toMap(),
      'country': country,
      'gid': gid,
      'focus': focus?.toMap(),
      'size': size,
    };
  }

  /*
  factory GeocodeSearchParams.fromMap(Map<String, dynamic> map) {
    final rect = map['rect'];
    final circle = map['circle'];
    final point = map['point'];
    final focus = map['focus'];
    return GeocodeSearchParams(
      rect: rect == null ? null : BoundaryRect.fromMap(rect),
      circle: circle == null ? null : BoundaryCircle.fromMap(circle),
      country: map['country'],
      gid: map['gid'],
      text: map['text'],
      point: point == null ? null : GeoLocation.fromMap(point),
      focus: focus == null ? null : GeoLocation.fromMap(focus),
      sources: List<String>.from(map['sources']),
      layers: List<String>.from(map['layers']),
      size: map['size']?.toInt(),
    );
  }
  */

  @override
  String toString() {
    return 'GeocodeSearchParams(rect: $rect, circle: $circle, country: $country, gid: $gid, text: $text, point: $point, focus: $focus, sources: $sources, layers: $layers, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GeocodeSearchParams &&
        other.rect == rect &&
        other.circle == circle &&
        other.country == country &&
        other.gid == gid &&
        other.text == text &&
        other.point == point &&
        other.focus == focus &&
        listEquals(other.sources, sources) &&
        listEquals(other.layers, layers) &&
        other.size == size;
  }

  @override
  int get hashCode => Object.hashAll([
        rect,
        circle,
        country,
        gid,
        text,
        point,
        focus,
        sources,
        layers,
        size,
      ]);
}
