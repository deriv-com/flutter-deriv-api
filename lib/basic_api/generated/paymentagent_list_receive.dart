/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_list_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Paymentagent list receive class.
class PaymentagentListReceive extends Response {
  /// Initialize PaymentagentListReceive.
  const PaymentagentListReceive({
    this.paymentagentList,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PaymentagentListReceive.fromJson(Map<String, dynamic> json) =>
      PaymentagentListReceive(
        paymentagentList: json['paymentagent_list'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Payment Agent List
  final Map<String, dynamic>? paymentagentList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'paymentagent_list': paymentagentList,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentListReceive copyWith({
    Map<String, dynamic>? paymentagentList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      PaymentagentListReceive(
        paymentagentList: paymentagentList ?? this.paymentagentList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
