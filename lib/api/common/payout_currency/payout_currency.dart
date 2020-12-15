import 'package:flutter_deriv_api/api/common/payout_currency/exceptions/payout_currency_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

import '../models/payout_currency_model.dart';

/// Payout currency class
class PayoutCurrency extends PayoutCurrencyModel {
  /// Initializes
  PayoutCurrency({
    String currency,
  }) : super(currency: currency);

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Retrieves a list of available option payout currencies.
  ///
  /// If a user is logged in, only the currencies available for the account will be returned.
  /// Throws a [PayoutCurrencyException] if API response contains a error
  static Future<List<PayoutCurrency>> fetchPayoutCurrencies([
    PayoutCurrenciesRequest request,
  ]) async {
    final PayoutCurrenciesResponse response = await _api.call(
      request: request ?? const PayoutCurrenciesRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          PayoutCurrencyException(baseExceptionModel: baseExceptionModel),
    );

    return getListFromMap(
      response.payoutCurrencies,
      itemToTypeCallback: (dynamic item) =>
          PayoutCurrency(currency: item.toString()),
    );
  }

  /// Creates a new instance with give parameters
  PayoutCurrency copyWith(
    String currency,
  ) =>
      PayoutCurrency(currency: currency ?? this.currency);
}
