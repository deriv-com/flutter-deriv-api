import 'package:flutter_deriv_api/api/contract/contracts_for/exceptions/contract_for_symbol_exception.dart';
import 'package:flutter_deriv_api/api/contract/models/contract_model.dart';
import 'package:flutter_deriv_api/api/contract/models/contracts_for_symbol_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/generated/contracts_for_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Available contracts. Note: if the user is authenticated,
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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets available contracts for given symbol in [ContractsForRequest]
  ///
  /// Throws a [ContractsForSymbolException] if API response contains an error
  static Future<ContractsForSymbol> fetchContractsForSymbol(
    ContractsForRequest request,
  ) async {
    final ContractsForResponse response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: (String message) => ContractsForSymbolException(
        message: message,
      ),
    );

    return ContractsForSymbol.fromJson(response.contractsFor);
  }

  /// Generates a copy of instance with given parameters
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
