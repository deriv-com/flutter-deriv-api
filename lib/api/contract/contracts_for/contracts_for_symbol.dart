import 'package:flutter_deriv_api/api/contract/models/contract_model.dart';
import 'package:flutter_deriv_api/api/contract/models/contracts_for_symbol_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/generated/contracts_for_send.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'exceptions/contract_for_symbol_exception.dart';

/// available contracts. Note: if the user is authenticated,
/// then only contracts allowed under his account will be returned.
class ContractsForSymbol extends ContractsForSymbolModel {
  /// Initializes
  ContractsForSymbol({
    List<ContractModel> contracts,
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

  /// Creates an instance from JSON
  factory ContractsForSymbol.fromJson(Map<String, dynamic> json) =>
      ContractsForSymbol(
        contracts: getListFromMap(
          json['available'],
          itemToTypeCallback: (dynamic item) => ContractModel.fromJson(item),
        ),
        close: getDateTime(json['close']),
        feedLicense: json['feed_license'],
        hitCount: json['hit_count'],
        open: getDateTime(json['open']),
        spot: json['spot'],
      );

  /// API instance
  static final BasicBinaryAPI _api =
      Injector.getInjector().get<BasicBinaryAPI>();

  /// Fetch contracts for given [symbol]
  /// For parameters information refer to [ContractsForRequest]
  static Future<ContractsForSymbol> getContractsForSymbol({
    String symbol = 'R_10',
    String currency,
    String landingCompany,
    String productType,
  }) async {
    final ContractsForResponse contractsForResponse = await _api.call(
      request: ContractsForRequest(
        contractsFor: symbol,
        currency: currency,
        landingCompany: landingCompany,
        productType: productType,
      ),
    );

    if (contractsForResponse.error != null) {
      throw ContractsForSymbolException(
        message: contractsForResponse.error['message'],
      );
    }

    return ContractsForSymbol.fromJson(contractsForResponse.contractsFor);
  }

  /// Generate a copy of instance with given parameters
  ContractsForSymbol copyWith({
    List<ContractModel> contracts,
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
