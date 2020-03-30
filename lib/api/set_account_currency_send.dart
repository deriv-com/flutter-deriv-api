/// Autogenerated from flutter_deriv_api|lib/api/set_account_currency_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'set_account_currency_send.g.dart';

/// JSON conversion for 'set_account_currency_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetAccountCurrencyRequest extends Request {
  /// Initialize SetAccountCurrencyRequest
  SetAccountCurrencyRequest(
      {this.setAccountCurrency, Map<String, dynamic> passthrough, int reqId})
      : super(passthrough: passthrough, reqId: reqId);

  /// Creates instance from JSON
  factory SetAccountCurrencyRequest.fromJson(Map<String, dynamic> json) =>
      _$SetAccountCurrencyRequestFromJson(json);

  // Properties
  /// Currency of the account. List of supported currencies can be acquired with `payout_currencies` call.
  String setAccountCurrency;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$SetAccountCurrencyRequestToJson(this);
}
