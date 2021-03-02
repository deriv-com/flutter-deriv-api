import 'package:meta/meta.dart';

import '../../basic_api/generated/payout_currencies_receive.dart';
import '../../basic_api/generated/payout_currencies_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Payout currencies response model class
abstract class PayoutCurrenciesResponseModel {
  /// Initializes
  PayoutCurrenciesResponseModel({
    @required this.payoutCurrencies,
  });

  /// Available payout currencies. Note: if a user is logged in, only the currency available for the account will be returned.
  final List<String> payoutCurrencies;
}

/// Payout currencies response class
class PayoutCurrenciesResponse extends PayoutCurrenciesResponseModel {
  /// Initializes
  PayoutCurrenciesResponse({
    @required List<String> payoutCurrencies,
  }) : super(
          payoutCurrencies: payoutCurrencies,
        );

  /// Creates an instance from JSON
  factory PayoutCurrenciesResponse.fromJson(
    dynamic payoutCurrenciesJson,
  ) =>
      PayoutCurrenciesResponse(
        payoutCurrencies: payoutCurrenciesJson == null
            ? null
            : List<String>.from(
                payoutCurrenciesJson.map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (payoutCurrencies != null) {
      resultMap['payout_currencies'] =
          payoutCurrencies.map<dynamic>((String item) => item).toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Retrieves a list of available option payout currencies.
  ///
  /// If a user is logged in, only the currencies available for the account will be returned.
  /// Throws a [PayoutCurrencyException] if API response contains a error
  static Future<PayoutCurrenciesResponse> fetchPayoutCurrencies([
    PayoutCurrenciesSend request,
  ]) async {
    final PayoutCurrenciesReceive response = await _api.call(
      request: request ?? const PayoutCurrenciesSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          PayoutCurrencyException(baseExceptionModel: baseExceptionModel),
    );

    return PayoutCurrenciesResponse.fromJson(response.payoutCurrencies);
  }

  /// Creates a copy of instance with given parameters
  PayoutCurrenciesResponse copyWith({
    List<String> payoutCurrencies,
  }) =>
      PayoutCurrenciesResponse(
        payoutCurrencies: payoutCurrencies ?? this.payoutCurrencies,
      );
}
