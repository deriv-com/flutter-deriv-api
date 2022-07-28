/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/link_wallet_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Link wallet receive class.
class LinkWalletReceive extends Response {
  /// Initialize LinkWalletReceive.
  const LinkWalletReceive({
    this.linkWallet,
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
  factory LinkWalletReceive.fromJson(Map<String, dynamic> json) =>
      LinkWalletReceive(
        linkWallet: json['link_wallet'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// 1 on success
  final int? linkWallet;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'link_wallet': linkWallet,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LinkWalletReceive copyWith({
    int? linkWallet,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      LinkWalletReceive(
        linkWallet: linkWallet ?? this.linkWallet,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
