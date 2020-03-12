/// A class for keeping account information
class Account {
  /// Class constructor
  Account(
    this.acct,
    this.cur,
    this.token, [
    this.email,
  ]);

  /// Update desired class fields
  Account.fromMap(
    Map<String, dynamic> data,
  )   : acct = data['acct'],
        token = data['token'],
        cur = data['cur'],
        email = data['email'];

  /// Extract class information from a json object
  factory Account.fromJson(
    Map<String, dynamic> data,
  ) =>
      Account(
        data['acct'],
        data['token'],
        data['cur'] ?? 'USD',
        data['email'],
      );

  /// Account details
  String acct;

  /// Token for client login session
  String token;

  /// Account currency
  String cur;

  /// Client email
  String email;

  /// indicates that client is advertiser
  bool isAdvertiser = false;

  /// Convert class to json object
  Map<String, dynamic> toJson() => <String, dynamic>{
        'acct': acct,
        'token': token,
        'cur': cur,
        'email': email,
      };
}
