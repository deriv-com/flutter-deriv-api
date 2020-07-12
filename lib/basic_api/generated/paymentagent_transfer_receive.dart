/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_transfer_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Paymentagent transfer response class
class PaymentagentTransferResponse extends Response {
  /// Initialize PaymentagentTransferResponse
  const PaymentagentTransferResponse({
    this.clientToFullName,
    this.clientToLoginid,
    this.paymentagentTransfer,
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
  factory PaymentagentTransferResponse.fromJson(Map<String, dynamic> json) =>
      PaymentagentTransferResponse(
        clientToFullName: json['client_to_full_name'] as String,
        clientToLoginid: json['client_to_loginid'] as String,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        paymentagentTransfer: json['paymentagent_transfer'] as int,
        reqId: json['req_id'] as int,
        transactionId: json['transaction_id'] as int,
      );

  /// The `transfer_to` client full name
  final String clientToFullName;

  /// The `transfer_to` client loginid
  final String clientToLoginid;

  /// If set to `1`, transfer success. If set to `2`, dry-run success.
  final int paymentagentTransfer;

  /// Reference ID of transfer performed
  final int transactionId;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'client_to_full_name': clientToFullName,
        'client_to_loginid': clientToLoginid,
        'echo_req': echoReq,
        'msg_type': msgType,
        'paymentagent_transfer': paymentagentTransfer,
        'req_id': reqId,
        'transaction_id': transactionId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentTransferResponse copyWith({
    String clientToFullName,
    String clientToLoginid,
    int paymentagentTransfer,
    int transactionId,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PaymentagentTransferResponse(
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginid: clientToLoginid ?? this.clientToLoginid,
        paymentagentTransfer: paymentagentTransfer ?? this.paymentagentTransfer,
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
