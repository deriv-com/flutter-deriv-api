import 'package:flutter_deriv_api/models/base.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';

/// A class for keeping account information
abstract class AccountModel extends BaseModel {
  /// Class constructor
  AccountModel({
    BinaryAPI api,
    this.acct,
    this.cur,
    this.token,
    this.email,
  }) : super(api: api);

  /// Account details
  String acct;

  /// Token for client login session
  String token;

  /// Account currency
  String cur;

  /// Client email
  String email;

  /// Indicates that client is advertiser
  bool isAdvertiser = false;
}
