import 'base_model.dart';
import 'index_contract_model.dart';

/// Model class for asset index
abstract class AssetIndexModel extends BaseModel {
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
