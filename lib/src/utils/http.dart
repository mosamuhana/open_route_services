import 'package:http/http.dart' as http;

import '../open_route_services.dart';
import '../utils.dart';

class Http {
  static Future<http.Response> get(
    String path,
    Map<String, dynamic>? query,
  ) async {
    final q = toQueryString({
      ...(query ?? {}),
      'api_key': OpenRouteServices.apiKey,
    });
    var url = '${OpenRouteServices.host}/$path';
    if (q != null) url += '?' + q;
    return await http.get(Uri.parse(url));
  }

  static Future<http.Response> post(
    String path,
    Map<String, dynamic>? data,
  ) async {
    var url = '${OpenRouteServices.host}/$path';
    return await http.post(
      Uri.parse(url),
      headers: {'Authorization': OpenRouteServices.apiKey},
      body: data,
    );
  }
}
