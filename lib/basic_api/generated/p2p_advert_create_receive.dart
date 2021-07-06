/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_create_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p advert create receive class.
class P2pAdvertCreateReceive extends Response {
  /// Initialize P2pAdvertCreateReceive.
  const P2pAdvertCreateReceive({
    this.p2pAdvertCreate,
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
  factory P2pAdvertCreateReceive.fromJson(Map<String, dynamic> json) =>
      P2pAdvertCreateReceive(
        p2pAdvertCreate: json['p2p_advert_create'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The information of the created P2P advert.
  final Map<String, dynamic>? p2pAdvertCreate;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_advert_create': p2pAdvertCreate,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertCreateReceive copyWith({
    Map<String, dynamic>? p2pAdvertCreate,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pAdvertCreateReceive(
        p2pAdvertCreate: p2pAdvertCreate ?? this.p2pAdvertCreate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
