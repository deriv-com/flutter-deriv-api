import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/wallet_migration_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/wallet_migration_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

import 'wallet_migration_response_result.dart';

/// The extended version of the [WalletMigrationResponse] class to implement
/// the API call methods.
class WalletMigrationResponseExtended extends WalletMigrationResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Initiates the migration process to wallet. can also check the status of
  /// the migration or reset it if it has failed for any reason.
  ///
  /// [request] is the request object. For its `walletMigration` field, you can
  /// set the following values:
  /// - `start` to initiate the migration process.
  /// - `state` to check the status of the migration.
  /// - `reset` to reset the migration process.
  static Future<WalletMigrationResponse> fetchWalletMigration({
    required WalletMigrationRequest request,
  }) async {
    final WalletMigrationReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return WalletMigrationResponse.fromJson(response.walletMigration);
  }

  /// Starts the user's migration process to wallet.
  static Future<WalletMigrationResponse> startMigration() =>
      fetchWalletMigration(
        request: const WalletMigrationRequest(
          walletMigration: 'start',
        ),
      );

  /// Resets the user's migration process to wallet.
  static Future<WalletMigrationResponse> resetMigration() =>
      fetchWalletMigration(
        request: const WalletMigrationRequest(
          walletMigration: 'reset',
        ),
      );

  /// Checks the status of the user's migration process to wallet.
  static Future<WalletMigrationResponse> checkStatus() => fetchWalletMigration(
        request: const WalletMigrationRequest(
          walletMigration: 'state',
        ),
      );
}
