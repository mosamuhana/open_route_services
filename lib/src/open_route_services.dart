import 'geocode.service.dart';
import 'directions.service.dart';
import 'elevation.service.dart';
import 'isochrones.service.dart';
import 'matrix.service.dart';
import 'optimization.service.dart';
import 'pois.service.dart';

class OpenRouteServices {
  static String _host = 'https://api.openrouteservice.org';
  static int _timeout = 10000;
  static String _format = 'json';
  static String? _apiKey;
  static GeocodeService? _geocode;
  static DirectionsService? _directions;
  static ElevationService? _elevation;
  static IsochronesService? _isochrones;
  static MatrixService? _matrix;
  static OptimizationService? _optimization;
  static PoisService? _pois;

  OpenRouteServices._();

  static String get host => _host;
  static int get timeout => _timeout;
  static String get format => _format;

  static GeocodeService get geocode {
    if (_geocode == null) {
      _check();
      _geocode = GeocodeService();
    }
    return _geocode!;
  }

  static DirectionsService get directions {
    if (_directions == null) {
      _check();
      _directions = DirectionsService();
    }
    return _directions!;
  }

  static ElevationService get elevation {
    if (_elevation == null) {
      _check();
      _elevation = ElevationService();
    }
    return _elevation!;
  }

  static IsochronesService get isochrones {
    if (_isochrones == null) {
      _check();
      _isochrones = IsochronesService();
    }
    return _isochrones!;
  }

  static MatrixService get matrix {
    if (_matrix == null) {
      _check();
      _matrix = MatrixService();
    }
    return _matrix!;
  }

  static OptimizationService get optimization {
    if (_optimization == null) {
      _check();
      _optimization = OptimizationService();
    }
    return _optimization!;
  }

  static PoisService get pois {
    if (_pois == null) {
      _check();
      _pois = PoisService();
    }
    return _pois!;
  }

  static String get apiKey {
    if (_apiKey == null) {
      throw Exception("'apiKey' required, use OpenRoute.init(<api-key>)");
    }
    return _apiKey!;
  }

  static void _check() {
    if (_apiKey == null) {
      throw Exception("'apiKey' required, use OpenRoute.init(<api-key>)");
    }
  }

  static init({
    required String apiKey,
    String? host,
    int? timeout,
    String? format,
  }) {
    _apiKey = apiKey;
    _host = host ?? _host;
    _timeout = timeout ?? _timeout;
    _format = format ?? _format;
  }
}
