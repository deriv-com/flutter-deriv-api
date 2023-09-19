/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_available_accounts_to_transfer_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Get available accounts to transfer receive class.
class GetAvailableAccountsToTransferReceive extends Response {
  /// Initialize GetAvailableAccountsToTransferReceive.
  const GetAvailableAccountsToTransferReceive({
    this.getAvailableAccountsToTransfer,
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
  factory GetAvailableAccountsToTransferReceive.fromJson(
          Map<String, dynamic> json) =>
      GetAvailableAccountsToTransferReceive(
        getAvailableAccountsToTransfer:
            json['get_available_accounts_to_transfer'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Returns a list of accounts available to transfer
  final Map<String, dynamic>? getAvailableAccountsToTransfer;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_available_accounts_to_transfer': getAvailableAccountsToTransfer,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetAvailableAccountsToTransferReceive copyWith({
    Map<String, dynamic>? getAvailableAccountsToTransfer,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      GetAvailableAccountsToTransferReceive(
        getAvailableAccountsToTransfer: getAvailableAccountsToTransfer ??
            this.getAvailableAccountsToTransfer,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
