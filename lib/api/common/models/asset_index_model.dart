import 'package:flutter_deriv_api/api/common/models/index_contract_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Model class for asset index
abstract class AssetIndexModel extends APIBaseModel {
  /// Initializes
  AssetIndexModel({
    this.contracts,
    this.symbolCode,
    this.symbolName,
  });

  /// Available contracts fot this asset index
  final List<IndexContractModel> contracts;

  /// Index code
  final String symbolCode;

  /// Index name
  final String symbolName;
}
