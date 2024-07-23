/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/jtoken_create_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Jtoken create receive class.
class JtokenCreateReceive extends Response {
  /// Initialize JtokenCreateReceive.
  const JtokenCreateReceive({
    this.jtokenCreate,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory JtokenCreateReceive.fromJson(Map<String, dynamic> json) =>
      JtokenCreateReceive(
        jtokenCreate: json['jtoken_create'] as String?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The JToken created.
  final String? jtokenCreate;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'jtoken_create': jtokenCreate,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  JtokenCreateReceive copyWith({
    String? jtokenCreate,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      JtokenCreateReceive(
        jtokenCreate: jtokenCreate ?? this.jtokenCreate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
