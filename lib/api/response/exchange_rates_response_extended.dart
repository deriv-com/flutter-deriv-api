import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/exchange_rates_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/exchange_rates_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/exchange_rates_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

/// Extends [ExchangeRatesResponse] with additional methods.
class ExchangeRatesResponseExtended extends ExchangeRatesResponse {
  /// Initializes a new instance of [ExchangeRatesResponseExtended].
  ExchangeRatesResponseExtended({
    super.exchangeRates,
    super.subscription,
  });

  factory ExchangeRatesResponseExtended._cast(ExchangeRatesResponse response) =>
      ExchangeRatesResponseExtended(
        exchangeRates: response.exchangeRates,
        subscription: response.subscription,
      );

  /// Creates an instance from JSON.
  factory ExchangeRatesResponseExtended.fromJson(
    dynamic json,
    dynamic subscriptionJson,
  ) =>
      ExchangeRatesResponseExtended._cast(
        ExchangeRatesResponse.fromJson(json, subscriptionJson),
      );

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Retrieves the exchange rates from a base currency to all currencies supported by the system.
  ///
  /// For parameters information refer to [ExchangeRatesRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<ExchangeRatesReceive> fetchExchangeRatesRaw(
    ExchangeRatesRequest request,
  ) async {
    final ExchangeRatesReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Retrieves the exchange rates from a base currency to all currencies supported by the system.
  ///
  /// For parameters information refer to [ExchangeRatesRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<ExchangeRates> fetchExchangeRates(
    ExchangeRatesRequest request,
  ) async {
    final ExchangeRatesReceive response = await fetchExchangeRatesRaw(request);

    return ExchangeRates.fromJson(response.exchangeRates!);
  }

  /// Subscribes the exchange rates from a base currency to all currencies supported by the system.
  ///
  /// For parameters information refer to [ExchangeRatesRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Stream<ExchangeRatesResponseExtended?> subscribeExchangeRates(
    ExchangeRatesRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      subscribeExchangeRatesRaw(
        request,
        comparePredicate: comparePredicate,
      ).map(
        (ExchangeRatesReceive? response) => response == null
            ? null
            : ExchangeRatesResponseExtended.fromJson(
                response.exchangeRates,
                response.subscription,
              ),
      );

  /// Subscribes the exchange rates from a base currency to all currencies supported by the system.
  ///
  /// For parameters information refer to [ExchangeRatesRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Stream<ExchangeRatesReceive?> subscribeExchangeRatesRaw(
    ExchangeRatesRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<ExchangeRatesReceive?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                BaseAPIException(baseExceptionModel: baseExceptionModel),
          );

          return response is ExchangeRatesReceive ? response : null;
        },
      );

  /// Unsubscribes all exchange rates streams.
  ///
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<ForgetAllResponse> unsubscribeAllExchangeRates() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.exchangeRates);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }
}
