import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/basic_api/generated/wallet_migration_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

import 'wallet_migration_response_result.dart';

/// The extended version of the [WalletMigrationResponse] class to implement
/// the API call methods.
class WalletMigrationResponseExtended extends WalletMigrationResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Fetches the wallet migration status.
  WalletMigrationResponseExtended fetchWalletMigration({
    required WalletMigrationRequest request,
  }) {
    throw UnimplementedError();
  }
}
