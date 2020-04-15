/// generated automatically from flutter_deriv_api|lib/api/contracts_for_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'contracts_for_send.g.dart';

/// JSON conversion for 'contracts_for_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ContractsForRequest extends Request {
  /// Initialize ContractsForRequest
  const ContractsForRequest({
    this.contractsFor,
    this.currency,
    this.landingCompany,
    this.productType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory ContractsForRequest.fromJson(Map<String, dynamic> json) =>
      _$ContractsForRequestFromJson(json);

  // Properties
  /// The short symbol name (obtained from `active_symbols` call).
  final String contractsFor;

  /// [Optional] Currency of the contract's stake and payout (obtained from `payout_currencies` call).
  final String currency;

  /// [Optional] Indicates which landing company to get a list of contracts for. If you are logged in, your account's landing company will override this field.
  final String landingCompany;

  /// [Optional] If you specify this field, only contracts tradable through that contract type will be returned.
  final String productType;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ContractsForRequestToJson(this);

  /// Creates copy of instance with given parameters
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
