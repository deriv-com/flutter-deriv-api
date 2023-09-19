/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_transfer_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Paymentagent transfer receive class.
class PaymentagentTransferReceive extends Response {
  /// Initialize PaymentagentTransferReceive.
  const PaymentagentTransferReceive({
    this.clientToFullName,
    this.clientToLoginid,
    this.paymentagentTransfer,
    this.transactionId,
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
  factory PaymentagentTransferReceive.fromJson(Map<String, dynamic> json) =>
      PaymentagentTransferReceive(
        clientToFullName: json['client_to_full_name'] as String?,
        clientToLoginid: json['client_to_loginid'] as String?,
        paymentagentTransfer: json['paymentagent_transfer'] as int?,
        transactionId: json['transaction_id'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The `transfer_to` client full name
  final String? clientToFullName;

  /// The `transfer_to` client loginid
  final String? clientToLoginid;

  /// If set to `1`, transfer success. If set to `2`, dry-run success.
  final int? paymentagentTransfer;

  /// Reference ID of transfer performed
  final int? transactionId;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'client_to_full_name': clientToFullName,
        'client_to_loginid': clientToLoginid,
        'paymentagent_transfer': paymentagentTransfer,
        'transaction_id': transactionId,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentTransferReceive copyWith({
    String? clientToFullName,
    String? clientToLoginid,
    int? paymentagentTransfer,
    int? transactionId,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      PaymentagentTransferReceive(
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginid: clientToLoginid ?? this.clientToLoginid,
        paymentagentTransfer: paymentagentTransfer ?? this.paymentagentTransfer,
        transactionId: transactionId ?? this.transactionId,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
