/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/active_symbols_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Active symbols request class.
class ActiveSymbolsRequest extends Request {
  /// Initialize ActiveSymbolsRequest.
  const ActiveSymbolsRequest({
    required this.activeSymbols,
    this.contractType,
    required this.landingCompany,
    this.landingCompanyShort,
    this.loginid,
    this.productType,
    super.msgType = 'active_symbols',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ActiveSymbolsRequest.fromJson(Map<String, dynamic> json) =>
      ActiveSymbolsRequest(
        activeSymbols: json['active_symbols'] as String?,
        contractType: (json['contract_type'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        landingCompany: json['landing_company'] as String?,
        landingCompanyShort: json['landing_company_short'] as String?,
        loginid: json['loginid'] as String?,
        productType: json['product_type'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// If you use `brief`, only a subset of fields will be returned.
  final String? activeSymbols;

  /// [Optional] The proposed contract type
  final List<String>? contractType;

  /// Deprecated - replaced by landing_company_short.
  final String? landingCompany;

  /// [Optional] If you specify this field, only symbols available for trading by that landing company will be returned. If you are logged in, only symbols available for trading by your landing company will be returned regardless of what you specify in this field.
  final String? landingCompanyShort;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] If you specify this field, only symbols that can be traded through that product type will be returned.
  final String? productType;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'active_symbols': activeSymbols,
        'contract_type': contractType,
        'landing_company': landingCompany,
        'landing_company_short': landingCompanyShort,
        'loginid': loginid,
        'product_type': productType,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ActiveSymbolsRequest copyWith({
    String? activeSymbols,
    List<String>? contractType,
    String? landingCompany,
    String? landingCompanyShort,
    String? loginid,
    String? productType,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ActiveSymbolsRequest(
        activeSymbols: activeSymbols ?? this.activeSymbols,
        contractType: contractType ?? this.contractType,
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
