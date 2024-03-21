import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/wallet_migration_response_extended.dart';
import 'package:flutter_deriv_api/api/response/wallet_migration_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/wallet_migration_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Wallet migration', () {
    setUpAll(() => APIInitializer().initialize(api: MockAPI()));

    tearDownAll(() => Injector().dispose());

    test(
      'fetchWalletMigration method returns the expected result.',
      () async {
        final WalletMigrationResponse response =
            await WalletMigrationResponseExtended.fetchWalletMigration(
          request: const WalletMigrationRequest(walletMigration: 'state'),
        );

        expect(response.walletMigration?.state, StateEnum.eligible);
        expect(response.walletMigration?.accountList?.length, 2);

        final AccountListItem? firstAccount =
            response.walletMigration?.accountList?.first;

        expect(firstAccount?.currency, 'USD');
        expect(firstAccount?.platform, AccountListItemPlatformEnum.dwallet);
        expect(
          firstAccount?.accountCategory,
          AccountCategoryEnum.wallet,
        );
        expect(firstAccount?.accountType, 'virtual');
        expect(firstAccount?.linkAccounts.length, 1);
      },
    );

    test(
      'checkStatus method returns the expected result.',
      () async {
        final WalletMigrationResponse response =
            await WalletMigrationResponseExtended.checkStatus();

        expect(response.walletMigration?.state, StateEnum.eligible);
        expect(response.walletMigration?.accountList?.length, 2);

        final AccountListItem? firstAccount =
            response.walletMigration?.accountList?.first;

        expect(firstAccount?.currency, 'USD');
        expect(firstAccount?.platform, AccountListItemPlatformEnum.dwallet);
        expect(
          firstAccount?.accountCategory,
          AccountCategoryEnum.wallet,
        );
        expect(firstAccount?.accountType, 'virtual');
        expect(firstAccount?.linkAccounts.length, 1);
      },
    );
  });
}
