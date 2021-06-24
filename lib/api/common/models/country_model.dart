import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Country model
class CountryModel extends APIBaseModel {
  /// Initializes
  CountryModel({
    this.code,
    this.name,
  });

  /// Generate an instance from item
  factory CountryModel.fromItem(List<dynamic> item) => CountryModel(
        code: item.first,
        name: item.last,
      );

  /// Country code
  final String? code;

  /// Country name
  final String? name;

  /// Generate a copy of instance with given parameters
  CountryModel copyWith({
    String? code,
    String? name,
  }) =>
      CountryModel(
        code: code ?? this.code,
        name: name ?? this.name,
      );
}
