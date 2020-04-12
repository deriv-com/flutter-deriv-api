/// generated automatically from flutter_deriv_api|lib/api/set_account_currency_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'set_account_currency_receive.g.dart';

/// JSON conversion for 'set_account_currency_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetAccountCurrencyResponse extends Response {
  /// Initialize SetAccountCurrencyResponse
  SetAccountCurrencyResponse({
    this.setAccountCurrency,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory SetAccountCurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$SetAccountCurrencyResponseFromJson(json);

  // Properties
  /// `1`: success, `0`: no change
  final int setAccountCurrency;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$SetAccountCurrencyResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  SetAccountCurrencyResponse copyWith({
    int setAccountCurrency,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      SetAccountCurrencyResponse(
        setAccountCurrency: setAccountCurrency ?? this.setAccountCurrency,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
