import 'base_model.dart';
import 'portfolio_contract_model.dart';

/// Portfolio model class
class PortfolioModel extends BaseModel {
  /// Constructor
  PortfolioModel({
    this.contracts,
  });

  /// List of open positions.
  final List<PortfolioContractModel> contracts;
}
