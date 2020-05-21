import 'package:flutter_deriv_api/api/account/models/reality_check_model.dart';
import 'package:flutter_deriv_api/api/account/reality_check/exceptions/reality_check_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Reality check class
class RealityCheck extends RealityCheckModel {
  /// Initializes
  RealityCheck({
    double buyAmount,
    int buyCount,
    String currency,
    String loginId,
    int openContractCount,
    double potentialProfit,
    double sellAmount,
    int sellCount,
    DateTime startTime,
  }) : super(
          buyAmount: buyAmount,
          buyCount: buyCount,
          currency: currency,
          loginId: loginId,
          openContractCount: openContractCount,
          potentialProfit: potentialProfit,
          sellAmount: sellAmount,
          sellCount: sellCount,
          startTime: startTime,
        );

  /// Generate an instance from JSON
  factory RealityCheck.fromJson(Map<String, dynamic> json) => RealityCheck(
        buyAmount: json['buy_amount'],
        buyCount: json['buy_count'],
        currency: json['currency'],
        loginId: json['loginid'],
        openContractCount: json['open_contract_count'],
        potentialProfit: json['potential_profit'],
        sellAmount: json['sell_amount'],
        sellCount: json['sell_count'],
        startTime: getDateTime(json['start_time']),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generate a copy of instance with given parameters
  RealityCheck copyWith({
    double buyAmount,
    int buyCount,
    String currency,
    String loginId,
    int openContractCount,
    double potentialProfit,
    double sellAmount,
    int sellCount,
    DateTime startTime,
  }) =>
      RealityCheck(
        buyAmount: buyAmount ?? this.buyAmount,
        buyCount: buyCount ?? this.buyCount,
        currency: currency ?? this.currency,
        loginId: loginId ?? this.loginId,
        openContractCount: openContractCount ?? this.openContractCount,
        potentialProfit: potentialProfit ?? this.potentialProfit,
        sellAmount: sellAmount ?? this.sellAmount,
        sellCount: sellCount ?? this.sellCount,
        startTime: startTime ?? this.startTime,
      );

  /// Retrieves summary of client's trades and account for the reality check facility.
  /// A `reality check` means a display of time elapsed since the session began, and associated client profit/loss.
  /// The reality check facility is a regulatory requirement for certain landing companies.
  /// For parameters information refer to [RealityCheckRequest].
  static Future<RealityCheck> check([
    RealityCheckRequest request,
  ]) async {
    final RealityCheckResponse response = await _api.call(
      request: request ?? const RealityCheckRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          RealityCheckException(message: message),
    );

    return RealityCheck.fromJson(response.realityCheck);
  }
}
