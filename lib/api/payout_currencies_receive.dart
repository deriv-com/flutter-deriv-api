/// generated automatically from flutter_deriv_api|lib/api/payout_currencies_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'payout_currencies_receive.g.dart';

/// JSON conversion for 'payout_currencies_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PayoutCurrenciesResponse extends Response {
  /// Initialize PayoutCurrenciesResponse
  const PayoutCurrenciesResponse({
    this.payoutCurrencies,
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
  factory PayoutCurrenciesResponse.fromJson(Map<String, dynamic> json) =>
      _$PayoutCurrenciesResponseFromJson(json);

  // Properties
  /// Available payout currencies. Note: if a user is logged in, only the currency available for the account will be returned.
  final List<String> payoutCurrencies;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$PayoutCurrenciesResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  PayoutCurrenciesResponse copyWith({
    List<String> payoutCurrencies,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      PayoutCurrenciesResponse(
        payoutCurrencies: payoutCurrencies ?? this.payoutCurrencies,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
