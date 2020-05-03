import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Payment agent model class
abstract class PaymentAgentModel extends APIBaseModel {
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

  /// Currencies that are accepted by this payment agent.
  final String currencies;

  /// Commission amount applied on deposits made through this payment agent.
  final String depositCommission;

  /// Payment agent's email address.
  final String email;

  /// More descriptions about this payment agent.
  final String furtherInformation;

  /// Maximum withdrawal allowed for transactions through this payment agent.
  final String maxWithdrawal;

  /// Minimum withdrawal allowed for transactions through this payment agent.
  final String minWithdrawal;

  /// Payment agent's name.
  final String name;

  /// Payment agent's login id.
  final String paymentAgentLoginId;

  /// A summary about payment agent.
  final String summary;

  /// Comma separated list of supported banks.
  final String supportedBanks;

  /// Payment agent's phone number.
  final String telephone;

  /// Payment agent's website URL.
  final String url;

  /// Commission amount applied on withdrawals made through this payment agent.
  final String withdrawalCommission;
}
