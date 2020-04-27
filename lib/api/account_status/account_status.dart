import 'package:flutter_deriv_api/api/models/account_authentication_status_model.dart';
import 'package:flutter_deriv_api/api/models/account_status_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Account status
class AccountStatus extends AccountStatusModel {
  /// Initializes
  AccountStatus({
    AccountAuthenticationStatusModel authentication,
    bool promptClientToAuthenticate,
    String riskClassification,
    List<String> status,
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
        authentication: json['authentication'] == null
            ? null
            : AccountAuthenticationStatusModel.fromJson(json['authentication']),
        promptClientToAuthenticate:
            getBool(json['prompt_client_to_authenticate']),
        riskClassification: json['risk_classification'],
        status: getListFromMap(
          json['status'],
          (dynamic item) => item.toString(),
        ),
      );

  /// Clones a new instance
  AccountStatus copyWith({
    AccountAuthenticationStatusModel authentication,
    bool promptClientToAuthenticate,
    String riskClassification,
    List<String> status,
  }) =>
      AccountStatus(
        authentication: authentication ?? this.authentication,
        promptClientToAuthenticate:
            promptClientToAuthenticate ?? this.promptClientToAuthenticate,
        riskClassification: riskClassification ?? this.riskClassification,
        status: status ?? this.status,
      );
}
