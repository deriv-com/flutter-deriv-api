import 'package:flutter_deriv_api/api/common/models/symbol_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Submarket class
class SubmarketModel extends APIBaseModel {
  /// Initializes
  SubmarketModel({
    this.displayName,
    this.name,
    this.symbols,
  });

  /// Creates an instance from JSON
  factory SubmarketModel.fromJson(Map<String, dynamic> json) => SubmarketModel(
        displayName: json['display_name'],
        name: json['name'],
        symbols: getListFromMap(
          json['symbols'],
          itemToTypeCallback: (dynamic item) => SymbolModel.fromJson(item),
        ),
      );

  /// Translated submarket name.
  final String displayName;

  /// Submarket name.
  final String name;

  /// Submarket name.
  final List<SymbolModel> symbols;

  /// Creates a copy of instance with given parameters
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
