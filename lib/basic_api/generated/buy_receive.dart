/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/buy_receive.json

import '../response.dart';

/// BuyResponse class
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
        // ignore: avoid_as
        buy: json['buy'] as Map<String, dynamic>,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        subscription: json['subscription'] as Map<String, dynamic>,
      );

  /// Receipt confirmation for the purchase
  final Map<String, dynamic> buy;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'buy': buy,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'subscription': subscription,
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
