/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_account_currency_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Set account currency request class.
class SetAccountCurrencyRequest extends Request {
  /// Initialize SetAccountCurrencyRequest.
  const SetAccountCurrencyRequest({
    this.loginid,
    required this.setAccountCurrency,
    super.msgType = 'set_account_currency',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory SetAccountCurrencyRequest.fromJson(Map<String, dynamic> json) =>
      SetAccountCurrencyRequest(
        loginid: json['loginid'] as String?,
        setAccountCurrency: json['set_account_currency'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Currency of the account. List of supported currencies can be acquired with `payout_currencies` call.
  final String? setAccountCurrency;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'set_account_currency': setAccountCurrency,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetAccountCurrencyRequest copyWith({
    String? loginid,
    String? setAccountCurrency,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      SetAccountCurrencyRequest(
        loginid: loginid ?? this.loginid,
        setAccountCurrency: setAccountCurrency ?? this.setAccountCurrency,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
