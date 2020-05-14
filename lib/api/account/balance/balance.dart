import 'package:flutter_deriv_api/api/account/balance/exceptions/balance_exception.dart';
import 'package:flutter_deriv_api/api/account/models/balance_model.dart';
import 'package:flutter_deriv_api/api/account/models/balance_total_model.dart';
import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Balance information if account
class Balance extends BalanceModel {
  /// Initializes
  Balance({
    double balance,
    String currency,
    String id,
    String loginId,
    BalanceTotalModel total,
    this.subscriptionInformation,
  }) : super(
          balance: balance,
          currency: currency,
          id: id,
          loginId: loginId,
          total: total,
        );

  /// Generate an instance from JSON
  factory Balance.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      Balance(
        balance: json['balance'],
        currency: json['currency'],
        id: json['id'],
        loginId: json['loginid'],
        total: getItemFromMap(
          json['total'],
          itemToTypeCallback: (dynamic item) =>
              BalanceTotalModel.fromJson(item),
        ),
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// Subscription Information
  final SubscriptionModel subscriptionInformation;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Fetches balance of account
  /// If set to 'all', return the balances of all accounts one by one;
  /// if set to 'current', return the balance of current account; if set as an
  /// account id, return the balance of that account.
  static Future<Balance> fetchBalance(BalanceRequest request) async {
    final BalanceResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw BalanceException(message: response.error['message']);
    }

    return Balance.fromJson(response.balance);
  }

  /// Instead of one call [Balance.fetchBalance] gets stream of [Balance]
  static Stream<Balance> subscribeBalance(BalanceRequest request) =>
      _api.subscribe(request: request).map((Response response) {
        if (response.error != null) {
          throw BalanceException(message: response.error['message']);
        }
        return response is BalanceResponse
            ? Balance.fromJson(
                response.balance,
                subscriptionJson: response.subscription,
              )
            : null;
      });

  // TODO(ramin): Add implementation when unsubscribe is available in [BaseAPI]
  /// Unsubscribes from Balance stream
  Future<Forget> unsubscribe() async => null;

  /// Creates a copy of instance with given parameters
  Balance copyWith({
    double balance,
    String currency,
    String id,
    String loginId,
    BalanceTotalModel total,
    SubscriptionModel subscriptionInformation,
  }) =>
      Balance(
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        id: id ?? this.id,
        loginId: loginId ?? this.loginId,
        total: total ?? this.total,
        subscriptionInformation:
            subscriptionInformation ?? this.subscriptionInformation,
      );
}
