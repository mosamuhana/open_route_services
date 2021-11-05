List<T>? uniqueList<T>(List<T>? list) {
  if (list == null) return null;
  List<T> a = [];
  for (final item in list) {
    if (!a.contains(item)) {
      a.add(item);
    }
  }
  return a;
}

List<T>? cleanList<T>(List<T>? list) {
  if (list == null) return null;
  List<T> a = [];
  for (final i in list) {
    if (i != null && !a.contains(i)) {
      a.add(i);
    }
  }
  return a.isEmpty ? null : a;
}

String? toQueryString(Map<String, dynamic>? map) {
  if (map == null || map.isEmpty) return null;
  final a = map.entries.where((e) => e.value != null).map((e) => '${e.key}=${e.value}').toList();
  return a.isEmpty ? null : a.join('&');
}

Map<String, dynamic>? cleanMap(Map<String, dynamic>? map) {
  if (map != null) {
    map.removeWhere((key, value) => value == null);
    if (map.isNotEmpty) return map;
  }
  return null;
}

List<T>? listFrom<T>(dynamic data) {
  if (data != null && data is Iterable) {
    final iter = data.where((x) => x != null);
    if (iter.isNotEmpty && iter.every((e) => e is T)) {
      return iter.cast<T>().toList();
    }
  }
  return null;
}

bool listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  if (identical(a, b)) return true;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
