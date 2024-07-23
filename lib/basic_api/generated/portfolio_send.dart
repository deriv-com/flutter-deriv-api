/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/portfolio_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Portfolio request class.
class PortfolioRequest extends Request {
  /// Initialize PortfolioRequest.
  const PortfolioRequest({
    required this.contractType,
    this.loginid,
    this.portfolio = true,
    super.msgType = 'portfolio',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PortfolioRequest.fromJson(Map<String, dynamic> json) =>
      PortfolioRequest(
        contractType: (json['contract_type'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        loginid: json['loginid'] as String?,
        portfolio: json['portfolio'] == null ? null : json['portfolio'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Return only contracts of the specified types
  final List<String>? contractType;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? portfolio;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_type': contractType,
        'loginid': loginid,
        'portfolio': portfolio == null
            ? null
            : portfolio!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PortfolioRequest copyWith({
    List<String>? contractType,
    String? loginid,
    bool? portfolio,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PortfolioRequest(
        contractType: contractType ?? this.contractType,
        loginid: loginid ?? this.loginid,
        portfolio: portfolio ?? this.portfolio,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
