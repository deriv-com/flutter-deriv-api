/// generated automatically from flutter_deriv_api|lib/basic_api/generated/set_account_currency_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'set_account_currency_send.g.dart';

/// JSON conversion for 'set_account_currency_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetAccountCurrencyRequest extends Request {
  /// Initialize SetAccountCurrencyRequest
  const SetAccountCurrencyRequest({
    this.setAccountCurrency,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'set_account_currency',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory SetAccountCurrencyRequest.fromJson(Map<String, dynamic> json) =>
      _$SetAccountCurrencyRequestFromJson(json);

  // Properties
  /// Currency of the account. List of supported currencies can be acquired with `payout_currencies` call.
  final String setAccountCurrency;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$SetAccountCurrencyRequestToJson(this);

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
