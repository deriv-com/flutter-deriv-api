import 'package:flutter_deriv_api/api/account/models/portfolio_contract_model.dart';
import 'package:flutter_deriv_api/api/account/models/portfolio_model.dart';
import 'package:flutter_deriv_api/api/account/portfolio/exceptions/portfolio_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Account's Portfolio
class Portfolio extends PortfolioModel {
  /// Initializes
  Portfolio({
    List<PortfolioContractModel> contracts,
  }) : super(
          contracts: contracts,
        );

  /// Generates an instance from JSON
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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the portfolio fo logged-in account
  ///
  /// Throws a [PortfolioException] if API response contains an error
  static Future<Portfolio> fetchPortfolio(PortfolioRequest request) async {
    final PortfolioResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseException baseException}) => PortfolioException(
          code: baseException.code, message: baseException.message),
    );

    return Portfolio.fromJson(response.portfolio);
  }

  /// Generates a copy of instance with given parameters
  Portfolio copyWith({
    List<PortfolioContractModel> contracts,
  }) =>
      Portfolio(
        contracts: contracts ?? this.contracts,
      );
}
