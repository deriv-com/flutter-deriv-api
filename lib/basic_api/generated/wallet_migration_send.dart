/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/wallet_migration_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Wallet migration request class.
class WalletMigrationRequest extends Request {
  /// Initialize WalletMigrationRequest.
  const WalletMigrationRequest({
    required this.walletMigration,
    super.msgType = 'wallet_migration',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory WalletMigrationRequest.fromJson(Map<String, dynamic> json) =>
      WalletMigrationRequest(
        walletMigration: json['wallet_migration'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Wallet migration action.
  final String? walletMigration;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'wallet_migration': walletMigration,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  WalletMigrationRequest copyWith({
    String? walletMigration,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      WalletMigrationRequest(
        walletMigration: walletMigration ?? this.walletMigration,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
