import 'package:flutter_deriv_api/api/common/asset_index/exceptions/asset_index_exception.dart';
import 'package:flutter_deriv_api/api/common/models/asset_index_model.dart';
import 'package:flutter_deriv_api/api/common/models/index_contract_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

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
        contracts: jsonList[_contractsIndex] == 0
            ? null
            : getListFromMap(
                jsonList[_contractsIndex],
                itemToTypeCallback: (dynamic item) =>
                    IndexContractModel.fromJson(item),
              ),
        symbolCode: jsonList[_symbolCodeIndex],
        symbolName: jsonList[_symbolNameIndex],
      );

  static const int _symbolCodeIndex = 0;
  static const int _symbolNameIndex = 1;
  static const int _contractsIndex = 2;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Retrieves a list of all available underlyings and the corresponding contract types and duration boundaries.
  ///
  /// If the user is logged in, only the assets available for that user's landing company will be returned.
  /// Throws an [AssetIndexException] if API response contains an error
  static Future<List<AssetIndex>> fetchAssetIndices([
    AssetIndexRequest request,
  ]) async {
    final AssetIndexResponse response = await _api.call(
      request: request ?? const AssetIndexRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          AssetIndexException(baseExceptionModel: baseExceptionModel),
    );

    return getListFromMap(
      response.assetIndex,
      itemToTypeCallback: (dynamic item) => AssetIndex.fromJson(item),
    );
  }

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
