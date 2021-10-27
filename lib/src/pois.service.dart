import 'dart:convert' show jsonDecode;

import 'utils/http.dart';
import 'types/pois_params.dart';
import 'types/pois_request.dart';

class PoisService {
  Future<dynamic> calculate(PoisParams params) async {
    if ((params.request == PoisRequest.stats ||
            params.request == PoisRequest.pois) &&
        params.geometry == null) {
      throw Exception("'geometry' params is required");
    }

    if (params.request == PoisRequest.list) {
      params = params.copyWith(request: PoisRequest.list);
    } else if (params.request == PoisRequest.stats) {
      params = params.copyWith(
        request: PoisRequest.list,
        geometry: params.geometry,
      );
    }

    final res = await Http.post('pois', params.toMap());
    //print(res.body);
    return jsonDecode(res.body);
  }
}
