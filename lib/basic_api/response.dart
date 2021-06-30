import 'package:equatable/equatable.dart';

/// super class of all requests.
class Response extends Equatable {
  /// Initializes
  const Response({
    this.echoReq,
    this.error,
    this.msgType,
    this.reqId,
  });

  /// Creates an instance from JSON.
  factory Response.fromJson(Map<String, dynamic> json) => Response(
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Echo of the request made.
  final Map<String, dynamic>? echoReq;

  /// Error
  final Map<String, dynamic>? error;

  /// Action name of the request made.
  final String? msgType;

  /// [Optional] Used to map request to response.
  final int? reqId;

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Generate a copy of instance with given parameters.
  Response copyWith({
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      Response(
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
