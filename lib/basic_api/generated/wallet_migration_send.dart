/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/wallet_migration_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Wallet migration request class.
class WalletMigrationRequest extends Request {
  /// Initialize WalletMigrationRequest.
  const WalletMigrationRequest({
    this.loginid,
    required this.walletMigration,
    super.msgType = 'wallet_migration',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory WalletMigrationRequest.fromJson(Map<String, dynamic> json) =>
      WalletMigrationRequest(
        loginid: json['loginid'] as String?,
        walletMigration: json['wallet_migration'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Wallet migration action.
  final String? walletMigration;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'wallet_migration': walletMigration,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  WalletMigrationRequest copyWith({
    String? loginid,
    String? walletMigration,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      WalletMigrationRequest(
        loginid: loginid ?? this.loginid,
        walletMigration: walletMigration ?? this.walletMigration,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
