/// generated automatically from flutter_deriv_api|lib/api/sell_expired_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'sell_expired_receive.g.dart';

/// JSON conversion for 'sell_expired_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellExpiredResponse extends Response {
  /// Initialize SellExpiredResponse
  const SellExpiredResponse({
    this.sellExpired,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      SellExpiredResponse(
        sellExpired: sellExpired ?? this.sellExpired,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
