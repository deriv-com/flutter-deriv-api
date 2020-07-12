/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_expired_receive.json

import '../response.dart';

/// SellExpiredResponse class
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

  /// Creates an instance from JSON
  factory SellExpiredResponse.fromJson(Map<String, dynamic> json) =>
      SellExpiredResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        sellExpired: json['sell_expired'] as Map<String, dynamic>,
      );

  /// Sell expired contract object containing count of contracts sold
  final Map<String, dynamic> sellExpired;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'sell_expired': sellExpired,
      };

  /// Creates a copy of instance with given parameters
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
