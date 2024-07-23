// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/exchange_rates_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/exchange_rates_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Exchange rates response model class.
abstract class ExchangeRatesResponseModel {
  /// Initializes Exchange rates response model class .
  const ExchangeRatesResponseModel({
    this.exchangeRates,
    this.subscription,
  });

  /// Exchange rate values from base to target currency
  final ExchangeRates? exchangeRates;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Exchange rates response class.
class ExchangeRatesResponse extends ExchangeRatesResponseModel {
  /// Initializes Exchange rates response class.
  const ExchangeRatesResponse({
    super.exchangeRates,
    super.subscription,
  });

  /// Creates an instance from JSON.
  factory ExchangeRatesResponse.fromJson(
    dynamic exchangeRatesJson,
    dynamic subscriptionJson,
  ) =>
      ExchangeRatesResponse(
        exchangeRates: exchangeRatesJson == null
            ? null
            : ExchangeRates.fromJson(exchangeRatesJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (exchangeRates != null) {
      resultMap['exchange_rates'] = exchangeRates!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

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

  /// Creates a copy of instance with given parameters.
  ExchangeRatesResponse copyWith({
    ExchangeRates? exchangeRates,
    Subscription? subscription,
  }) =>
      ExchangeRatesResponse(
        exchangeRates: exchangeRates ?? this.exchangeRates,
        subscription: subscription ?? this.subscription,
      );
}

/// Exchange rates model class.
abstract class ExchangeRatesModel {
  /// Initializes Exchange rates model class .
  const ExchangeRatesModel({
    this.baseCurrency,
    this.date,
    this.rates,
  });

  /// Base currency
  final String? baseCurrency;

  /// Date retrieval epoch time represented as an integer number
  final DateTime? date;

  /// Rate of exchanging a unit of base currency into a target currency
  final Map<String, double>? rates;
}

/// Exchange rates class.
class ExchangeRates extends ExchangeRatesModel {
  /// Initializes Exchange rates class.
  const ExchangeRates({
    super.baseCurrency,
    super.date,
    super.rates,
  });

  /// Creates an instance from JSON.
  factory ExchangeRates.fromJson(Map<String, dynamic> json) => ExchangeRates(
        baseCurrency: json['base_currency'],
        date: getDateTime(json['date']),
        rates: json['rates'] == null
            ? null
            : Map<String, double>.fromEntries(json['rates']
                .entries
                .map<MapEntry<String, double>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, double>(
                            entry.key, getDouble(entry.value)!))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['base_currency'] = baseCurrency;
    resultMap['date'] = getSecondsSinceEpochDateTime(date);
    resultMap['rates'] = rates;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ExchangeRates copyWith({
    String? baseCurrency,
    DateTime? date,
    Map<String, double>? rates,
  }) =>
      ExchangeRates(
        baseCurrency: baseCurrency ?? this.baseCurrency,
        date: date ?? this.date,
        rates: rates ?? this.rates,
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
