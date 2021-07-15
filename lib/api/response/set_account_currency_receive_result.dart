import '../../basic_api/generated/set_account_currency_receive.dart';
import '../../basic_api/generated/set_account_currency_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Set account currency response model class.
abstract class SetAccountCurrencyResponseModel {
  /// Initializes Set account currency response model class .
  SetAccountCurrencyResponseModel({
    this.setAccountCurrency,
  });

  /// `true`: success, `false`: no change
  final bool? setAccountCurrency;
}

/// Set account currency response class.
class SetAccountCurrencyResponse extends SetAccountCurrencyResponseModel {
  /// Initializes Set account currency response class.
  SetAccountCurrencyResponse({
    bool? setAccountCurrency,
  }) : super(
          setAccountCurrency: setAccountCurrency,
        );

  /// Creates an instance from JSON.
  factory SetAccountCurrencyResponse.fromJson(
    dynamic setAccountCurrencyJson,
  ) =>
      SetAccountCurrencyResponse(
        setAccountCurrency: getBool(setAccountCurrencyJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['set_account_currency'] = setAccountCurrency;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Sets the currency of the account, this will be default currency for your account i.e currency for trading, deposit.
  ///
  /// Please note that account currency can only be set once, and then can never be changed.
  /// For parameters information refer to [SetAccountCurrencyRequest].
  /// Throws an [AccountCurrencyException] if API response contains an error
  static Future<SetAccountCurrencyResponse> setCurrency(
    SetAccountCurrencyRequest request,
  ) async {
    final SetAccountCurrencyReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AccountCurrencyException(baseExceptionModel: baseExceptionModel),
    );

    return SetAccountCurrencyResponse.fromJson(response.setAccountCurrency);
  }

  /// Creates a copy of instance with given parameters.
  SetAccountCurrencyResponse copyWith({
    bool? setAccountCurrency,
  }) =>
      SetAccountCurrencyResponse(
        setAccountCurrency: setAccountCurrency ?? this.setAccountCurrency,
      );
}
