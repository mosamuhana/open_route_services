import 'dart:convert';

import 'types/geocode_search_params.dart';
import 'types/address.dart';
import 'utils.dart';

class GeocodeService {
  Future<List<Address>> search(GeocodeSearchParams params) async {
    if (params.text == null) throw Exception("'text' param required");
    final res = await Http.get('geocode/search', params.toQueryMap());
    //print(res.body);
    //return jsonDecode(res.body);
    return Address.listFromJson(res.body);
  }

  Future<List<Address>> reverse(GeocodeSearchParams params) async {
    if (params.point == null) throw Exception("'point' param required");
    final res = await Http.get('geocode/reverse', params.toQueryMap());
    //print(res.body);
    //return jsonDecode(res.body);
    return Address.listFromJson(res.body);
  }

  Future<dynamic> structured(GeocodeSearchParams params) async {
    final res =
        await Http.get('geocode/search/structured', params.toQueryMap());
    print(res.body);
    return jsonDecode(res.body);
  }

  Future<dynamic> autocomplete(GeocodeSearchParams params) async {
    final res = await Http.get('geocode/autocomplete', params.toQueryMap());
    print(res.body);
    return jsonDecode(res.body);
  }
}
