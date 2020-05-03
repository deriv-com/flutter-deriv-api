import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Country model
class CountryModel extends BaseModel {
  /// Class constructor
  CountryModel({this.code, this.name});

  /// Country code
  final String code;

  /// Country name
  final String name;

  /// Generate copy of instance with given parameters
  CountryModel copyWith({
    String code,
    String name,
  }) =>
      CountryModel(
        code: code ?? this.code,
        name: name ?? this.name,
      );
}
