import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/symbol_model.dart';

/// Submarket class
class SubmarketModel extends BaseModel {
  /// Class constructor
  SubmarketModel({
    this.displayName,
    this.name,
    this.symbols,
  });

  /// Creates instance from json
  factory SubmarketModel.fromJson(Map<String, dynamic> json) => SubmarketModel(
        displayName: json['display_name'],
        name: json['name'],
        symbols: json['symbols'] == null
            ? null
            : json['symbols']
                .map<SymbolModel>((dynamic item) => SymbolModel.fromJson(item))
                .toList(),
      );

  /// Translated submarket name.
  final String displayName;

  /// Submarket name.
  final String name;

  /// Submarket name.
  final List<SymbolModel> symbols;

  /// Creates copy of instance with given parameters
  SubmarketModel copyWith({
    String displayName,
    String name,
    List<SymbolModel> symbols,
  }) =>
      SubmarketModel(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
        symbols: symbols ?? this.symbols,
      );
}
