/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_account_currency_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// SetAccountCurrencyRequest class
class SetAccountCurrencyRequest extends Request {
  /// Initialize SetAccountCurrencyRequest
  const SetAccountCurrencyRequest({
    @required this.setAccountCurrency,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'set_account_currency',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory SetAccountCurrencyRequest.fromJson(Map<String, dynamic> json) =>
      SetAccountCurrencyRequest(
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        setAccountCurrency: json['set_account_currency'] as String,
      );

  /// Currency of the account. List of supported currencies can be acquired with `payout_currencies` call.
  final String setAccountCurrency;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'req_id': reqId,
        'set_account_currency': setAccountCurrency,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetAccountCurrencyRequest copyWith({
    String setAccountCurrency,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      SetAccountCurrencyRequest(
        setAccountCurrency: setAccountCurrency ?? this.setAccountCurrency,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
