/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/wallet_migration_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Wallet migration receive class.
class WalletMigrationReceive extends Response {
  /// Initialize WalletMigrationReceive.
  const WalletMigrationReceive({
    this.walletMigration,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory WalletMigrationReceive.fromJson(Map<String, dynamic> json) =>
      WalletMigrationReceive(
        walletMigration: json['wallet_migration'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The information regarding wallet migration state
  final Map<String, dynamic>? walletMigration;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'wallet_migration': walletMigration,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  WalletMigrationReceive copyWith({
    Map<String, dynamic>? walletMigration,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      WalletMigrationReceive(
        walletMigration: walletMigration ?? this.walletMigration,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
