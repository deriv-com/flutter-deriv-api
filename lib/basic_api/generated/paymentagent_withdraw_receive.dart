/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_withdraw_receive.json

import '../response.dart';

/// PaymentagentWithdrawResponse class
class PaymentagentWithdrawResponse extends Response {
  /// Initialize PaymentagentWithdrawResponse
  const PaymentagentWithdrawResponse({
    this.paymentagentName,
    this.paymentagentWithdraw,
    this.transactionId,
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
  factory PaymentagentWithdrawResponse.fromJson(Map<String, dynamic> json) =>
      PaymentagentWithdrawResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        paymentagentName: json['paymentagent_name'] as String,
        // ignore: avoid_as
        paymentagentWithdraw: json['paymentagent_withdraw'] as int,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        transactionId: json['transaction_id'] as int,
      );

  /// Payment agent name.
  final String paymentagentName;

  /// If set to `1`, withdrawal success. If set to `2`, dry-run success.
  final int paymentagentWithdraw;

  /// Reference ID of withdrawal performed.
  final int transactionId;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'paymentagent_name': paymentagentName,
        'paymentagent_withdraw': paymentagentWithdraw,
        'req_id': reqId,
        'transaction_id': transactionId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentWithdrawResponse copyWith({
    String paymentagentName,
    int paymentagentWithdraw,
    int transactionId,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PaymentagentWithdrawResponse(
        paymentagentName: paymentagentName ?? this.paymentagentName,
        paymentagentWithdraw: paymentagentWithdraw ?? this.paymentagentWithdraw,
        transactionId: transactionId ?? this.transactionId,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
