import 'dart:convert';

import 'utils/enum_utils.dart';
import 'utils/http.dart';
import 'types/profile.dart';
import 'types/matrix_params.dart';

class MatrixService {
  Future<dynamic> calculate(MatrixParams params, Profile? profile) async {
    if (params.locations.length < 2) {
      throw Exception("'locations' property is required.");
    }

    final res = await Http.post(
      'v2/matrix/${EnumUtils.toStrng(profile ?? Profile.drivingCar)}',
      params.toMap(),
    );
    //print(res.body);
    return jsonDecode(res.body);
  }
}
