import 'index.dart' show cleanList;

const Map<String, Map<String, String>> _maps = {
  'Profile': {
    'drivingHgv': 'driving-hgv',
    'cyclingRegular': 'cycling-regular',
    'cyclingRoad': 'cycling-road',
    'cyclingMountain': 'cycling-mountain',
    'cyclingElectric': 'cycling-electric',
    'footWalking': 'foot-walking',
    'footHiking': 'foot-hiking',
    //'wheelchair': 'wheelchair',
  },
};

class EnumUtils {
  static String? toStrng<T extends Enum>(T? v) {
    if (v == null) return null;
    final t = v.runtimeType.toString();
    var k = v.toString();
    if (k.startsWith('$t.')) {
      k = k.split('.').last;
    }
    if (_maps.containsKey(t)) {
      Map<String, String> m = _maps[t]!;
      if (m.containsKey(k)) return m[k]!;
    }
    return k;
  }

  static List<String>? toStrngList<T extends Enum>(List<T>? v) {
    v = cleanList(v);
    if (v == null || v.isEmpty) return null;
    return v.map((x) => toStrng(x)!).toList();
  }

  static T? fromString<T extends Enum>(String? v, List<T> values) {
    if (v == null || values.isEmpty) return null;
    final t = values[0].runtimeType.toString();
    final key = '$t.${v.trim()}'.toLowerCase();
    for (final value in values) {
      if (value.toString().toLowerCase() == key) {
        return value;
      }
    }
    return null;
  }

  static List<T>? fromStringList<T extends Enum>(List? input, List<T> values) {
    if (input == null || input.isEmpty || values.isEmpty) {
      return null;
    }
    var v = cleanList(
      input.where((x) => x != null).map((x) => x.toString()).toList(),
    );

    if (v == null || v.isEmpty) return null;
    final List<T> a = v
        .map((x) => fromString(x, values))
        .where((x) => x != null)
        .map((x) => x!)
        .toList();

    return a.isEmpty ? null : a;
  }
}
