/// generated automatically from flutter_deriv_api|lib/api/buy_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'buy_receive.g.dart';

/// JSON conversion for 'buy_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class BuyResponse extends Response {
  /// Initialize BuyResponse
  const BuyResponse({
    this.buy,
    this.subscription,
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
  factory BuyResponse.fromJson(Map<String, dynamic> json) =>
      _$BuyResponseFromJson(json);

  // Properties
  /// Receipt confirmation for the purchase
  final Map<String, dynamic> buy;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$BuyResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  BuyResponse copyWith({
    Map<String, dynamic> buy,
    Map<String, dynamic> subscription,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      BuyResponse(
        buy: buy ?? this.buy,
        subscription: subscription ?? this.subscription,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
