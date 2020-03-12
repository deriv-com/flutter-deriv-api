import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:flutter_deriv_api/models/account.dart';

/// A webview to show login page and retrieve account information from
/// the redirect url.
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// We just use an arbitrary value here that we can register in our
  /// application as a URL we handle. That way, when we're redirected to
  /// it, we can take over.
  /// However, it usually doesn't even get that far: we also watch state
  /// changes on the webview widget, so if we load this URL then we'll
  /// hope to see that before the OS starts the redirect.
  final String redirectURL = 'https://api-demo.deriv.com';
  final FlutterWebviewPlugin webview = FlutterWebviewPlugin();

  StreamSubscription<void> _onDestroy;
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  String token;

  @override
  void dispose() {
    // Every listener should be cancelled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    webview.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    webview.close();

    _onDestroy = webview.onDestroy.listen((_) {
      // Presumably we'd want to notify and trigger any cleanup events in here
    });

    _onStateChanged =
        webview.onStateChanged.listen((final WebViewStateChanged state) {
      print('onStateChanged: ${state.type} ${state.url}');
    });

    // Add a listener to on url changed
    _onUrlChanged = webview.onUrlChanged.listen((final String url) {
      if (mounted) {
        setState(() {
          print('URL changed: $url');
          if (url.startsWith(redirectURL)) {
            emitURL(url);

            // This seems relatively uncontroversial
            webview.close();
          } else {
            print('Invalid URL detected - $url');
            // We're not closing the page here. Why not? Well, maybe there's a useful error message...?
            // If not, the back functionality might do something helpful
          }
        });
      } else {
        print(
            'Failure to handle URL event, since this route is not currently mounted');
      }
    });
  }

  final RegExp re = RegExp('^([a-z]+)([0-9]+)\$');
  void emitURL(final String url) {
    if (url.startsWith(redirectURL)) {
      final Uri u = Uri.parse(url);

      // We're not massively concerned about performance here, since login only
      // happens rarely: we walk through the query parameters and extract the
      // type and index for each. This would be something like `acct1`, `curr1`
      // etc. and the ordering of the parameters is really not something we can
      // rely on.
      final Map<int, Map<String, String>> items = <int, Map<String, String>>{};
      u.queryParameters.forEach((String k, String v) {
        if (re.hasMatch(k)) {
          // At the time of writing, we don't have access to
          // https://github.com/DirectMyFile/dep-destructuring/blob/master/proposal.md
          final RegExpMatch match = re.firstMatch(k);
          final int idx = num.parse(match.group(2)) - 1;
          final String key = match.group(1);

          items.putIfAbsent(idx, () => <String, String>{});
          items[idx].putIfAbsent(key, () => v);
        }
      });

      final List<Account> accountList = <Account>[];
      // Slightly cumbersome, could be neater with rx but for a tiny static
      // list it really doesn't seem worth the effort.
      items.keys.toList()
        ..sort()
        ..forEach((final int k) {
          final Map<String, String> map = items[k];

          accountList.add(Account.fromMap(map));
        });

      // At this point, we have a collection of accounts, and presumably something
      // is going to react to that in a suitably-surprised fashion.
      print('Account list:');
      for (Account a in accountList) {
        print('${a.acct} currency ${a.cur} and token ${a.token}');
      }

      // Things we could be doing here!
      // saveToken(token);
      // Also, let's show a more appropriate page!
      // Navigator.of(context).pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    const String loginUrl =
        'https://oauth.binary.com/oauth2/authorize?app_id=19175';

    return WebviewScaffold(
        url: loginUrl,
        appBar: AppBar(
          title: const Text('Sign in'),
        ));
  }
}
