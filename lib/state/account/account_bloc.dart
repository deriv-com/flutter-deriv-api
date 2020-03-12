import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/models/api_error.dart';

import 'package:flutter_deriv_api/secure_storage.dart';
import 'package:flutter_deriv_api/models/account.dart';
import 'package:flutter_deriv_api/models/advertiser.dart';
import 'package:flutter_deriv_api/api/authorize_receive.dart';
import 'package:flutter_deriv_api/state/connection/connection_bloc.dart';

part 'account_event.dart';
part 'account_state.dart';

/// Account bloc
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  /// Class constructor
  AccountBloc({this.connectionBloc}) : super() {
    connectionBloc.listen((ConnectionState state) {
      if (state is Disconnected && this.state is AccountLoaded) {
        add(LogoutAccount());
      } else if (state is Connected && this.state is InitialAccountState) {
        add(LoginAccount());
      }
    });
  }

  /// Connection bloc
  final ConnectionBloc connectionBloc;

  /// Secure storage
  final SecureStorage _storage = SecureStorage();

  @override
  AccountState get initialState => InitialAccountState();

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    print('Event $event on account bloc');

    final String defaultUser = await _storage.getDefaultUser;
    final String defaultAccount = await _storage.getDefaultAccount;
    final List<Account> accounts =
        await _storage.getUserAccounts(email: defaultUser);
    final ConnectionState connectionState = connectionBloc.state;

    if (event is Fetch &&
        connectionState is Connected &&
        state is LoadingAccount) {
      try {
        final String token = accounts
            .lastWhere((Account account) => account.acct == defaultAccount)
            .token;
        final AuthorizeResponse authResponse =
            await connectionState.api.authorize(token);

        if (authResponse.authorize == null) {
          await SecureStorage().clearAllAccounts;

          throw Exception('Authorization Failed');
        }

        final Map<String, dynamic> advertiserInfo =
            await connectionState.api.p2pAgentInfo();

        yield AccountLoaded(
          accounts: accounts,
          defaultUser: defaultUser,
          localCurrencyConfig: authResponse.authorize['local_currencies'],
          defaultAccount: defaultAccount,
          otherUsers: await _storage.getOtherUsers,
          accountInfo: authResponse.authorize,
          advertiserInfo: advertiserInfo.containsKey('p2p_advertiser_info')
              ? Advertiser.fromMap(advertiserInfo['p2p_advertiser_info'])
              : null,
        );
      } on Exception catch (error) {
        print('error $error');
        yield AccountError(
          error: APIError(
            code: '',
            message: error.toString(),
          ),
        );
      }
    } else if (event is SwitchUser) {
      try {
        yield InitialAccountState();

        await _storage.switchUser(event.email);

        add(LoginAccount());
      } on Exception catch (error) {
        print('SwitchUser error: $error');
      }
    } else if (event is LogoutAccount) {
      if (connectionState is Connected) {
        await connectionState.api.logout();
        await SecureStorage().clearAllAccounts;
      }

      yield InitialAccountState();
    } else if (event is LoginAccount && !(state is LoadingAccount)) {
      if (accounts == null && event.accounts == null) {
        yield InitialAccountState();
      } else if (connectionState is Connected) {
        yield LoadingAccount();
        if (event.accounts == null) {
          add(Fetch());
        } else {
          final List<Account> crUSDAccounts = event.accounts
              .where((Account account) =>
                  account.acct.toUpperCase().contains('CR') &&
                  (account.cur ?? '').toUpperCase() == 'USD')
              .toList();

          if (crUSDAccounts == null || crUSDAccounts.isEmpty) {
            //Is not CR client with USD
            final bool isVirtualAccount = event.accounts.length == 1 &&
                event.accounts[0].acct.toUpperCase().contains('VRTC');
            if (isVirtualAccount) {
              yield AccountError(
                error: APIError(
                  code: 'NotAvailable',
                  message:
                      'Sorry, we only support real USD accounts at the moment.',
                ),
              );
            } else {
              final List<Account> crAccounts = event.accounts
                  .where((Account account) =>
                      account.acct.toUpperCase().contains('CR'))
                  .toList();

              if (crAccounts == null || crAccounts.isEmpty) {
                //Is not a CR client
                yield AccountError(
                  error: APIError(
                    code: 'NotAvailable',
                    message: 'Not available in your country.',
                  ),
                );
              } else {
                yield AccountError(
                  error: APIError(
                    code: 'NotAvailable',
                    message:
                        'Sorry, we only support real USD accounts at the moment.',
                  ),
                );
              }
            }
          } else {
            final AuthorizeResponse authResponse =
                await connectionState.api.authorize(crUSDAccounts.first.token);
            if (authResponse.authorize == null) {
              yield AccountError(
                error: APIError(
                  code: 'FailedToLogin',
                  message: 'The token is not valid.',
                ),
              );
            } else {
              final String userEmail = authResponse.authorize['email'];

              for (Account account in crUSDAccounts) {
                account.email = userEmail;
              }

              await SecureStorage().addAccount(crUSDAccounts);
              await SecureStorage()
                  .setDefaultUser(authResponse.authorize['email']);
              await SecureStorage().setDefaultAccount(crUSDAccounts.first.acct);

              add(Fetch());
            }
          }
        }
      } else {
        yield InitialAccountState();
      }
    }
  }
}
