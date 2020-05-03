import 'package:flutter_deriv_api/api/models/payment_agent_model.dart';

/// Payment agent class
class PaymentAgent extends PaymentAgentModel {
  /// Initializes
  PaymentAgent({
    String currencies,
    String depositCommission,
    String email,
    String furtherInformation,
    String maxWithdrawal,
    String minWithdrawal,
    String name,
    String paymentAgentLoginId,
    String summary,
    String supportedBanks,
    String telephone,
    String url,
    String withdrawalCommission,
  }) : super(
          currencies: currencies,
          depositCommission: depositCommission,
          email: email,
          furtherInformation: furtherInformation,
          maxWithdrawal: maxWithdrawal,
          minWithdrawal: minWithdrawal,
          name: name,
          paymentAgentLoginId: paymentAgentLoginId,
          summary: summary,
          supportedBanks: supportedBanks,
          telephone: telephone,
          url: url,
          withdrawalCommission: withdrawalCommission,
        );

  /// Generate an instance from json
  factory PaymentAgent.fromJson(Map<String, dynamic> json) => PaymentAgent(
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

  /// Generate a copy of instance with given parameters
  PaymentAgent copyWith({
    String currencies,
    String depositCommission,
    String email,
    String furtherInformation,
    String maxWithdrawal,
    String minWithdrawal,
    String name,
    String paymentAgentLoginId,
    String summary,
    String supportedBanks,
    String telephone,
    String url,
    String withdrawalCommission,
  }) =>
      PaymentAgent(
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
