/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/payout_currencies_receive.json

import '../response.dart';

/// PayoutCurrenciesResponse class
class PayoutCurrenciesResponse extends Response {
  /// Initialize PayoutCurrenciesResponse
  const PayoutCurrenciesResponse({
    this.payoutCurrencies,
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
  factory PayoutCurrenciesResponse.fromJson(Map<String, dynamic> json) =>
      PayoutCurrenciesResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as, always_specify_types
        payoutCurrencies: (json['payout_currencies'] as List)
            // ignore: avoid_as
            ?.map((dynamic item) => item as String)
            ?.toList(),
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Available payout currencies. Note: if a user is logged in, only the currency available for the account will be returned.
  final List<String> payoutCurrencies;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'payout_currencies': payoutCurrencies,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PayoutCurrenciesResponse copyWith({
    List<String> payoutCurrencies,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PayoutCurrenciesResponse(
        payoutCurrencies: payoutCurrencies ?? this.payoutCurrencies,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
