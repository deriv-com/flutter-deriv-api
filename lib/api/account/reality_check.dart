import 'package:flutter_deriv_api/api/models/reality_check_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Reality check class
class RealityCheck extends RealityCheckModel {
  /// Class constructor
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

  /// Generate instance from json
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

  /// Generate copy of instance with given parameters
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
}
