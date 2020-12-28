/// New account virtual receive model class
abstract class NewAccountVirtualReceiveModel {
  /// Initializes
  NewAccountVirtualReceiveModel({
    @required this.newAccountVirtual,
  });

  /// New virtual-money account details
  final NewAccountVirtual newAccountVirtual;
}

/// New account virtual receive class
class NewAccountVirtualReceive extends NewAccountVirtualReceiveModel {
  /// Initializes
  NewAccountVirtualReceive({
    @required NewAccountVirtual newAccountVirtual,
  }) : super(
          newAccountVirtual: newAccountVirtual,
        );

  /// Creates an instance from JSON
  factory NewAccountVirtualReceive.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtualReceive(
        newAccountVirtual: json['new_account_virtual'] == null
            ? null
            : NewAccountVirtual.fromJson(json['new_account_virtual']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (newAccountVirtual != null) {
      result['new_account_virtual'] = newAccountVirtual.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  NewAccountVirtualReceive copyWith({
    NewAccountVirtual newAccountVirtual,
  }) =>
      NewAccountVirtualReceive(
        newAccountVirtual: newAccountVirtual ?? this.newAccountVirtual,
      );
}
/// New account virtual model class
abstract class NewAccountVirtualModel {
  /// Initializes
  NewAccountVirtualModel({
    @required this.balance,
    @required this.clientId,
    @required this.currency,
    @required this.email,
    @required this.oauthToken,
  });

  /// Account balance
  final double balance;

  /// Client ID of the new virtual-money account
  final String clientId;

  /// Account currency
  final String currency;

  /// Email of the new virtual-money account
  final String email;

  /// Oauth token for the client's login session (so that the user may be logged in immediately)
  final String oauthToken;
}

/// New account virtual class
class NewAccountVirtual extends NewAccountVirtualModel {
  /// Initializes
  NewAccountVirtual({
    @required double balance,
    @required String clientId,
    @required String currency,
    @required String email,
    @required String oauthToken,
  }) : super(
          balance: balance,
          clientId: clientId,
          currency: currency,
          email: email,
          oauthToken: oauthToken,
        );

  /// Creates an instance from JSON
  factory NewAccountVirtual.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtual(
        balance: getDouble(json['balance']),
        clientId: json['client_id'],
        currency: json['currency'],
        email: json['email'],
        oauthToken: json['oauth_token'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['balance'] = balance;
    result['client_id'] = clientId;
    result['currency'] = currency;
    result['email'] = email;
    result['oauth_token'] = oauthToken;

    return result;
  }

  /// Creates a copy of instance with given parameters
  NewAccountVirtual copyWith({
    double balance,
    String clientId,
    String currency,
    String email,
    String oauthToken,
  }) =>
      NewAccountVirtual(
        balance: balance ?? this.balance,
        clientId: clientId ?? this.clientId,
        currency: currency ?? this.currency,
        email: email ?? this.email,
        oauthToken: oauthToken ?? this.oauthToken,
      );
}
