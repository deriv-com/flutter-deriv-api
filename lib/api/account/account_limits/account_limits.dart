import 'package:flutter_deriv_api/api/account/account_limits/exceptions/account_limits_exception.dart';
import 'package:flutter_deriv_api/api/account/models/account_limits_model.dart';
import 'package:flutter_deriv_api/api/account/models/account_market_limits_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Trading limits of real account user
class AccountLimits extends AccountLimitsModel {
  /// Initializes
  AccountLimits({
    double accountBalance,
    double dailyTurnover,
    double lifetimeLimit,
    List<AccountMarketLimitsModel> marketSpecific,
    int numOfDays,
    double numOfDaysLimit,
    int openPositions,
    double payout,
    String payoutPerSymbol,
    double payoutPerSymbolAndContractType,
    double remainder,
    double withdrawalForXDaysMonetary,
    double withdrawalSinceInceptionMonetary,
  }) : super(
          accountBalance: accountBalance,
          dailyTurnover: dailyTurnover,
          lifetimeLimit: lifetimeLimit,
          marketSpecific: marketSpecific,
          numOfDays: numOfDays,
          numOfDaysLimit: numOfDaysLimit,
          openPositions: openPositions,
          payout: payout,
          payoutPerSymbol: payoutPerSymbol,
          payoutPerSymbolAndContractType: payoutPerSymbolAndContractType,
          remainder: remainder,
          withdrawalForXDaysMonetary: withdrawalForXDaysMonetary,
          withdrawalSinceInceptionMonetary: withdrawalSinceInceptionMonetary,
        );

  /// Generates an instance from JSON
  factory AccountLimits.fromJson(Map<String, dynamic> json) => AccountLimits(
        accountBalance: json['account_balance']?.toDouble(),
        dailyTurnover: json['daily_turnover'],
        lifetimeLimit: json['lifetime_limit']?.toDouble(),
        marketSpecific: getListFromMap(
          json['market_specific']?.entries,
          itemToTypeCallback: (dynamic item) =>
              AccountMarketLimitsModel.fromJson(item.key, item.value),
        ),
        numOfDays: json['num_of_days'],
        numOfDaysLimit: json['num_of_days_limit']?.toDouble(),
        openPositions: json['open_positions'],
        payout: json['payout']?.toDouble(),
        payoutPerSymbol: json['payout_per_symbol'],
        payoutPerSymbolAndContractType:
            json['payout_per_symbol_and_contract_type'],
        remainder: json['remainder']?.toDouble(),
        withdrawalForXDaysMonetary:
            json['withdrawal_for_x_days_monetary']?.toDouble(),
        withdrawalSinceInceptionMonetary:
            json['withdrawal_since_inception_monetary']?.toDouble(),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the trading and withdrawal limits for logged in account
  ///
  /// Throws an [AccountLimitsException] if API response contains an error
  static Future<AccountLimits> fetchAccountLimits([
    GetLimitsRequest request,
  ]) async {
    final GetLimitsResponse response = await _api.call(
      request: request ?? const GetLimitsRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({String code, String message}) =>
          AccountLimitsException(code: code, message: message),
    );

    return AccountLimits.fromJson(response.getLimits);
  }

  /// Generates a copy of instance with given parameters
  AccountLimits copyWith({
    double accountBalance,
    double dailyTurnover,
    double lifetimeLimit,
    List<AccountMarketLimitsModel> marketSpecific,
    int numOfDays,
    double numOfDaysLimit,
    int openPositions,
    double payout,
    String payoutPerSymbol,
    double payoutPerSymbolAndContractType,
    double remainder,
    double withdrawalForXDaysMonetary,
    double withdrawalSinceInceptionMonetary,
  }) =>
      AccountLimits(
        accountBalance: accountBalance ?? this.accountBalance,
        dailyTurnover: dailyTurnover ?? this.dailyTurnover,
        lifetimeLimit: lifetimeLimit ?? this.lifetimeLimit,
        marketSpecific: marketSpecific ?? this.marketSpecific,
        numOfDays: numOfDays ?? this.numOfDays,
        numOfDaysLimit: numOfDaysLimit ?? this.numOfDaysLimit,
        openPositions: openPositions ?? this.openPositions,
        payout: payout ?? this.payout,
        payoutPerSymbol: payoutPerSymbol ?? this.payoutPerSymbol,
        payoutPerSymbolAndContractType: payoutPerSymbolAndContractType ??
            this.payoutPerSymbolAndContractType,
        remainder: remainder ?? this.remainder,
        withdrawalForXDaysMonetary:
            withdrawalForXDaysMonetary ?? this.withdrawalForXDaysMonetary,
        withdrawalSinceInceptionMonetary: withdrawalSinceInceptionMonetary ??
            this.withdrawalSinceInceptionMonetary,
      );
}
