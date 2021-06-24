import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Payment agent model class
class PaymentAgentModel extends APIBaseModel {
  /// Initializes
  PaymentAgentModel({
    this.currencies,
    this.depositCommission,
    this.email,
    this.furtherInformation,
    this.maxWithdrawal,
    this.minWithdrawal,
    this.name,
    this.paymentAgentLoginId,
    this.summary,
    this.supportedBanks,
    this.telephone,
    this.url,
    this.withdrawalCommission,
  });

  /// Generate an instance from JSON
  factory PaymentAgentModel.fromJson(Map<String, dynamic> json) =>
      PaymentAgentModel(
        currencies: json['currencies'],
        depositCommission: json['deposit_commission'],
        email: json['email'],
        furtherInformation: json['further_information'],
        maxWithdrawal: json['max_withdrawal'],
        minWithdrawal: json['min_withdrawal'],
        name: json['name'],
        paymentAgentLoginId: json['paymentagent_loginid'],
        summary: json['summary'],
        supportedBanks: json['supported_banks'],
        telephone: json['telephone'],
        url: json['url'],
        withdrawalCommission: json['withdrawal_commission'],
      );

  /// Currencies that are accepted by this payment agent.
  final String? currencies;

  /// Commission amount applied on deposits made through this payment agent.
  final String? depositCommission;

  /// Payment agent's email address.
  final String? email;

  /// More descriptions about this payment agent.
  final String? furtherInformation;

  /// Maximum withdrawal allowed for transactions through this payment agent.
  final String? maxWithdrawal;

  /// Minimum withdrawal allowed for transactions through this payment agent.
  final String? minWithdrawal;

  /// Payment agent's name.
  final String? name;

  /// Payment agent's login id.
  final String? paymentAgentLoginId;

  /// A summary about payment agent.
  final String? summary;

  /// Comma separated list of supported banks.
  final String? supportedBanks;

  /// Payment agent's phone number.
  final String? telephone;

  /// Payment agent's website URL.
  final String? url;

  /// Commission amount applied on withdrawals made through this payment agent.
  final String? withdrawalCommission;

  /// Generate a copy of instance with given parameters
  PaymentAgentModel copyWith({
    String? currencies,
    String? depositCommission,
    String? email,
    String? furtherInformation,
    String? maxWithdrawal,
    String? minWithdrawal,
    String? name,
    String? paymentAgentLoginId,
    String? summary,
    String? supportedBanks,
    String? telephone,
    String? url,
    String? withdrawalCommission,
  }) =>
      PaymentAgentModel(
        currencies: currencies ?? this.currencies,
        depositCommission: depositCommission ?? this.depositCommission,
        email: email ?? this.email,
        furtherInformation: furtherInformation ?? this.furtherInformation,
        maxWithdrawal: maxWithdrawal ?? this.maxWithdrawal,
        minWithdrawal: minWithdrawal ?? this.minWithdrawal,
        name: name ?? this.name,
        paymentAgentLoginId: paymentAgentLoginId ?? this.paymentAgentLoginId,
        summary: summary ?? this.summary,
        supportedBanks: supportedBanks ?? this.supportedBanks,
        telephone: telephone ?? this.telephone,
        url: url ?? this.url,
        withdrawalCommission: withdrawalCommission ?? this.withdrawalCommission,
      );
}
