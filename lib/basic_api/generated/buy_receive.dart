/// generated automatically from flutter_deriv_api|lib/basic_api/generated/buy_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'buy_receive.g.dart';

/// JSON conversion for 'buy_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class BuyResponse extends Response {
  /// Initialize BuyResponse
  const BuyResponse({
    this.buy,
    this.subscription,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      BuyResponse(
        buy: buy ?? this.buy,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
