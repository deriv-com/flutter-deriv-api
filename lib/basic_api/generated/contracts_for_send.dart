/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contracts_for_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Contracts for request class.
class ContractsForRequest extends Request {
  /// Initialize ContractsForRequest.
  const ContractsForRequest({
    required this.contractsFor,
    this.currency,
    required this.landingCompany,
    this.landingCompanyShort,
    this.loginid,
    this.productType,
    super.msgType = 'contracts_for',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ContractsForRequest.fromJson(Map<String, dynamic> json) =>
      ContractsForRequest(
        contractsFor: json['contracts_for'] as String?,
        currency: json['currency'] as String?,
        landingCompany: json['landing_company'] as String?,
        landingCompanyShort: json['landing_company_short'] as String?,
        loginid: json['loginid'] as String?,
        productType: json['product_type'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The short symbol name (obtained from `active_symbols` call).
  final String? contractsFor;

  /// [Optional] Currency of the contract's stake and payout (obtained from `payout_currencies` call).
  final String? currency;

  /// Deprecated - Replaced by landing_company_short.
  final String? landingCompany;

  /// [Optional] Indicates which landing company to get a list of contracts for. If you are logged in, your account's landing company will override this field. Note that when landing_company_short is set to 'virtual', landing_company will take precendce until the deprecated field is removed from the api.
  final String? landingCompanyShort;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] If you specify this field, only contracts tradable through that contract type will be returned.
  final String? productType;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contracts_for': contractsFor,
        'currency': currency,
        'landing_company': landingCompany,
        'landing_company_short': landingCompanyShort,
        'loginid': loginid,
        'product_type': productType,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractsForRequest copyWith({
    String? contractsFor,
    String? currency,
    String? landingCompany,
    String? landingCompanyShort,
    String? loginid,
    String? productType,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ContractsForRequest(
        contractsFor: contractsFor ?? this.contractsFor,
        currency: currency ?? this.currency,
        landingCompany: landingCompany ?? this.landingCompany,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        loginid: loginid ?? this.loginid,
        productType: productType ?? this.productType,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
