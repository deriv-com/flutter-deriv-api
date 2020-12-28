/// Mt5 login list receive model class
abstract class Mt5LoginListReceiveModel {
  /// Initializes
  Mt5LoginListReceiveModel({
    @required this.mt5LoginList,
  });

  /// Array containing MT5 account objects.
  final List<Mt5LoginList> mt5LoginList;
}

/// Mt5 login list receive class
class Mt5LoginListReceive extends Mt5LoginListReceiveModel {
  /// Initializes
  Mt5LoginListReceive({
    @required List<Mt5LoginList> mt5LoginList,
  }) : super(
          mt5LoginList: mt5LoginList,
        );

  /// Creates an instance from JSON
  factory Mt5LoginListReceive.fromJson(Map<String, dynamic> json) =>
      Mt5LoginListReceive(
        mt5LoginList: json['mt5_login_list'] == null
            ? null
            : json['mt5_login_list']
                .map<Mt5LoginList>(
                    (dynamic item) => Mt5LoginList.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (mt5LoginList != null) {
      result['mt5_login_list'] =
          mt5LoginList.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5LoginListReceive copyWith({
    List<Mt5LoginList> mt5LoginList,
  }) =>
      Mt5LoginListReceive(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
      );
}
/// Mt5 login list model class
abstract class Mt5LoginListModel {
  /// Initializes
  Mt5LoginListModel({
    @required this.balance,
    @required this.country,
    @required this.currency,
    @required this.displayBalance,
    @required this.email,
    @required this.group,
    @required this.leverage,
    @required this.login,
    @required this.name,
  });

  /// Balance of the MT5 account.
  final double balance;

  /// Residence of the MT5 account.
  final String country;

  /// Currency of the MT5 account.
  final String currency;

  /// Account balance, formatted to appropriate decimal places.
  final String displayBalance;

  /// Email address of the MT5 account.
  final String email;

  /// Group type of the MT5 account, e.g. `demo\svg_financial`
  final String group;

  /// Leverage of the MT5 account (1 to 1000).
  final double leverage;

  /// Login of MT5 account.
  final String login;

  /// Name of the owner of the MT5 account.
  final String name;
}

/// Mt5 login list class
class Mt5LoginList extends Mt5LoginListModel {
  /// Initializes
  Mt5LoginList({
    @required double balance,
    @required String country,
    @required String currency,
    @required String displayBalance,
    @required String email,
    @required String group,
    @required double leverage,
    @required String login,
    @required String name,
  }) : super(
          balance: balance,
          country: country,
          currency: currency,
          displayBalance: displayBalance,
          email: email,
          group: group,
          leverage: leverage,
          login: login,
          name: name,
        );

  /// Creates an instance from JSON
  factory Mt5LoginList.fromJson(Map<String, dynamic> json) => Mt5LoginList(
        balance: getDouble(json['balance']),
        country: json['country'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        email: json['email'],
        group: json['group'],
        leverage: getDouble(json['leverage']),
        login: json['login'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['balance'] = balance;
    result['country'] = country;
    result['currency'] = currency;
    result['display_balance'] = displayBalance;
    result['email'] = email;
    result['group'] = group;
    result['leverage'] = leverage;
    result['login'] = login;
    result['name'] = name;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5LoginList copyWith({
    double balance,
    String country,
    String currency,
    String displayBalance,
    String email,
    String group,
    double leverage,
    String login,
    String name,
  }) =>
      Mt5LoginList(
        balance: balance ?? this.balance,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        email: email ?? this.email,
        group: group ?? this.group,
        leverage: leverage ?? this.leverage,
        login: login ?? this.login,
        name: name ?? this.name,
      );
}
