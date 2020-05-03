import 'package:flutter_deriv_api/api/models/portfolio_contract_model.dart';
import 'package:flutter_deriv_api/api/models/portfolio_model.dart';

/// Account's Portfolio
class Portfolio extends PortfolioModel {
  /// Initializes
  Portfolio({
    List<PortfolioContractModel> contracts,
  }) : super(
          contracts: contracts,
        );

  /// Instance from JSON
  factory Portfolio.fromJson(
    Map<String, dynamic> json,
  ) =>
      Portfolio(
        contracts: json['contracts'] == null
            ? null
            : json['contracts']
                .map<PortfolioContractModel>(
                    (dynamic entry) => PortfolioContractModel.fromJson(entry))
                .toList(),
      );

  /// Clones a new instance
  Portfolio copyWith({
    List<PortfolioContractModel> contracts,
  }) =>
      Portfolio(
        contracts: contracts ?? this.contracts,
      );
}
