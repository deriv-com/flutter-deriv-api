/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/payout_currencies_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Payout currencies send class
class PayoutCurrenciesSend extends Request {
  /// Initialize PayoutCurrenciesSend
  const PayoutCurrenciesSend({
    this.payoutCurrencies = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'payout_currencies',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PayoutCurrenciesSend.fromJson(Map<String, dynamic> json) =>
      PayoutCurrenciesSend(
        payoutCurrencies: json['payout_currencies'] == null
            ? null
            : json['payout_currencies'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool payoutCurrencies;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'payout_currencies': payoutCurrencies == null
            ? null
            : payoutCurrencies
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PayoutCurrenciesSend copyWith({
    bool payoutCurrencies,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      PayoutCurrenciesSend(
        payoutCurrencies: payoutCurrencies ?? this.payoutCurrencies,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
