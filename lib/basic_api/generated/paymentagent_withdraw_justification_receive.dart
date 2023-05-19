/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_withdraw_justification_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Paymentagent withdraw justification receive class.
class PaymentagentWithdrawJustificationReceive extends Response {
  /// Initialize PaymentagentWithdrawJustificationReceive.
  const PaymentagentWithdrawJustificationReceive({
    this.paymentagentWithdrawJustification,
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
  factory PaymentagentWithdrawJustificationReceive.fromJson(
          Map<String, dynamic> json) =>
      PaymentagentWithdrawJustificationReceive(
        paymentagentWithdrawJustification:
            json['paymentagent_withdraw_justification'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// 1 on success
  final int? paymentagentWithdrawJustification;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'paymentagent_withdraw_justification':
            paymentagentWithdrawJustification,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentWithdrawJustificationReceive copyWith({
    int? paymentagentWithdrawJustification,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      PaymentagentWithdrawJustificationReceive(
        paymentagentWithdrawJustification: paymentagentWithdrawJustification ??
            this.paymentagentWithdrawJustification,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
