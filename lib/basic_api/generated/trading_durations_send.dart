/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_durations_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading durations request class.
class TradingDurationsRequest extends Request {
  /// Initialize TradingDurationsRequest.
  const TradingDurationsRequest({
    required this.landingCompany,
    this.landingCompanyShort,
    this.loginid,
    this.tradingDurations = true,
    super.msgType = 'trading_durations',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingDurationsRequest.fromJson(Map<String, dynamic> json) =>
      TradingDurationsRequest(
        landingCompany: json['landing_company'] as String?,
        landingCompanyShort: json['landing_company_short'] as String?,
        loginid: json['loginid'] as String?,
        tradingDurations: json['trading_durations'] == null
            ? null
            : json['trading_durations'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Deprecated - Replaced by landing_company_short.
  final String? landingCompany;

  /// [Optional] If specified, will return only the underlyings for the specified landing company.
  final String? landingCompanyShort;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? tradingDurations;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'landing_company': landingCompany,
        'landing_company_short': landingCompanyShort,
        'loginid': loginid,
        'trading_durations': tradingDurations == null
            ? null
            : tradingDurations!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingDurationsRequest copyWith({
    String? landingCompany,
    String? landingCompanyShort,
    String? loginid,
    bool? tradingDurations,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingDurationsRequest(
        landingCompany: landingCompany ?? this.landingCompany,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        loginid: loginid ?? this.loginid,
        tradingDurations: tradingDurations ?? this.tradingDurations,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
