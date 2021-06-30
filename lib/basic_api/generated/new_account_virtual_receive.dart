/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_virtual_receive.json.
// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// New account virtual response class.
class NewAccountVirtualResponse extends Response {
  /// Initialize NewAccountVirtualResponse.
  const NewAccountVirtualResponse({
    this.newAccountVirtual,
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
  factory NewAccountVirtualResponse.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtualResponse(
        newAccountVirtual: json['new_account_virtual'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// New virtual-money account details
  final Map<String, dynamic>? newAccountVirtual;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'new_account_virtual': newAccountVirtual,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountVirtualResponse copyWith({
    Map<String, dynamic>? newAccountVirtual,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      NewAccountVirtualResponse(
        newAccountVirtual: newAccountVirtual ?? this.newAccountVirtual,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
