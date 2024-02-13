// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/balance_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/balance_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Balance response model class.
abstract class BalanceResponseModel {
  /// Initializes Balance response model class .
  const BalanceResponseModel({
    this.balance,
    this.subscription,
  });

  /// Current balance of one or more accounts.
  final Balance? balance;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Balance response class.
class BalanceResponse extends BalanceResponseModel {
  /// Initializes Balance response class.
  const BalanceResponse({
    super.balance,
    super.subscription,
  });

  /// Creates an instance from JSON.
  factory BalanceResponse.fromJson(
    dynamic balanceJson,
    dynamic subscriptionJson,
  ) =>
      BalanceResponse(
        balance: balanceJson == null ? null : Balance.fromJson(balanceJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (balance != null) {
      resultMap['balance'] = balance!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets the balance of account
  ///
  /// For parameters info refer to [BalanceRequest]
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<BalanceResponse> fetchBalance(BalanceRequest request) async {
    final BalanceReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return BalanceResponse.fromJson(response.balance, response.subscription);
  }

  /// Instead of one call [Balance.fetchBalance] gets stream of [Balance]
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  static Stream<BalanceResponse?> subscribeBalance(
    BalanceRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map((Response response) {
        checkException(
          response: response,
          exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
              BaseAPIException(baseExceptionModel: baseExceptionModel),
        );

        return response is BalanceReceive
            ? BalanceResponse.fromJson(
                response.balance,
                response.subscription,
              )
            : null;
      });

  /// Unsubscribes from balance subscription.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<ForgetResponse?> unsubscribeBalance() async {
    if (subscription == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription!.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes all balance subscriptions.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllBalance() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.balance);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters.
  BalanceResponse copyWith({
    Balance? balance,
    Subscription? subscription,
  }) =>
      BalanceResponse(
        balance: balance ?? this.balance,
        subscription: subscription ?? this.subscription,
      );
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "mt5": TypeEnum.mt5,
  "deriv": TypeEnum.deriv,
};

/// Type Enum.
enum TypeEnum {
  /// mt5.
  mt5,

  /// deriv.
  deriv,
}
/// Balance model class.
abstract class BalanceModel {
  /// Initializes Balance model class .
  const BalanceModel({
    required this.loginid,
    required this.currency,
    required this.balance,
    this.accounts,
    this.id,
    this.total,
  });

  /// Client loginid.
  final String loginid;

  /// Currency of current account.
  final String currency;

  /// Balance of current account.
  final double balance;

  /// List of active accounts.
  final Map<String, AccountsProperty>? accounts;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String? id;

  /// Summary totals of accounts by type.
  final Total? total;
}

/// Balance class.
class Balance extends BalanceModel {
  /// Initializes Balance class.
  const Balance({
    required super.balance,
    required super.currency,
    required super.loginid,
    super.accounts,
    super.id,
    super.total,
  });

  /// Creates an instance from JSON.
  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        balance: getDouble(json['balance'])!,
        currency: json['currency'],
        loginid: json['loginid'],
        accounts: json['accounts'] == null
            ? null
            : Map<String, AccountsProperty>.fromEntries(json['accounts']
                .entries
                .map<MapEntry<String, AccountsProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, AccountsProperty>(entry.key,
                            AccountsProperty.fromJson(entry.value)))),
        id: json['id'],
        total: json['total'] == null ? null : Total.fromJson(json['total']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    resultMap['loginid'] = loginid;
    resultMap['accounts'] = accounts;
    resultMap['id'] = id;
    if (total != null) {
      resultMap['total'] = total!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Balance copyWith({
    double? balance,
    String? currency,
    String? loginid,
    Map<String, AccountsProperty>? accounts,
    String? id,
    Total? total,
  }) =>
      Balance(
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        loginid: loginid ?? this.loginid,
        accounts: accounts ?? this.accounts,
        id: id ?? this.id,
        total: total ?? this.total,
      );
}
/// Accounts property model class.
abstract class AccountsPropertyModel {
  /// Initializes Accounts property model class .
  const AccountsPropertyModel({
    required this.type,
    required this.status,
    required this.demoAccount,
    required this.currency,
    required this.convertedAmount,
    required this.balance,
  });

  /// Type of account.
  final TypeEnum type;

  /// Boolean value of `true` or `false`. Indicates the status of account. `true` indicates account is good and accessible.
  final bool status;

  /// If set to `true`, this is a demo account.
  final bool demoAccount;

  /// Account currency.
  final String currency;

  /// Account balance converted the total currency.
  final double convertedAmount;

  /// Account balance
  final double balance;
}

/// Accounts property class.
class AccountsProperty extends AccountsPropertyModel {
  /// Initializes Accounts property class.
  const AccountsProperty({
    required super.balance,
    required super.convertedAmount,
    required super.currency,
    required super.demoAccount,
    required super.status,
    required super.type,
  });

  /// Creates an instance from JSON.
  factory AccountsProperty.fromJson(Map<String, dynamic> json) =>
      AccountsProperty(
        balance: getDouble(json['balance'])!,
        convertedAmount: getDouble(json['converted_amount'])!,
        currency: json['currency'],
        demoAccount: getBool(json['demo_account'])!,
        status: getBool(json['status'])!,
        type: typeEnumMapper[json['type']]!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance'] = balance;
    resultMap['converted_amount'] = convertedAmount;
    resultMap['currency'] = currency;
    resultMap['demo_account'] = demoAccount;
    resultMap['status'] = status;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountsProperty copyWith({
    double? balance,
    double? convertedAmount,
    String? currency,
    bool? demoAccount,
    bool? status,
    TypeEnum? type,
  }) =>
      AccountsProperty(
        balance: balance ?? this.balance,
        convertedAmount: convertedAmount ?? this.convertedAmount,
        currency: currency ?? this.currency,
        demoAccount: demoAccount ?? this.demoAccount,
        status: status ?? this.status,
        type: type ?? this.type,
      );
}
/// Total model class.
abstract class TotalModel {
  /// Initializes Total model class .
  const TotalModel({
    this.deriv,
    this.derivDemo,
    this.mt5,
    this.mt5Demo,
  });

  /// Total balance of all real money Deriv accounts.
  final Deriv? deriv;

  /// Total balance of all demo Deriv accounts.
  final DerivDemo? derivDemo;

  /// Total balance of all MT5 real money accounts.
  final Mt5? mt5;

  /// Total balance of all MT5 demo accounts.
  final Mt5Demo? mt5Demo;
}

/// Total class.
class Total extends TotalModel {
  /// Initializes Total class.
  const Total({
    super.deriv,
    super.derivDemo,
    super.mt5,
    super.mt5Demo,
  });

  /// Creates an instance from JSON.
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

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (deriv != null) {
      resultMap['deriv'] = deriv!.toJson();
    }
    if (derivDemo != null) {
      resultMap['deriv_demo'] = derivDemo!.toJson();
    }
    if (mt5 != null) {
      resultMap['mt5'] = mt5!.toJson();
    }
    if (mt5Demo != null) {
      resultMap['mt5_demo'] = mt5Demo!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Total copyWith({
    Deriv? deriv,
    DerivDemo? derivDemo,
    Mt5? mt5,
    Mt5Demo? mt5Demo,
  }) =>
      Total(
        deriv: deriv ?? this.deriv,
        derivDemo: derivDemo ?? this.derivDemo,
        mt5: mt5 ?? this.mt5,
        mt5Demo: mt5Demo ?? this.mt5Demo,
      );
}
/// Deriv model class.
abstract class DerivModel {
  /// Initializes Deriv model class .
  const DerivModel({
    required this.currency,
    required this.amount,
  });

  /// Currency of total.
  final String currency;

  /// Total of balances.
  final double amount;
}

/// Deriv class.
class Deriv extends DerivModel {
  /// Initializes Deriv class.
  const Deriv({
    required super.amount,
    required super.currency,
  });

  /// Creates an instance from JSON.
  factory Deriv.fromJson(Map<String, dynamic> json) => Deriv(
        amount: getDouble(json['amount'])!,
        currency: json['currency'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['amount'] = amount;
    resultMap['currency'] = currency;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Deriv copyWith({
    double? amount,
    String? currency,
  }) =>
      Deriv(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
/// Deriv demo model class.
abstract class DerivDemoModel {
  /// Initializes Deriv demo model class .
  const DerivDemoModel({
    required this.currency,
    required this.amount,
  });

  /// Currency of total.
  final String currency;

  /// Total of balances.
  final double amount;
}

/// Deriv demo class.
class DerivDemo extends DerivDemoModel {
  /// Initializes Deriv demo class.
  const DerivDemo({
    required super.amount,
    required super.currency,
  });

  /// Creates an instance from JSON.
  factory DerivDemo.fromJson(Map<String, dynamic> json) => DerivDemo(
        amount: getDouble(json['amount'])!,
        currency: json['currency'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['amount'] = amount;
    resultMap['currency'] = currency;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DerivDemo copyWith({
    double? amount,
    String? currency,
  }) =>
      DerivDemo(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
/// Mt5 model class.
abstract class Mt5Model {
  /// Initializes Mt5 model class .
  const Mt5Model({
    required this.currency,
    required this.amount,
  });

  /// Currency of total.
  final String currency;

  /// Total balance of all MT5 accounts
  final double amount;
}

/// Mt5 class.
class Mt5 extends Mt5Model {
  /// Initializes Mt5 class.
  const Mt5({
    required super.amount,
    required super.currency,
  });

  /// Creates an instance from JSON.
  factory Mt5.fromJson(Map<String, dynamic> json) => Mt5(
        amount: getDouble(json['amount'])!,
        currency: json['currency'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['amount'] = amount;
    resultMap['currency'] = currency;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Mt5 copyWith({
    double? amount,
    String? currency,
  }) =>
      Mt5(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
/// Mt5 demo model class.
abstract class Mt5DemoModel {
  /// Initializes Mt5 demo model class .
  const Mt5DemoModel({
    required this.currency,
    required this.amount,
  });

  /// Currency of total.
  final String currency;

  /// Total of balances.
  final double amount;
}

/// Mt5 demo class.
class Mt5Demo extends Mt5DemoModel {
  /// Initializes Mt5 demo class.
  const Mt5Demo({
    required super.amount,
    required super.currency,
  });

  /// Creates an instance from JSON.
  factory Mt5Demo.fromJson(Map<String, dynamic> json) => Mt5Demo(
        amount: getDouble(json['amount'])!,
        currency: json['currency'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['amount'] = amount;
    resultMap['currency'] = currency;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Mt5Demo copyWith({
    double? amount,
    String? currency,
  }) =>
      Mt5Demo(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
/// Subscription model class.
abstract class SubscriptionModel {
  /// Initializes Subscription model class .
  const SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  const Subscription({
    required super.id,
  });

  /// Creates an instance from JSON.
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Subscription copyWith({
    String? id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
