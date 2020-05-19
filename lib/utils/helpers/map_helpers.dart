part of '../helpers.dart';

/// Gets a list of models from a map
List<T> getListFromMap<T>(
  Iterable<dynamic> mapList, {
  T Function(dynamic item) itemToTypeCallback,
}) {
  if (mapList == null || mapList.isEmpty) {
    return null;
  }

  return mapList
      .map<T>(
        (dynamic item) => itemToTypeCallback == null
            ? item.toString()
            : itemToTypeCallback(item),
      )
      .toList();
}

/// Gets a model from a map
T getItemFromMap<T>(
  Map<String, dynamic> map, {
  T Function(dynamic item) itemToTypeCallback,
}) {
  if (map == null) {
    return null;
  }

  return itemToTypeCallback(map);
}
