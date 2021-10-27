import 'dart:convert';

import 'utils/http.dart';
import 'types/elevation_line_params.dart';
import 'types/elevation_point_params.dart';

class ElevationService {
  Future<dynamic> lineElevation(ElevationLineParams params) async {
    final res = await Http.post('elevation/line', params.toMap());
    //print(res.body);
    return jsonDecode(res.body);
  }

  Future<dynamic> pointElevation(ElevationPointParams params) async {
    final res = await Http.post('elevation/point', params.toMap());
    //print(res.body);
    return jsonDecode(res.body);
  }
}
