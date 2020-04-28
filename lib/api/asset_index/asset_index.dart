import 'package:flutter_deriv_api/api/models/asset_index_model.dart';
import 'package:flutter_deriv_api/api/models/index_contract_model.dart';

/// Asset index class
class AssetIndex extends AssetIndexModel {
  /// Initializes
  AssetIndex({
    List<IndexContractModel> contracts,
    String symbolCode,
    String symbolName,
  }) : super(
    contracts: contracts,
    symbolCode: symbolCode,
    symbolName: symbolName,
  );

  /// Generate an instance from a JSON list
  factory AssetIndex.fromJson(
      List<dynamic> jsonList,
      ) =>
      AssetIndex(
        contracts: jsonList[2] == 0
            ? null
            : jsonList[2]
            .map<IndexContractModel>(
                (dynamic item) => IndexContractModel.fromJson(item))
            .toList(),
        symbolCode: jsonList[0],
        symbolName: jsonList[1],
      );

  /// Creates a copy of this instance with given parameters
  AssetIndex copyWith({
    List<IndexContractModel> contracts,
    String symbolCode,
    String symbolName,
  }) =>
      AssetIndex(
        contracts: contracts ?? this.contracts,
        symbolCode: symbolCode ?? this.symbolCode,
        symbolName: symbolName ?? this.symbolName,
      );
}