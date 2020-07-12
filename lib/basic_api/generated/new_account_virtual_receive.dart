/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_virtual_receive.json

import '../response.dart';

/// NewAccountVirtualResponse class
class NewAccountVirtualResponse extends Response {
  /// Initialize NewAccountVirtualResponse
  const NewAccountVirtualResponse({
    this.newAccountVirtual,
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
  factory NewAccountVirtualResponse.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtualResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        newAccountVirtual: json['new_account_virtual'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// New virtual-money account details
  final Map<String, dynamic> newAccountVirtual;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'new_account_virtual': newAccountVirtual,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountVirtualResponse copyWith({
    Map<String, dynamic> newAccountVirtual,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      NewAccountVirtualResponse(
        newAccountVirtual: newAccountVirtual ?? this.newAccountVirtual,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
