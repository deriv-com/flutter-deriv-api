/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_receive.json

import '../response.dart';

/// SellResponse class
class SellResponse extends Response {
  /// Initialize SellResponse
  const SellResponse({
    this.sell,
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
  factory SellResponse.fromJson(Map<String, dynamic> json) => SellResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        sell: json['sell'] as Map<String, dynamic>,
      );

  /// Receipt for the transaction
  final Map<String, dynamic> sell;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'sell': sell,
      };

  /// Creates a copy of instance with given parameters
  @override
  SellResponse copyWith({
    Map<String, dynamic> sell,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      SellResponse(
        sell: sell ?? this.sell,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
