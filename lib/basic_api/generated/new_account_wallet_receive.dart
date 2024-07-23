/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_wallet_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// New account wallet receive class.
class NewAccountWalletReceive extends Response {
  /// Initialize NewAccountWalletReceive.
  const NewAccountWalletReceive({
    this.newAccountWallet,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory NewAccountWalletReceive.fromJson(Map<String, dynamic> json) =>
      NewAccountWalletReceive(
        newAccountWallet: json['new_account_wallet'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// New wallet account details
  final Map<String, dynamic>? newAccountWallet;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'new_account_wallet': newAccountWallet,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountWalletReceive copyWith({
    Map<String, dynamic>? newAccountWallet,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      NewAccountWalletReceive(
        newAccountWallet: newAccountWallet ?? this.newAccountWallet,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
