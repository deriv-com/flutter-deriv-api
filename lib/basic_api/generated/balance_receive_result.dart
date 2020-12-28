/// Balance receive model class
abstract class BalanceReceiveModel {
  /// Initializes
  BalanceReceiveModel({
    @required this.balance,
    @required this.subscription,
  });

  /// Current balance of one or more accounts.
  final Balance balance;

  /// For subscription requests only.
  final Subscription subscription;
}

/// Balance receive class
class BalanceReceive extends BalanceReceiveModel {
  /// Initializes
  BalanceReceive({
    @required Balance balance,
    @required Subscription subscription,
  }) : super(
          balance: balance,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory BalanceReceive.fromJson(Map<String, dynamic> json) => BalanceReceive(
        balance:
            json['balance'] == null ? null : Balance.fromJson(json['balance']),
        subscription: json['subscription'] == null
            ? null
            : Subscription.fromJson(json['subscription']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (balance != null) {
      result['balance'] = balance.toJson();
    }
    if (subscription != null) {
      result['subscription'] = subscription.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  BalanceReceive copyWith({
    Balance balance,
    Subscription subscription,
  }) =>
      BalanceReceive(
        balance: balance ?? this.balance,
        subscription: subscription ?? this.subscription,
      );
}
/// Balance model class
abstract class BalanceModel {
  /// Initializes
  BalanceModel({
    @required this.balance,
    @required this.accounts,
    @required this.currency,
    @required this.id,
    @required this.loginid,
    @required this.total,
  });

  /// Balance of current account.
  final double balance;

  /// List of active accounts.
  final Map<String, dynamic> accounts;

  /// Currency of current account.
  final String currency;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;

  /// Client loginid.
  final String loginid;

  /// Summary totals of accounts by type.
  final Total total;
}

/// Balance class
class Balance extends BalanceModel {
  /// Initializes
  Balance({
    @required double balance,
    @required Map<String, dynamic> accounts,
    @required String currency,
    @required String id,
    @required String loginid,
    @required Total total,
  }) : super(
          balance: balance,
          accounts: accounts,
          currency: currency,
          id: id,
          loginid: loginid,
          total: total,
        );

  /// Creates an instance from JSON
  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        balance: getDouble(json['balance']),
        accounts: json['accounts'],
        currency: json['currency'],
        id: json['id'],
        loginid: json['loginid'],
        total: json['total'] == null ? null : Total.fromJson(json['total']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['balance'] = balance;
    result['accounts'] = accounts;
    result['currency'] = currency;
    result['id'] = id;
    result['loginid'] = loginid;
    if (total != null) {
      result['total'] = total.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  Balance copyWith({
    double balance,
    Map<String, dynamic> accounts,
    String currency,
    String id,
    String loginid,
    Total total,
  }) =>
      Balance(
        balance: balance ?? this.balance,
        accounts: accounts ?? this.accounts,
        currency: currency ?? this.currency,
        id: id ?? this.id,
        loginid: loginid ?? this.loginid,
        total: total ?? this.total,
      );
}
/// Total model class
abstract class TotalModel {
  /// Initializes
  TotalModel({
    @required this.deriv,
    @required this.derivDemo,
    @required this.mt5,
    @required this.mt5Demo,
  });

  /// Total balance of all real money Deriv accounts.
  final Deriv deriv;

  /// Total balance of all demo Deriv accounts.
  final DerivDemo derivDemo;

  /// Total balance of all MT5 real money accounts.
  final Mt5 mt5;

  /// Total balance of all MT5 demo accounts.
  final Mt5Demo mt5Demo;
}

/// Total class
class Total extends TotalModel {
  /// Initializes
  Total({
    @required Deriv deriv,
    @required DerivDemo derivDemo,
    @required Mt5 mt5,
    @required Mt5Demo mt5Demo,
  }) : super(
          deriv: deriv,
          derivDemo: derivDemo,
          mt5: mt5,
          mt5Demo: mt5Demo,
        );

  /// Creates an instance from JSON
  factory Total.fromJson(Map<String, dynamic> json) => Total(
        deriv: json['deriv'] == null ? null : Deriv.fromJson(json['deriv']),
        derivDemo: json['deriv_demo'] == null
            ? null
            : DerivDemo.fromJson(json['deriv_demo']),
        mt5: json['mt5'] == null ? null : Mt5.fromJson(json['mt5']),
        mt5Demo: json['mt5_demo'] == null
            ? null
            : Mt5Demo.fromJson(json['mt5_demo']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (deriv != null) {
      result['deriv'] = deriv.toJson();
    }
    if (derivDemo != null) {
      result['deriv_demo'] = derivDemo.toJson();
    }
    if (mt5 != null) {
      result['mt5'] = mt5.toJson();
    }
    if (mt5Demo != null) {
      result['mt5_demo'] = mt5Demo.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  Total copyWith({
    Deriv deriv,
    DerivDemo derivDemo,
    Mt5 mt5,
    Mt5Demo mt5Demo,
  }) =>
      Total(
        deriv: deriv ?? this.deriv,
        derivDemo: derivDemo ?? this.derivDemo,
        mt5: mt5 ?? this.mt5,
        mt5Demo: mt5Demo ?? this.mt5Demo,
      );
}
/// Deriv model class
abstract class DerivModel {
  /// Initializes
  DerivModel({
    @required this.amount,
    @required this.currency,
  });

  /// Total of balances.
  final double amount;

  /// Currency of total.
  final String currency;
}

/// Deriv class
class Deriv extends DerivModel {
  /// Initializes
  Deriv({
    @required double amount,
    @required String currency,
  }) : super(
          amount: amount,
          currency: currency,
        );

  /// Creates an instance from JSON
  factory Deriv.fromJson(Map<String, dynamic> json) => Deriv(
        amount: getDouble(json['amount']),
        currency: json['currency'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['amount'] = amount;
    result['currency'] = currency;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Deriv copyWith({
    double amount,
    String currency,
  }) =>
      Deriv(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
/// Deriv demo model class
abstract class DerivDemoModel {
  /// Initializes
  DerivDemoModel({
    @required this.amount,
    @required this.currency,
  });

  /// Total of balances.
  final double amount;

  /// Currency of total.
  final String currency;
}

/// Deriv demo class
class DerivDemo extends DerivDemoModel {
  /// Initializes
  DerivDemo({
    @required double amount,
    @required String currency,
  }) : super(
          amount: amount,
          currency: currency,
        );

  /// Creates an instance from JSON
  factory DerivDemo.fromJson(Map<String, dynamic> json) => DerivDemo(
        amount: getDouble(json['amount']),
        currency: json['currency'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['amount'] = amount;
    result['currency'] = currency;

    return result;
  }

  /// Creates a copy of instance with given parameters
  DerivDemo copyWith({
    double amount,
    String currency,
  }) =>
      DerivDemo(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
/// Mt5 model class
abstract class Mt5Model {
  /// Initializes
  Mt5Model({
    @required this.amount,
    @required this.currency,
  });

  /// Total balance of all MT5 accounts
  final double amount;

  /// Currency of total.
  final String currency;
}

/// Mt5 class
class Mt5 extends Mt5Model {
  /// Initializes
  Mt5({
    @required double amount,
    @required String currency,
  }) : super(
          amount: amount,
          currency: currency,
        );

  /// Creates an instance from JSON
  factory Mt5.fromJson(Map<String, dynamic> json) => Mt5(
        amount: getDouble(json['amount']),
        currency: json['currency'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['amount'] = amount;
    result['currency'] = currency;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5 copyWith({
    double amount,
    String currency,
  }) =>
      Mt5(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
/// Mt5 demo model class
abstract class Mt5DemoModel {
  /// Initializes
  Mt5DemoModel({
    @required this.amount,
    @required this.currency,
  });

  /// Total of balances.
  final double amount;

  /// Currency of total.
  final String currency;
}

/// Mt5 demo class
class Mt5Demo extends Mt5DemoModel {
  /// Initializes
  Mt5Demo({
    @required double amount,
    @required String currency,
  }) : super(
          amount: amount,
          currency: currency,
        );

  /// Creates an instance from JSON
  factory Mt5Demo.fromJson(Map<String, dynamic> json) => Mt5Demo(
        amount: getDouble(json['amount']),
        currency: json['currency'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['amount'] = amount;
    result['currency'] = currency;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5Demo copyWith({
    double amount,
    String currency,
  }) =>
      Mt5Demo(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
/// Subscription model class
abstract class SubscriptionModel {
  /// Initializes
  SubscriptionModel({
    @required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class
class Subscription extends SubscriptionModel {
  /// Initializes
  Subscription({
    @required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['id'] = id;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
