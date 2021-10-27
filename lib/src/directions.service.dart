import 'dart:convert';

import 'utils/enum_utils.dart';
import 'utils/http.dart';
import 'types/geo_location.dart';
import 'types/profile.dart';
import 'types/format.dart';
import 'types/directions_post_params.dart';

class DirectionsService {
  Future<dynamic> get({
    required GeoLocation start,
    required GeoLocation end,
    Profile? profile,
  }) async {
    final path =
        'v2/directions/${EnumUtils.toStrng(profile ?? Profile.drivingCar)}';
    final res = await Http.get(path, {
      'start': start.asStringPair,
      'end': end.asStringPair,
    });
    //print(res.body);
    return jsonDecode(res.body);
  }

  Future<dynamic> post({
    required DirectionsPostParams params,
    Profile? profile,
    Format? format,
  }) async {
    final path =
        'v2/directions/${EnumUtils.toStrng(profile ?? Profile.drivingCar)}' +
            (format == null ? '/format' : '');
    final res = await Http.post(path, params.toMap());
    //print(res.body);
    return jsonDecode(res.body);
  }
}
