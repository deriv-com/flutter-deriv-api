import 'package:flutter_deriv_api/helpers/map_helper.dart';
import 'package:test/test.dart';

void main() {
  group('getListFromMap tests =>', () {
    test('should return null for null map list.', () {
      final List<dynamic>? result = getListFromMap(null);

      expect(result, null);
    });

    test('should return null for empty map list.', () {
      final List<dynamic>? result = getListFromMap(<dynamic>[]);

      expect(result, null);
    });

    test('should return list of models from map list.', () {
      final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[
        <String, dynamic>{'id': 1, 'name': 'John'},
        <String, dynamic>{'id': 2, 'name': 'Jane'},
      ];

      final List<UserModel?>? result = getListFromMap(
        mapList,
        itemToTypeCallback: (dynamic item) => UserModel.fromMap(item),
      );

      expect(result, isNotNull);
      expect(result!.length, 2);
      expect(result[0], isA<UserModel>());
      expect(result[1], isA<UserModel>());
      expect(result[0]?.id, 1);
      expect(result[0]?.name, 'John');
      expect(result[1]?.id, 2);
      expect(result[1]?.name, 'Jane');
    });

    test('should return list of models without callback function.', () {
      final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[
        <String, dynamic>{'id': 1, 'name': 'John'},
        <String, dynamic>{'id': 2, 'name': 'Jane'},
      ];

      final List<dynamic>? result = getListFromMap(mapList);

      expect(result, isNotNull);
      expect(result!.length, 2);
      expect(result[0], <String, dynamic>{'id': 1, 'name': 'John'});
      expect(result[1], <String, dynamic>{'id': 2, 'name': 'Jane'});
    });
  });

  group('getItemFromMap tests =>', () {
    test('should return null for null map.', () {
      final dynamic result = getItemFromMap(null);

      expect(result, null);
    });

    test('should return model from map.', () {
      final Map<String, dynamic> map = <String, dynamic>{
        'id': 1,
        'name': 'John'
      };

      final UserModel? result = getItemFromMap(
        map,
        itemToTypeCallback: (dynamic item) => UserModel.fromMap(item),
      );

      expect(result, isA<UserModel>());
      expect(result?.id, 1);
      expect(result?.name, 'John');
    });

    test('should return map without callback function.', () {
      final Map<String, dynamic> map = <String, dynamic>{
        'id': 1,
        'name': 'John'
      };

      final Map<String, dynamic>? result =
          getItemFromMap(map, itemToTypeCallback: (dynamic item) => item);

      expect(result, <String, dynamic>{'id': 1, 'name': 'John'});
    });
  });
}

class UserModel {
  UserModel({
    required this.id,
    required this.name,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'],
        name: map['name'],
      );

  final int id;
  final String name;
}
