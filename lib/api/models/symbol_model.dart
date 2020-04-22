import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Symbol class
class SymbolModel extends BaseModel {
  /// Class constructor
  SymbolModel({
    this.displayName,
    this.name,
  });

  /// Creates instance from json
  factory SymbolModel.fromJson(Map<String, dynamic> json) => SymbolModel(
        displayName: json['display_name'],
        name: json['name'],
      );

  /// Translated symbol name.
  final String displayName;

  /// Symbol name.
  final String name;

  /// Creates copy of instance with given parameters
  SymbolModel copyWith({
    String displayName,
    String name,
  }) =>
      SymbolModel(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
      );
}
