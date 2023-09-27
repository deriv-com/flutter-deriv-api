/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/link_wallet_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Link wallet request class.
class LinkWalletRequest extends Request {
  /// Initialize LinkWalletRequest.
  const LinkWalletRequest({
    required this.clientId,
    this.linkWallet = true,
    required this.walletId,
    super.msgType = 'link_wallet',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory LinkWalletRequest.fromJson(Map<String, dynamic> json) =>
      LinkWalletRequest(
        clientId: json['client_id'] as String?,
        linkWallet:
            json['link_wallet'] == null ? null : json['link_wallet'] == 1,
        walletId: json['wallet_id'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The unique identifier for this trading account.
  final String? clientId;

  /// Must be `true`
  final bool? linkWallet;

  /// The unique identifier for this wallet.
  final String? walletId;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'client_id': clientId,
        'link_wallet': linkWallet == null
            ? null
            : linkWallet!
                ? 1
                : 0,
        'wallet_id': walletId,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LinkWalletRequest copyWith({
    String? clientId,
    bool? linkWallet,
    String? walletId,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      LinkWalletRequest(
        clientId: clientId ?? this.clientId,
        linkWallet: linkWallet ?? this.linkWallet,
        walletId: walletId ?? this.walletId,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
