/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/payout_currencies_send.json

import '../request.dart';

/// PayoutCurrenciesRequest class
class PayoutCurrenciesRequest extends Request {
  /// Initialize PayoutCurrenciesRequest
  const PayoutCurrenciesRequest({
    this.payoutCurrencies = 1,
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
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        payoutCurrencies: json['payout_currencies'] as int,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int payoutCurrencies;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'payout_currencies': payoutCurrencies,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PayoutCurrenciesRequest copyWith({
    int payoutCurrencies,
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
  List<Object> get props => null;
}
