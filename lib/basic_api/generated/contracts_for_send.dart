/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contracts_for_send.json
// ignore_for_file: avoid_as
import 'package:meta/meta.dart';
import '../request.dart';

/// Contracts for request class
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
        contractsFor: json['contracts_for'] as String,
        currency: json['currency'] as String,
        landingCompany: json['landing_company'] as String,
        productType: json['product_type'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
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

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contracts_for': contractsFor,
        'currency': currency,
        'landing_company': landingCompany,
        'product_type': productType,
        'passthrough': passthrough,
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
