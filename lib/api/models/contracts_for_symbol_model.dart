import 'base_model.dart';
import 'contract_model.dart';

/// Abstract class involving fields of [ContractsFor]
abstract class ContractsForSymbolModel extends BaseModel {
  /// Initializes
  ContractsForSymbolModel({
    this.contracts,
    this.close,
    this.feedLicense,
    this.hitCount,
    this.open,
    this.spot,
  });

  /// List of available contracts. Note: if the user is authenticated,
  /// then only contracts allowed under his account will be returned.
  final List<ContractModel> contracts;

  /// Symbol's next market-close time as an epoch value
  final DateTime close;

  /// Indicates the feed license for symbol,
  /// E.g. whether its realtime or delayed
  final String feedLicense;

  /// Count of contracts available
  final int hitCount;

  /// Symbol's next market-open time as an epoch value
  final DateTime open;

  /// Current spot price for this underlying
  final double spot;
}
