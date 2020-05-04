import 'package:flutter_deriv_api/api/models/account_authentication_status_model.dart';
import 'package:flutter_deriv_api/api/models/account_status_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
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

  /// Instance from JSON
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

  /// Clones a new instance
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
