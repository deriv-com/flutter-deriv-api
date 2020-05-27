import 'package:flutter_deriv_api/api/account/balance/exceptions/balance_exception.dart';
import 'package:flutter_deriv_api/api/account/models/balance_model.dart';
import 'package:flutter_deriv_api/api/account/models/balance_total_model.dart';
import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Balance information of the account
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

  /// Generates an instance from JSON
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

  /// Gets the balance of account
  ///
  /// For parameters info refer to [BalanceRequest]
  /// Throws a [BalanceException] if API response contains an error
  static Future<Balance> fetchBalance(BalanceRequest request) async {
    final BalanceResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) => BalanceException(message: message),
    );

    return Balance.fromJson(response.balance);
  }

  /// Instead of one call [Balance.fetchBalance] gets stream of [Balance]
  ///
  /// Throws a [BalanceException] if API response contains an error
  static Stream<Balance> subscribeBalance(BalanceRequest request) =>
      _api.subscribe(request: request).map((Response response) {
        checkException(
          response: response,
          exceptionCreator: (String message) =>
              BalanceException(message: message),
        );

        return response is BalanceResponse
            ? Balance.fromJson(
                response.balance,
                subscriptionJson: response.subscription,
              )
            : null;
      });

  /// Unsubscribes from balance subscription.
  ///
  /// Throws a [BalanceException] if API response contains an error
  Future<Forget> unsubscribeBalance() async {
    if (subscriptionInformation?.id == null) {
      return null;
    }

    final ForgetResponse response =
        await _api.unsubscribe(subscriptionId: subscriptionInformation.id);

    checkException(
      response: response,
      exceptionCreator: (String message) => BalanceException(message: message),
    );

    return Forget.fromResponse(response);
  }

  /// Unsubscribes all balance subscriptions.
  ///
  /// Throws a [BalanceException] if API response contains an error
  static Future<ForgetAll> unsubscribeAllBalance() async {
    final ForgetAllResponse response =
        await _api.unsubscribeAll(method: ForgetStreamType.balance);

    checkException(
      response: response,
      exceptionCreator: (String message) => BalanceException(message: message),
    );

    return ForgetAll.fromResponse(response);
  }

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
