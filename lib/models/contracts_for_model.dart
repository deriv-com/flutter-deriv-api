import 'package:flutter_deriv_api/logic/contarcts/contarcts_for/available.dart';

/// Abstract class involving fields of [ContractsFor]
abstract class ContractsForModel {
  /// Initializes
  ContractsForModel({
    this.available,
    this.close,
    this.feedLicense,
    this.hitCount,
    this.open,
    this.spot,
  });

  /// List of available contracts. Note: if the user is authenticated,
  /// then only contracts allowed under his account will be returned.
  final List<Available> available;

  /// Symbol's next market-close time as an epoch value
  final int close;

  /// Indicates the feed license for symbol,
  /// E.g. whether its realtime or delayed
  final String feedLicense;

  /// Count of contracts available
  final int hitCount;

  /// Symbol's next market-open time as an epoch value
  final int open;

  /// Current spot price for this underlying
  final double spot;
}
