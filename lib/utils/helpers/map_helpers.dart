part of '../helpers.dart';

/// Gets a list of models from a map
List<T> getListFromMap<T>(
  Iterable<dynamic> mapList, {
  T Function(dynamic item) itemToTypeCallback,
}) =>
    mapList == null || mapList.isEmpty
        ? null
        : mapList
            .map<T>(
              (dynamic item) => itemToTypeCallback == null
                  ? item.toString()
                  : itemToTypeCallback(item),
            )
            .toList();

/// Gets a model from a map
T getItemFromMap<T>(
  Map<String, dynamic> map, {
  T Function(dynamic item) itemToTypeCallback,
}) =>
    map == null ? null : itemToTypeCallback(map);
