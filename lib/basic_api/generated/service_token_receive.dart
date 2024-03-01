/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/service_token_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Service token receive class.
class ServiceTokenReceive extends Response {
  /// Initialize ServiceTokenReceive.
  const ServiceTokenReceive({
    this.serviceToken,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ServiceTokenReceive.fromJson(Map<String, dynamic> json) =>
      ServiceTokenReceive(
        serviceToken: json['service_token'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Service specific tokens and data.
  final Map<String, dynamic>? serviceToken;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'service_token': serviceToken,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ServiceTokenReceive copyWith({
    Map<String, dynamic>? serviceToken,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ServiceTokenReceive(
        serviceToken: serviceToken ?? this.serviceToken,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
