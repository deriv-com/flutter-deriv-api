/// generated automatically from flutter_deriv_api|lib/api/payout_currencies_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'payout_currencies_receive.g.dart';

/// JSON conversion for 'payout_currencies_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PayoutCurrenciesResponse extends Response {
  /// Initialize PayoutCurrenciesResponse
  PayoutCurrenciesResponse({
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

  /// Creates instance from JSON
  factory PayoutCurrenciesResponse.fromJson(Map<String, dynamic> json) =>
      _$PayoutCurrenciesResponseFromJson(json);

  // Properties
  /// Available payout currencies. Note: if a user is logged in, only the currency available for the account will be returned.
  final List<String> payoutCurrencies;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$PayoutCurrenciesResponseToJson(this);
}
