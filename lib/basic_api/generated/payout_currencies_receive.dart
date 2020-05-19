/// generated automatically from flutter_deriv_api|lib/basic_api/generated/payout_currencies_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'payout_currencies_receive.g.dart';

/// JSON conversion for 'payout_currencies_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class PayoutCurrenciesResponse extends Response {
  /// Initialize PayoutCurrenciesResponse
  const PayoutCurrenciesResponse({
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

  /// Creates an instance from JSON
  factory PayoutCurrenciesResponse.fromJson(Map<String, dynamic> json) =>
      _$PayoutCurrenciesResponseFromJson(json);

  // Properties
  /// Available payout currencies. Note: if a user is logged in, only the currency available for the account will be returned.
  final List<String> payoutCurrencies;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$PayoutCurrenciesResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  PayoutCurrenciesResponse copyWith({
    List<String> payoutCurrencies,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PayoutCurrenciesResponse(
        payoutCurrencies: payoutCurrencies ?? this.payoutCurrencies,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
