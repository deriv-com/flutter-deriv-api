import 'package:flutter_deriv_api/abstraction_classes/contarcts/contarcts_for/available.dart';

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
  List<Available> available;

  /// Symbol's next market-close time as an epoch value
  int close;

  /// Indicates the feed license for symbol,
  /// E.g. whether its realtime or delayed
  String feedLicense;

  /// Count of contracts available
  int hitCount;

  /// Symbol's next market-open time as an epoch value
  int open;

  /// Current spot price for this underlying
  double spot;
}
