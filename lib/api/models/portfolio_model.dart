import 'api_base_model.dart';
import 'portfolio_contract_model.dart';

/// Portfolio model class
class PortfolioModel extends APIBaseModel {
  /// Constructor
  PortfolioModel({
    this.contracts,
  });

  /// List of open positions.
  final List<PortfolioContractModel> contracts;
}
