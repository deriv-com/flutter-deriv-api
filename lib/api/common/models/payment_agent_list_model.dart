import 'package:flutter_deriv_api/api/common/models/country_model.dart';
import 'package:flutter_deriv_api/api/common/models/payment_agent_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Payment agent model class
abstract class PaymentAgentListModel extends APIBaseModel {
  /// Initializes
  PaymentAgentListModel({
    this.countries,
    this.paymentAgents,
  });

  /// Countries.
  final List<CountryModel>? countries;

  /// Payment agent.
  final List<PaymentAgentModel?>? paymentAgents;
}
