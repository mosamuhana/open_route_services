import 'dart:convert' show jsonDecode;
import 'types/optimization_params.dart';
import 'utils/http.dart';

class OptimizationService {
  Future<dynamic> calculate(OptimizationParams params) async {
    final res = await Http.post('optimization', params.toMap());
    //print(res.body);
    return jsonDecode(res.body);
  }
}
