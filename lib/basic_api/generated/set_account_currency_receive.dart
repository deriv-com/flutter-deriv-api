/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_account_currency_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Set account currency response class
class SetAccountCurrencyResponse extends Response {
  /// Initialize SetAccountCurrencyResponse
  const SetAccountCurrencyResponse({
    this.setAccountCurrency,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory SetAccountCurrencyResponse.fromJson(Map<String, dynamic> json) =>
      SetAccountCurrencyResponse(
        setAccountCurrency: json['set_account_currency'] == null
            ? null
            : json['set_account_currency'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// `true`: success, `false`: no change
  final bool? setAccountCurrency;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'set_account_currency': setAccountCurrency == null
            ? null
            : setAccountCurrency!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetAccountCurrencyResponse copyWith({
    bool? setAccountCurrency,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      SetAccountCurrencyResponse(
        setAccountCurrency: setAccountCurrency ?? this.setAccountCurrency,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
