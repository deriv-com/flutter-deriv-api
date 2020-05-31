import 'package:flutter_deriv_api/api/account/models/account_authentication_status_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Model class for account status
abstract class AccountStatusModel extends APIBaseModel {
  /// Initializes
  AccountStatusModel({
    this.authentication,
    this.currencyConfig,
    this.promptClientToAuthenticate,
    this.riskClassification,
    this.status,
  });

  /// This represents the authentication status of the user and it includes what
  /// authentication is needed.
  final AccountAuthenticationStatusModel authentication;

  /// Provides cashier details for client currency.
  final List<AccountStatusCurrencyConfigModel> currencyConfig;

  /// Indicates whether the client should be prompted to
  /// authenticate their account.
  final bool promptClientToAuthenticate;

  /// Client risk classification: `low`, `standard`, `high`.
  final AccountRiskClassification riskClassification;

  /// Account status. Possible status:
  /// - `age_verification`: client is age-verified.
  /// - `authenticated`: client is fully authenticated.
  /// - `cashier_locked`: cashier is locked.
  /// - `crs_tin_information`: client has updated tax related information.
  /// - `disabled`: account is disabled.
  /// - `document_expired`: client's submitted proof-of-identity documents have expired.
  /// - `document_expiring_soon`: client's submitted proof-of-identity documents are expiring within a month.
  /// - `financial_assessment_not_complete`: client has not completed financial assessment.
  /// - `professional`: this client has opted for a professional account.
  /// - `ukgc_funds_protection`: client has acknowledged UKGC funds protection notice.
  /// - `unwelcome`: client cannot deposit or buy contracts, but can withdraw or sell contracts.
  /// - `withdrawal_locked`: deposits allowed but withdrawals locked.
  final List<AccountStatusType> status;
}

/// Account Status CurrencyConfig Model class
class AccountStatusCurrencyConfigModel extends APIBaseModel {
  /// Initializes
  AccountStatusCurrencyConfigModel({
    this.currency,
    this.isDepositSuspended,
    this.isWithdrawalSuspended,
  });

  /// Creates instance from JSON
  factory AccountStatusCurrencyConfigModel.fromJson(
    String currency,
    Map<String, dynamic> json,
  ) =>
      AccountStatusCurrencyConfigModel(
        currency: currency,
        isDepositSuspended: getBool(json['is_deposit_suspended']),
        isWithdrawalSuspended: getBool(json['is_withdrawal_suspended']),
      );

  /// Currency code
  final String currency;

  /// Deposit is allowed for currency or not
  final bool isDepositSuspended;

  /// Withdrawal is allowed for currency or not
  final bool isWithdrawalSuspended;

  /// Creates a copy of instance with given parameters
  AccountStatusCurrencyConfigModel copyWith(
    String currency,
    bool isDepositSuspended,
    bool isWithdrawalSuspended,
  ) =>
      AccountStatusCurrencyConfigModel(
        currency: currency ?? this.currency,
        isDepositSuspended: isDepositSuspended ?? this.isDepositSuspended,
        isWithdrawalSuspended:
            isWithdrawalSuspended ?? this.isWithdrawalSuspended,
      );
}
