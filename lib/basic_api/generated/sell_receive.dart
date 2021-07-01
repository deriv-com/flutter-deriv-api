/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Sell response class.
class SellResponse extends Response {
  /// Initialize SellResponse.
  const SellResponse({
    this.sell,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory SellResponse.fromJson(Map<String, dynamic> json) => SellResponse(
        sell: json['sell'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Receipt for the transaction
  final Map<String, dynamic>? sell;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'sell': sell,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SellResponse copyWith({
    Map<String, dynamic>? sell,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      SellResponse(
        sell: sell ?? this.sell,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
