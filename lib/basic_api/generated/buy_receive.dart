/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/buy_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Buy response class
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

  /// Creates an instance from JSON
  factory BuyResponse.fromJson(Map<String, dynamic> json) => BuyResponse(
        buy: json['buy'] as Map<String, dynamic>,
        subscription: json['subscription'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Receipt confirmation for the purchase
  final Map<String, dynamic> buy;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'buy': buy,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
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
