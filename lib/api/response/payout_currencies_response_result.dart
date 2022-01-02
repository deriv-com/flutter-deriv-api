// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/payout_currencies_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/payout_currencies_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Payout currencies response model class.
abstract class PayoutCurrenciesResponseModel extends Equatable {
  /// Initializes Payout currencies response model class .
  const PayoutCurrenciesResponseModel({
    this.payoutCurrencies,
  });

  /// Available payout currencies. Note: if a user is logged in, only the currency available for the account will be returned.
  final List<String>? payoutCurrencies;
}

/// Payout currencies response class.
class PayoutCurrenciesResponse extends PayoutCurrenciesResponseModel {
  /// Initializes Payout currencies response class.
  const PayoutCurrenciesResponse({
    List<String>? payoutCurrencies,
  }) : super(
          payoutCurrencies: payoutCurrencies,
        );

  /// Creates an instance from JSON.
  factory PayoutCurrenciesResponse.fromJson(
    dynamic payoutCurrenciesJson,
  ) =>
      PayoutCurrenciesResponse(
        payoutCurrencies: payoutCurrenciesJson == null
            ? null
            : List<String>.from(
                payoutCurrenciesJson?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (payoutCurrencies != null) {
      resultMap['payout_currencies'] = payoutCurrencies!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Retrieves a list of available option payout currencies.
  ///
  /// If a user is logged in, only the currencies available for the account will be returned.
  /// Throws a [PayoutCurrencyException] if API response contains a error
  static Future<PayoutCurrenciesResponse> fetchPayoutCurrencies([
    PayoutCurrenciesRequest? request,
  ]) async {
    final PayoutCurrenciesReceive response = await _api.call(
      request: request ?? const PayoutCurrenciesRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          PayoutCurrencyException(baseExceptionModel: baseExceptionModel),
    );

    return PayoutCurrenciesResponse.fromJson(response.payoutCurrencies);
  }

  /// Creates a copy of instance with given parameters.
  PayoutCurrenciesResponse copyWith({
    List<String>? payoutCurrencies,
  }) =>
      PayoutCurrenciesResponse(
        payoutCurrencies: payoutCurrencies ?? this.payoutCurrencies,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
