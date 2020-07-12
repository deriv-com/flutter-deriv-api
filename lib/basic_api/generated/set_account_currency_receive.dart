/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_account_currency_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// SetAccountCurrencyResponse class
class SetAccountCurrencyResponse extends Response {
  /// Initialize SetAccountCurrencyResponse
  const SetAccountCurrencyResponse({
    this.setAccountCurrency,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory SetAccountCurrencyResponse.fromJson(Map<String, dynamic> json) =>
      SetAccountCurrencyResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
        setAccountCurrency: json['set_account_currency'] == null
            ? null
            : json['set_account_currency'] == 1,
      );

  /// `1`: success, `0`: no change
  final bool setAccountCurrency;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'set_account_currency':
            setAccountCurrency == null ? null : setAccountCurrency ? 1 : 0,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetAccountCurrencyResponse copyWith({
    bool setAccountCurrency,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
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
  List<Object> get props => null;
}
