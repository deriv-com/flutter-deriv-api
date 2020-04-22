import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Submarket class
class SubmarketModel extends BaseModel {
  /// Class constructor
  SubmarketModel({
    this.displayName,
    this.name,
  });

  /// Creates instance from json
  factory SubmarketModel.fromJson(Map<String, dynamic> json) => SubmarketModel(
        displayName: json['display_name'],
        name: json['name'],
      );

  /// Translated submarket name.
  final String displayName;

  /// Submarket name.
  final String name;

  /// Creates copy of instance with given parameters
  SubmarketModel copyWith({
    String displayName,
    String name,
  }) =>
      SubmarketModel(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
      );
}
