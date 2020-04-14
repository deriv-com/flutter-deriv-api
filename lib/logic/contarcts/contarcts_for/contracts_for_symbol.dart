import 'package:flutter_deriv_api/helpers.dart';
import 'package:flutter_deriv_api/api/contracts_for_send.dart';
import 'package:flutter_deriv_api/models/contracts_for_model.dart';

import 'contract.dart';

/// available contracts. Note: if the user is authenticated,
/// then only contracts allowed under his account will be returned.
class ContractsForSymbol extends ContractsForSymbolModel {
  /// Initializes
  ContractsForSymbol({
    List<Contract> contracts,
    DateTime close,
    String feedLicense,
    int hitCount,
    DateTime open,
    double spot,
  }) : super(
          contracts: contracts,
          close: close,
          feedLicense: feedLicense,
          hitCount: hitCount,
          open: open,
          spot: spot,
        );

  /// Factory constructor from Json
  factory ContractsForSymbol.fromJson(Map<String, dynamic> json) => ContractsForSymbol(
        contracts: json['available']
            ?.map<Contract>((dynamic entry) =>
                entry == null ? null : Contract.fromJson(entry))
            ?.toList(),
        close: json['close'] != null ? getDateTime(json['close']) : null,
        feedLicense: json['feed_license'],
        hitCount: json['hit_count'],
        open: json['open'] != null ? getDateTime(json['open']) : null,
        spot: json['spot'],
      );

  /// Fetch contracts for given [symbol]
  /// For parameters information refer to [ContractsForRequest]
  static Future<ContractsForSymbol> getContractsForSymbol({
    String symbol,
    String currency,
    String landingCompany,
    String productType,
  }) async =>
      // TODO(Ramin): call to the actual API class when its ready
      ContractsForSymbol();

  /// Clone a new instance
  ContractsForSymbol copyWith({
    List<Contract> contracts,
    int close,
    String feedLicense,
    int hitCount,
    DateTime open,
    double spot,
  }) =>
      ContractsForSymbol(
        contracts: contracts ?? this.contracts,
        close: close ?? this.close,
        feedLicense: feedLicense ?? this.feedLicense,
        hitCount: hitCount ?? this.hitCount,
        open: open ?? this.open,
        spot: spot ?? this.spot,
      );
}
