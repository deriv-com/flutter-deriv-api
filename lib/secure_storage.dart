import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_deriv_api/models/account.dart';

/// A class for storing accounts information
class SecureStorage {
  /// Class constructor
  SecureStorage() {
    storage = const FlutterSecureStorage();
  }

  /// Storage object
  FlutterSecureStorage storage;

  /// Get accounts
  Future<Map<String, List<Account>>> get getAccounts async {
    final Map<String, List<Account>> result = <String, List<Account>>{};

    try {
      final Map<String, dynamic> accounts = Map<String, List<dynamic>>.from(
        jsonDecode((await storage.read(key: 'accounts')) ?? '{}'),
      );

      for (String key in accounts.keys) {
        final List<Map<String, dynamic>> accountList = accounts[key];
        result[key] = <Account>[];

        for (Map<String, dynamic> account in accountList) {
          result[key].add(Account.fromMap(account));
        }
      }
    } on Exception catch (error) {
      print(error);
    }

    return result;
  }

  /// Get default user
  Future<String> get getDefaultUser async => storage.read(key: 'defaultUser');

  /// Get default account.
  Future<String> get getDefaultAccount async =>
      storage.read(key: 'defaultAccount');

  /// Get all user accounts except default account
  Future<List<String>> get getOtherUsers async {
    final String defaultUser = await getDefaultUser;
    final Map<String, List<Account>> users = await getAccounts;

    users.remove(defaultUser);

    return List<String>.of(users.keys);
  }

  /// Remove all accounts
  Future<void> get clearAllAccounts async {
    await storage.delete(key: 'accounts');
    await storage.delete(key: 'defaultAccount');
    await storage.delete(key: 'defaultUser');
  }

  /// Get user account by email
  Future<List<Account>> getUserAccounts({
    String email,
  }) async {
    final Map<String, List<Account>> accounts = await getAccounts;

    print('email is: $email');
    print('account is: ${accounts[email]}');

    return accounts[email];
  }

  /// Add account to stored accounts
  Future<void> addAccount(List<Account> accounts) async {
    final Map<String, List<Account>> storedAccounts = await getAccounts;

    await setDefaultUser(accounts.first.email);
    await setDefaultAccount(accounts.first.acct);

    storedAccounts[accounts.first.email] = accounts;

    await storage.write(key: 'accounts', value: jsonEncode(storedAccounts));
  }

  /// Set default user
  Future<void> setDefaultUser(String email) async =>
      storage.write(key: 'defaultUser', value: email);

  /// Set Default Account
  Future<void> setDefaultAccount(String acct) async =>
      storage.write(key: 'defaultAccount', value: acct);

  /// Switch user by email
  Future<void> switchUser(String email) async {
    final List<Account> userAccounts = await getUserAccounts(email: email);

    await setDefaultUser(email);
    await setDefaultAccount(userAccounts.first.acct);
  }

  /// Save last input of user
  Future<void> saveUserInput(double userInput) async => storage.write(
        key: 'lastUserInput',
        value: userInput.toString(),
      );

  /// Get last input of user
  Future<String> getLastUserInput() async => storage.read(key: 'lastUserInput');
}
