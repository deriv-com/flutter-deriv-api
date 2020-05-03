import 'package:flutter_deriv_api/api/models/asset_index_model.dart';
import 'package:flutter_deriv_api/api/models/index_contract_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Index of contracts
const int contractsIndex = 2;

/// Index of symbol code
const int symbolCodeIndex = 0;

/// Index of symbol name
const int symbolNameIndex = 1;

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
        contracts: jsonList[contractsIndex] == 0
            ? null
            : getListFromMap(
                jsonList[contractsIndex],
                itemToTypeCallback: (dynamic item) =>
                    IndexContractModel.fromJson(item),
              ),
        symbolCode: jsonList[symbolCodeIndex],
        symbolName: jsonList[symbolNameIndex],
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
