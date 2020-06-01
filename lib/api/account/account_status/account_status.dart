import 'package:flutter_deriv_api/api/account/account_status/exceptions/account_status_exception.dart';
import 'package:flutter_deriv_api/api/account/models/account_authentication_status_model.dart';
import 'package:flutter_deriv_api/api/account/models/account_status_currency_config_model.dart';
import 'package:flutter_deriv_api/api/account/models/account_status_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Account's documents's and authentications status
class AccountStatus extends AccountStatusModel {
  /// Initializes
  AccountStatus({
    AccountAuthenticationStatusModel authentication,
    List<AccountStatusCurrencyConfigModel> currencyConfig,
    bool promptClientToAuthenticate,
    AccountRiskClassification riskClassification,
    List<AccountStatusType> status,
  }) : super(
          authentication: authentication,
          currencyConfig: currencyConfig,
          promptClientToAuthenticate: promptClientToAuthenticate,
          riskClassification: riskClassification,
          status: status,
        );

  /// Generates an instance from JSON
  factory AccountStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      AccountStatus(
        authentication: getItemFromMap(
          json['authentication'],
          itemToTypeCallback: (dynamic map) =>
              AccountAuthenticationStatusModel.fromJson(map),
        ),
        currencyConfig: getListFromMap(
          json['experimental_suspended'].entries,
          itemToTypeCallback: (dynamic item) =>
              AccountStatusCurrencyConfigModel.fromJson(item.key, item.value),
        ),
        promptClientToAuthenticate:
            getBool(json['prompt_client_to_authenticate']),
        riskClassification: getEnumFromString(
          values: AccountRiskClassification.values,
          name: json['risk_classification'],
        ),
        status: getListFromMap(
          json['status'],
          itemToTypeCallback: (dynamic item) => getEnumFromString(
            values: AccountStatusType.values,
            name: item.toString(),
          ),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the account's status
  static Future<AccountStatus> fetchAccountStatus() async {
    final GetAccountStatusResponse response = await _api.call(
      request: const GetAccountStatusRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          AccountStatusException(message: message),
    );

    return AccountStatus.fromJson(response.getAccountStatus);
  }

  /// Generates a copy of instance with given parameters
  AccountStatus copyWith({
    AccountAuthenticationStatusModel authentication,
    List<AccountStatusCurrencyConfigModel> currencyConfig,
    bool promptClientToAuthenticate,
    AccountRiskClassification riskClassification,
    List<AccountStatusType> status,
  }) =>
      AccountStatus(
        authentication: authentication ?? this.authentication,
        currencyConfig: currencyConfig ?? this.currencyConfig,
        promptClientToAuthenticate:
            promptClientToAuthenticate ?? this.promptClientToAuthenticate,
        riskClassification: riskClassification ?? this.riskClassification,
        status: status ?? this.status,
      );
}
