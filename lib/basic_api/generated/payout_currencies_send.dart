/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/payout_currencies_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Payout currencies request class
class PayoutCurrenciesRequest extends Request {
  /// Initialize PayoutCurrenciesRequest
  const PayoutCurrenciesRequest({
    this.payoutCurrencies = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'payout_currencies',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PayoutCurrenciesRequest.fromJson(Map<String, dynamic> json) =>
      PayoutCurrenciesRequest(
        payoutCurrencies: json['payout_currencies'] == null
            ? null
            : json['payout_currencies'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool? payoutCurrencies;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'payout_currencies': payoutCurrencies == null
            ? null
            : payoutCurrencies!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PayoutCurrenciesRequest copyWith({
    bool? payoutCurrencies,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      PayoutCurrenciesRequest(
        payoutCurrencies: payoutCurrencies ?? this.payoutCurrencies,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
