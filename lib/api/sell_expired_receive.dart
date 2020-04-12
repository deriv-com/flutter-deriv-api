/// generated automatically from flutter_deriv_api|lib/api/sell_expired_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'sell_expired_receive.g.dart';

/// JSON conversion for 'sell_expired_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellExpiredResponse extends Response {
  /// Initialize SellExpiredResponse
  SellExpiredResponse({
    this.sellExpired,
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
  factory SellExpiredResponse.fromJson(Map<String, dynamic> json) =>
      _$SellExpiredResponseFromJson(json);

  // Properties
  /// Sell expired contract object containing count of contracts sold
  final Map<String, dynamic> sellExpired;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$SellExpiredResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  SellExpiredResponse copyWith({
    Map<String, dynamic> sellExpired,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      SellExpiredResponse(
        sellExpired: sellExpired ?? this.sellExpired,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
