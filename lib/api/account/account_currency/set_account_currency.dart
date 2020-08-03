import 'package:flutter_deriv_api/api/account/account_currency/exceptions/account_currency_exception.dart';
import 'package:flutter_deriv_api/api/account/models/set_account_currency_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// The result of setting the currency of account.
class SetAccountCurrency extends SetAccountCurrencyModel {
  /// Initializes
  SetAccountCurrency({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Creates an instance from response
  factory SetAccountCurrency.fromResponse(
    SetAccountCurrencyResponse response,
  ) =>
      SetAccountCurrency(succeeded: response.setAccountCurrency);

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  SetAccountCurrency copyWith({
    bool succeeded,
  }) =>
      SetAccountCurrency(
        succeeded: succeeded ?? this.succeeded,
      );

  /// Sets the currency of the account, this will be default currency for your account i.e currency for trading, deposit.
  ///
  /// Please note that account currency can only be set once, and then can never be changed.
  /// For parameters information refer to [SetAccountCurrencyRequest].
  /// Throws an [AccountCurrencyException] if API response contains an error
  static Future<SetAccountCurrency> setCurrency(
    SetAccountCurrencyRequest request,
  ) async {
    final SetAccountCurrencyResponse response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          AccountCurrencyException(message: message),
    );

    return SetAccountCurrency.fromResponse(response);
  }
}
