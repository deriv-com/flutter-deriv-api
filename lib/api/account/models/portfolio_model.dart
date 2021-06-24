import 'package:flutter_deriv_api/api/account/models/portfolio_contract_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Portfolio model class
class PortfolioModel extends APIBaseModel {
  /// Initializes
  PortfolioModel({
    this.contracts,
  });

  /// List of open positions.
  final List<PortfolioContractModel?>? contracts;
}
