import 'package:flutter_deriv_api/api/account/account_status/exceptions/account_status_exception.dart';
import 'package:flutter_deriv_api/api/account/models/account_authentication_status_model.dart';
import 'package:flutter_deriv_api/api/account/models/account_status_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Account status
class AccountStatus extends AccountStatusModel {
  /// Initializes
  AccountStatus({
    AccountAuthenticationStatusModel authentication,
    bool promptClientToAuthenticate,
    AccountRiskClassification riskClassification,
    List<AccountStatusType> status,
  }) : super(
          authentication: authentication,
          promptClientToAuthenticate: promptClientToAuthenticate,
          riskClassification: riskClassification,
          status: status,
        );

  /// Generate an instance from JSON
  factory AccountStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      AccountStatus(
        authentication: getItemFromMap(
          json['authentication'],
          itemToTypeCallback: (dynamic map) =>
              AccountAuthenticationStatusModel.fromJson(map),
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

  /// API instance
  static final BasicBinaryAPI _api =
      Injector.getInjector().get<BasicBinaryAPI>();

  /// Gets the account's status
  static Future<AccountStatus> getAccountStatus() async {
    final GetAccountStatusResponse response = await _api.call(
      request: const GetAccountStatusRequest(),
    );

    if (response.error != null) {
      throw AccountStatusException(message: response.error['message']);
    }

    return AccountStatus.fromJson(response.getAccountStatus);
  }

  /// Generate a copy of instance with given parameters
  AccountStatus copyWith({
    AccountAuthenticationStatusModel authentication,
    bool promptClientToAuthenticate,
    AccountRiskClassification riskClassification,
    List<AccountStatusType> status,
  }) =>
      AccountStatus(
        authentication: authentication ?? this.authentication,
        promptClientToAuthenticate:
            promptClientToAuthenticate ?? this.promptClientToAuthenticate,
        riskClassification: riskClassification ?? this.riskClassification,
        status: status ?? this.status,
      );
}
