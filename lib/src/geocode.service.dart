import 'dart:convert';

import 'types/geocode_params.dart';
import 'types/address.dart';
import 'types/geocode_result.dart';
import 'utils.dart';

class GeocodeService {
  Future<List<Address>> search(GeocodeParams params) async {
    if (params.text == null) throw Exception("'text' param required");
    final res = await Http.get('geocode/search', params.toQueryMap());
    //print(res.body);
    //return jsonDecode(res.body);
    return Address.listFromJson(res.body);
  }

  Future<List<Address>> reverse(GeocodeParams params) async {
    if (params.point == null) throw Exception("'point' param required");
    final res = await Http.get('geocode/reverse', params.toQueryMap());
    //print(res.body);
    //return jsonDecode(res.body);
    return Address.listFromJson(res.body);
  }

  Future<dynamic> structured(GeocodeParams params) async {
    final res = await Http.get('geocode/search/structured', params.toQueryMap());
    //print(res.body);
    return jsonDecode(res.body);
  }

  Future<GeocodingResult> autocomplete(GeocodeParams params) async {
    final response = await Http.get('geocode/autocomplete', params.toQueryMap());
    //print(response.body);
    final map = jsonDecode(response.body);
    final result = GeocodingResult.fromMap(map);
    //print(result);
    return result;
  }
}
