import 'dart:convert';

import 'geo_location.dart';

class Address {
  final GeoLocation? coordinates;
  final String? addressLine;
  final String? countryName;
  final String? countryCode;
  final String? featureName;
  final String? postalCode;
  final String? locality;
  final String? subLocality;
  final String? adminArea;
  final String? adminAreaCode;
  final String? subAdminArea;
  final String? thoroughfare;
  final String? subThoroughfare;

  Address({
    required this.coordinates,
    required this.addressLine,
    required this.countryName,
    required this.countryCode,
    required this.featureName,
    required this.postalCode,
    required this.locality,
    required this.subLocality,
    required this.adminArea,
    required this.adminAreaCode,
    required this.subAdminArea,
    required this.thoroughfare,
    required this.subThoroughfare,
  });

  Address copyWith({
    GeoLocation? coordinates,
    String? addressLine,
    String? countryName,
    String? countryCode,
    String? featureName,
    String? postalCode,
    String? locality,
    String? subLocality,
    String? adminArea,
    String? adminAreaCode,
    String? subAdminArea,
    String? thoroughfare,
    String? subThoroughfare,
  }) {
    return Address(
      coordinates: coordinates ?? this.coordinates,
      addressLine: addressLine ?? this.addressLine,
      countryName: countryName ?? this.countryName,
      countryCode: countryCode ?? this.countryCode,
      featureName: featureName ?? this.featureName,
      postalCode: postalCode ?? this.postalCode,
      locality: locality ?? this.locality,
      subLocality: subLocality ?? this.subLocality,
      adminArea: adminArea ?? this.adminArea,
      adminAreaCode: adminAreaCode ?? this.adminAreaCode,
      subAdminArea: subAdminArea ?? this.subAdminArea,
      thoroughfare: thoroughfare ?? this.thoroughfare,
      subThoroughfare: subThoroughfare ?? this.subThoroughfare,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'coordinates': coordinates?.toMap(),
      'addressLine': addressLine,
      'countryName': countryName,
      'countryCode': countryCode,
      'featureName': featureName,
      'postalCode': postalCode,
      'locality': locality,
      'subLocality': subLocality,
      'adminArea': adminArea,
      'adminAreaCode': adminAreaCode,
      'subAdminArea': subAdminArea,
      'thoroughfare': thoroughfare,
      'subThoroughfare': subThoroughfare,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      coordinates: GeoLocation.fromMap(map["coordinates"]),
      addressLine: map['addressLine'],
      countryName: map['countryName'],
      countryCode: map['countryCode'],
      featureName: map['featureName'],
      postalCode: map['postalCode'],
      locality: map['locality'],
      subLocality: map['subLocality'],
      adminArea: map['adminArea'],
      adminAreaCode: map['adminAreaCode'],
      subAdminArea: map['subAdminArea'],
      thoroughfare: map['thoroughfare'],
      subThoroughfare: map['subThoroughfare'],
    );
  }

  static List<Address> fromList(dynamic result) {
    final List list = jsonDecode(jsonEncode(result));
    return list.map((x) => Address.fromMap(x)).toList();
  }

  @override
  String toString() => 'Address ('
      'coordinates: $coordinates, '
      'addressLine: $addressLine, '
      'countryName: $countryName, '
      'countryCode: $countryCode, '
      'featureName: $featureName, '
      'postalCode: $postalCode, '
      'locality: $locality, '
      'subLocality: $subLocality, '
      'adminArea: $adminArea, '
      'adminAreaCode: $adminAreaCode, '
      'subAdminArea: $subAdminArea, '
      'thoroughfare: $thoroughfare, '
      'subThoroughfare: $subThoroughfare'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Address &&
        other.coordinates == coordinates &&
        other.addressLine == addressLine &&
        other.countryName == countryName &&
        other.countryCode == countryCode &&
        other.featureName == featureName &&
        other.postalCode == postalCode &&
        other.locality == locality &&
        other.subLocality == subLocality &&
        other.adminArea == adminArea &&
        other.adminAreaCode == adminAreaCode &&
        other.subAdminArea == subAdminArea &&
        other.thoroughfare == thoroughfare &&
        other.subThoroughfare == subThoroughfare;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      coordinates,
      addressLine,
      countryName,
      countryCode,
      featureName,
      postalCode,
      locality,
      subLocality,
      adminArea,
      adminAreaCode,
      subAdminArea,
      thoroughfare,
      subThoroughfare,
    ]);
  }
}
