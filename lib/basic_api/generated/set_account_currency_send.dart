/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_account_currency_send.json
// ignore_for_file: avoid_as
import 'package:meta/meta.dart';
import '../request.dart';

/// Set account currency request class
class SetAccountCurrencyRequest extends Request {
  /// Initialize SetAccountCurrencyRequest
  const SetAccountCurrencyRequest({
    @required this.setAccountCurrency,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'set_account_currency',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory SetAccountCurrencyRequest.fromJson(Map<String, dynamic> json) =>
      SetAccountCurrencyRequest(
        setAccountCurrency: json['set_account_currency'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Currency of the account. List of supported currencies can be acquired with `payout_currencies` call.
  final String? setAccountCurrency;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'set_account_currency': setAccountCurrency,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetAccountCurrencyRequest copyWith({
    String? setAccountCurrency,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      SetAccountCurrencyRequest(
        setAccountCurrency: setAccountCurrency ?? this.setAccountCurrency,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
