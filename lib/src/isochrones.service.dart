import 'dart:convert';

import 'types/isochrones_request_params.dart';
import 'types/profile.dart';
import 'utils/enum_utils.dart';
import 'utils/http.dart';

class IsochronesService {
  Future<dynamic> calculate(
      IsochronesRequestParams params, Profile? profile) async {
    if (params.locations.length < 2) {
      throw Exception("'locations' property is required.");
    }
    if (params.range.length != 2) {
      throw Exception("'range' property is required.");
    }

    final res = await Http.post(
      'v2/isochrones/${EnumUtils.toStrng(profile ?? Profile.drivingCar)}',
      params.toMap(),
    );
    //print(res.body);
    return jsonDecode(res.body);
  }
}
