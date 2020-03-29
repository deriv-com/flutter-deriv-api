import 'package:flutter_deriv_api/models/account.dart';
import 'package:flutter_deriv_api/api/authorize_receive.dart';
import 'package:flutter_deriv_api/services/secure_storage.dart';
import 'package:flutter_deriv_api/abstraction_classes/order.dart';
import 'package:flutter_deriv_api/abstraction_classes/advert.dart';
import 'package:flutter_deriv_api/abstraction_classes/advertiser.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';

/// Account abstraction class
class Account extends AccountModel {
  /// Class constructor
  Account({
    BinaryAPI api,
    String acct,
    String cur,
    String token,
    String email,
  }) : super(
          api: api,
          acct: acct,
          cur: cur,
          token: token,
          email: email,
        );

  /// Extract class from a map object
  factory Account.fromMap(Map<String, dynamic> data) => Account(
        acct: data['acct'],
        token: data['token'],
        cur: data['cur'],
        email: data['email'],
      );

  /// Extract class from a json object
  factory Account.fromJson(Map<String, dynamic> data) => Account(
        acct: data['acct'],
        token: data['token'],
        cur: data['cur'] ?? 'USD',
        email: data['email'],
      );

  /// Advertiser abstraction
  Advertiser _advertiser;

  /// Advert abstraction
  Advert _advert;

  /// Order abstraction
  Order _order;

  /// Get advertiser
  Advertiser get advertise => _advertiser = _advertiser ?? Advertiser(api: api);

  /// Get advert
  Advert get advert => _advert = _advert ?? Advert(api: api);

  /// Get order
  Order get order => _order = _order ?? Order(api: api);

  /// Convert class to json object
  Map<String, dynamic> toJson() => <String, dynamic>{
        'acct': acct,
        'token': token,
        'cur': cur,
        'email': email,
      };

  /// Authorize by token
  Future<AuthorizeResponse> authorize() async => api.authorize(token);

  /// Logout
  Future<void> logout() async {
    await api.logout();
    await SecureStorage().clearAllAccounts();
  }
}
