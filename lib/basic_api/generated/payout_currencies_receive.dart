/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/payout_currencies_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Payout currencies receive class.
class PayoutCurrenciesReceive extends Response {
  /// Initialize PayoutCurrenciesReceive.
  const PayoutCurrenciesReceive({
    this.payoutCurrencies,
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

  /// Creates an instance from JSON.
  factory PayoutCurrenciesReceive.fromJson(Map<String, dynamic> json) =>
      PayoutCurrenciesReceive(
        payoutCurrencies: (json['payout_currencies'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Available payout currencies. Note: if a user is logged in, only the currency available for the account will be returned.
  final List<String>? payoutCurrencies;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'payout_currencies': payoutCurrencies,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PayoutCurrenciesReceive copyWith({
    List<String>? payoutCurrencies,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      PayoutCurrenciesReceive(
        payoutCurrencies: payoutCurrencies ?? this.payoutCurrencies,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
