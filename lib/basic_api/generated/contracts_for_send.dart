/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contracts_for_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// ContractsForRequest class
class ContractsForRequest extends Request {
  /// Initialize ContractsForRequest
  const ContractsForRequest({
    @required this.contractsFor,
    this.currency,
    this.landingCompany,
    this.productType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'contracts_for',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ContractsForRequest.fromJson(Map<String, dynamic> json) =>
      ContractsForRequest(
        // ignore: avoid_as
        contractsFor: json['contracts_for'] as String,
        // ignore: avoid_as
        currency: json['currency'] as String,
        // ignore: avoid_as
        landingCompany: json['landing_company'] as String,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        productType: json['product_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// The short symbol name (obtained from `active_symbols` call).
  final String contractsFor;

  /// [Optional] Currency of the contract's stake and payout (obtained from `payout_currencies` call).
  final String currency;

  /// [Optional] Indicates which landing company to get a list of contracts for. If you are logged in, your account's landing company will override this field.
  final String landingCompany;

  /// [Optional] If you specify this field, only contracts tradable through that contract type will be returned.
  final String productType;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contracts_for': contractsFor,
        'currency': currency,
        'landing_company': landingCompany,
        'passthrough': passthrough,
        'product_type': productType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractsForRequest copyWith({
    String contractsFor,
    String currency,
    String landingCompany,
    String productType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ContractsForRequest(
        contractsFor: contractsFor ?? this.contractsFor,
        currency: currency ?? this.currency,
        landingCompany: landingCompany ?? this.landingCompany,
        productType: productType ?? this.productType,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
