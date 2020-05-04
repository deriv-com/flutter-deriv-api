import 'package:flutter_deriv_api/api/account/models/portfolio_contract_model.dart';
import 'package:flutter_deriv_api/api/account/models/portfolio_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

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
        contracts: getListFromMap(
          json['contracts'],
          itemToTypeCallback: (dynamic item) =>
              PortfolioContractModel.fromJson(item),
        ),
      );

  /// Clones a new instance
  Portfolio copyWith({
    List<PortfolioContractModel> contracts,
  }) =>
      Portfolio(
        contracts: contracts ?? this.contracts,
      );
}
