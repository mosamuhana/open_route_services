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
  final a = map.entries
      .where((e) => e.value != null)
      .map((e) => '${e.key}=${e.value}')
      .toList();
  return a.isEmpty ? null : a.join('&');
}

Map<String, dynamic>? cleanMap(Map<String, dynamic>? map) {
  if (map != null) {
    map.removeWhere((key, value) => value == null);
    if (map.isNotEmpty) return map;
  }
  return null;
}
