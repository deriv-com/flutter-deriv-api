import 'dart:async';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:preferences/preference_service.dart';

import 'package:flutter_deriv_api/helpers.dart';
import 'package:flutter_deriv_api/models/account.dart';

const String _brand = 'deriv';

const List<String> _redirectURLs = <String>[
  'deriv://p2p',
  'https://p2p-cashier.deriv.com',
];

/// Get endpoint
String get endpoint =>
    parseWSUrl(
      PrefService.get('endpoint'),
      isAuthUrl: true,
    ) ??
    'oauth.deriv.app';

/// Get app id
String get appID => PrefService.get('appId') ?? '1008';

/// Get language
String get language => PrefService.get('language') ?? 'en';

/// get login url
String get loginUrl => Uri(
      scheme: 'https',
      host: endpoint,
      path: '/oauth2/authorize',
      queryParameters: <String, dynamic>{
        'brand': _brand,
        'app_id': appID,
        'l': language,
      },
    ).toString();

List<Account> _parseAccounts(final String resultUrl) {
  final Uri url = Uri.parse(resultUrl);
  final List<Account> accounts = <Account>[];
  final RegExp matchRegEcp = RegExp('^([a-z]+)([0-9]+)\$');
  final Map<int, Map<String, String>> items = <int, Map<String, String>>{};

  url.queryParameters.forEach(
    (String parameterKey, String parameterValue) {
      if (matchRegEcp.hasMatch(parameterKey)) {
        final RegExpMatch match = matchRegEcp.firstMatch(parameterKey);
        final int index = num.parse(match.group(2)) - 1;
        final String key = match.group(1);

        items.putIfAbsent(index, () => <String, String>{});
        items[index].putIfAbsent(key, () => parameterValue);
      }
    },
  );

  final List<int> keys = items.keys.toList()..sort();

  for (int key in keys) {
    accounts.add(Account.fromMap(items[key]));
  }

  print('account list:');

  for (Account account in accounts) {
    print('${account.acct} currency ${account.cur} and token ${account.token}');
  }

  return accounts;
}

/// Get accounts
Future<List<Account>> getAccounts() async {
  final Completer<List<Account>> fetchAccountsCompleter =
      Completer<List<Account>>();

  if (await canLaunch(loginUrl)) {
    await launch(loginUrl);

    getLinksStream().listen((String url) {
      print('url changed: $url');

      for (String redirectURL in _redirectURLs) {
        if (url.startsWith(redirectURL)) {
          fetchAccountsCompleter.complete(_parseAccounts(url));
        }
      }

      if (!fetchAccountsCompleter.isCompleted) {
        fetchAccountsCompleter
            .completeError('get accounts error, invalid url detected: $url');
      }
    }, onError: (dynamic error) {
      fetchAccountsCompleter.completeError('get accounts error: $error');
    });
  } else {
    fetchAccountsCompleter
        .completeError('get accounts error, could not launch url: $loginUrl');
  }

  return fetchAccountsCompleter.future;
}
