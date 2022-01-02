// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_limits_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_limits_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Get limits response model class.
abstract class GetLimitsResponseModel extends Equatable {
  /// Initializes Get limits response model class .
  const GetLimitsResponseModel({
    this.getLimits,
  });

  /// Trading limits of real account user
  final GetLimits? getLimits;
}

/// Get limits response class.
class GetLimitsResponse extends GetLimitsResponseModel {
  /// Initializes Get limits response class.
  const GetLimitsResponse({
    GetLimits? getLimits,
  }) : super(
          getLimits: getLimits,
        );

  /// Creates an instance from JSON.
  factory GetLimitsResponse.fromJson(
    dynamic getLimitsJson,
  ) =>
      GetLimitsResponse(
        getLimits:
            getLimitsJson == null ? null : GetLimits.fromJson(getLimitsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (getLimits != null) {
      resultMap['get_limits'] = getLimits!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets the trading and withdrawal limits for logged in account
  ///
  /// Throws an [AccountLimitsException] if API response contains an error
  static Future<GetLimitsResponse> fetchAccountLimits([
    GetLimitsRequest? request,
  ]) async {
    final GetLimitsReceive response = await _api.call(
      request: request ?? const GetLimitsRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AccountLimitsException(baseExceptionModel: baseExceptionModel),
    );

    return GetLimitsResponse.fromJson(response.getLimits);
  }

  /// Creates a copy of instance with given parameters.
  GetLimitsResponse copyWith({
    GetLimits? getLimits,
  }) =>
      GetLimitsResponse(
        getLimits: getLimits ?? this.getLimits,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Get limits model class.
abstract class GetLimitsModel extends Equatable {
  /// Initializes Get limits model class .
  const GetLimitsModel({
    this.accountBalance,
    this.dailyTransfers,
    this.dailyTurnover,
    this.lifetimeLimit,
    this.marketSpecific,
    this.numOfDays,
    this.numOfDaysLimit,
    this.openPositions,
    this.payout,
    this.payoutPerSymbol,
    this.payoutPerSymbolAndContractType,
    this.remainder,
    this.withdrawalForXDaysMonetary,
    this.withdrawalSinceInceptionMonetary,
  });

  /// Maximum account cash balance
  final double? accountBalance;

  /// Daily transfers
  final Map<String, dynamic>? dailyTransfers;

  /// Maximum daily turnover
  final double? dailyTurnover;

  /// Lifetime withdrawal limit
  final double? lifetimeLimit;

  /// Contains limitation information for each market.
  final Map<String, List<MarketSpecificPropertyItem>>? marketSpecific;

  /// Number of days for num_of_days_limit withdrawal limit
  final int? numOfDays;

  /// Withdrawal limit for num_of_days days
  final double? numOfDaysLimit;

  /// Maximum number of open positions
  final int? openPositions;

  /// Maximum aggregate payouts on open positions
  final double? payout;

  /// Maximum payout for each symbol based on different barrier types.
  final PayoutPerSymbol? payoutPerSymbol;

  /// Maximum aggregate payouts on open positions per symbol and contract type. This limit can be exceeded up to the overall payout limit if there is no prior open position.
  final double? payoutPerSymbolAndContractType;

  /// Amount left to reach withdrawal limit
  final double? remainder;

  /// Total withdrawal for num_of_days days
  final double? withdrawalForXDaysMonetary;

  /// Total withdrawal since inception
  final double? withdrawalSinceInceptionMonetary;
}

/// Get limits class.
class GetLimits extends GetLimitsModel {
  /// Initializes Get limits class.
  const GetLimits({
    double? accountBalance,
    Map<String, dynamic>? dailyTransfers,
    double? dailyTurnover,
    double? lifetimeLimit,
    Map<String, List<MarketSpecificPropertyItem>>? marketSpecific,
    int? numOfDays,
    double? numOfDaysLimit,
    int? openPositions,
    double? payout,
    PayoutPerSymbol? payoutPerSymbol,
    double? payoutPerSymbolAndContractType,
    double? remainder,
    double? withdrawalForXDaysMonetary,
    double? withdrawalSinceInceptionMonetary,
  }) : super(
          accountBalance: accountBalance,
          dailyTransfers: dailyTransfers,
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

  /// Creates an instance from JSON.
  factory GetLimits.fromJson(Map<String, dynamic> json) => GetLimits(
        accountBalance: getDouble(json['account_balance']),
        dailyTransfers: json['daily_transfers'],
        dailyTurnover: getDouble(json['daily_turnover']),
        lifetimeLimit: getDouble(json['lifetime_limit']),
        marketSpecific: json['market_specific'] == null
            ? null
            : Map<String, List<MarketSpecificPropertyItem>>.fromEntries(json[
                    'market_specific']
                .entries
                .map<MapEntry<String, List<MarketSpecificPropertyItem>>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, List<MarketSpecificPropertyItem>>(
                            entry.key,
                            List<MarketSpecificPropertyItem>.from(
                              entry.value.map(
                                (dynamic item) =>
                                    MarketSpecificPropertyItem.fromJson(item),
                              ),
                            )))),
        numOfDays: json['num_of_days'],
        numOfDaysLimit: getDouble(json['num_of_days_limit']),
        openPositions: json['open_positions'],
        payout: getDouble(json['payout']),
        payoutPerSymbol: json['payout_per_symbol'] == null
            ? null
            : PayoutPerSymbol.fromJson(json['payout_per_symbol']),
        payoutPerSymbolAndContractType:
            getDouble(json['payout_per_symbol_and_contract_type']),
        remainder: getDouble(json['remainder']),
        withdrawalForXDaysMonetary:
            getDouble(json['withdrawal_for_x_days_monetary']),
        withdrawalSinceInceptionMonetary:
            getDouble(json['withdrawal_since_inception_monetary']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_balance'] = accountBalance;
    resultMap['daily_transfers'] = dailyTransfers;
    resultMap['daily_turnover'] = dailyTurnover;
    resultMap['lifetime_limit'] = lifetimeLimit;
    resultMap['market_specific'] = marketSpecific;
    resultMap['num_of_days'] = numOfDays;
    resultMap['num_of_days_limit'] = numOfDaysLimit;
    resultMap['open_positions'] = openPositions;
    resultMap['payout'] = payout;
    if (payoutPerSymbol != null) {
      resultMap['payout_per_symbol'] = payoutPerSymbol!.toJson();
    }
    resultMap['payout_per_symbol_and_contract_type'] =
        payoutPerSymbolAndContractType;
    resultMap['remainder'] = remainder;
    resultMap['withdrawal_for_x_days_monetary'] = withdrawalForXDaysMonetary;
    resultMap['withdrawal_since_inception_monetary'] =
        withdrawalSinceInceptionMonetary;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetLimits copyWith({
    double? accountBalance,
    Map<String, dynamic>? dailyTransfers,
    double? dailyTurnover,
    double? lifetimeLimit,
    Map<String, List<MarketSpecificPropertyItem>>? marketSpecific,
    int? numOfDays,
    double? numOfDaysLimit,
    int? openPositions,
    double? payout,
    PayoutPerSymbol? payoutPerSymbol,
    double? payoutPerSymbolAndContractType,
    double? remainder,
    double? withdrawalForXDaysMonetary,
    double? withdrawalSinceInceptionMonetary,
  }) =>
      GetLimits(
        accountBalance: accountBalance ?? this.accountBalance,
        dailyTransfers: dailyTransfers ?? this.dailyTransfers,
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Market specific property item model class.
abstract class MarketSpecificPropertyItemModel extends Equatable {
  /// Initializes Market specific property item model class .
  const MarketSpecificPropertyItemModel({
    this.name,
    this.payoutLimit,
    this.profileName,
    this.turnoverLimit,
  });

  /// The submarket display name.
  final String? name;

  /// The limit of payout for the submarket
  final double? payoutLimit;

  /// The limitation profile name.
  final String? profileName;

  /// The limit of turnover for the submarket
  final double? turnoverLimit;
}

/// Market specific property item class.
class MarketSpecificPropertyItem extends MarketSpecificPropertyItemModel {
  /// Initializes Market specific property item class.
  const MarketSpecificPropertyItem({
    String? name,
    double? payoutLimit,
    String? profileName,
    double? turnoverLimit,
  }) : super(
          name: name,
          payoutLimit: payoutLimit,
          profileName: profileName,
          turnoverLimit: turnoverLimit,
        );

  /// Creates an instance from JSON.
  factory MarketSpecificPropertyItem.fromJson(Map<String, dynamic> json) =>
      MarketSpecificPropertyItem(
        name: json['name'],
        payoutLimit: getDouble(json['payout_limit']),
        profileName: json['profile_name'],
        turnoverLimit: getDouble(json['turnover_limit']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['name'] = name;
    resultMap['payout_limit'] = payoutLimit;
    resultMap['profile_name'] = profileName;
    resultMap['turnover_limit'] = turnoverLimit;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MarketSpecificPropertyItem copyWith({
    String? name,
    double? payoutLimit,
    String? profileName,
    double? turnoverLimit,
  }) =>
      MarketSpecificPropertyItem(
        name: name ?? this.name,
        payoutLimit: payoutLimit ?? this.payoutLimit,
        profileName: profileName ?? this.profileName,
        turnoverLimit: turnoverLimit ?? this.turnoverLimit,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Payout per symbol model class.
abstract class PayoutPerSymbolModel extends Equatable {
  /// Initializes Payout per symbol model class .
  const PayoutPerSymbolModel({
    this.atm,
    this.nonAtm,
  });

  /// Maximum aggregate payouts on open positions per symbol for contracts where barrier is same as entry spot.
  final double? atm;

  /// Maximum aggregate payouts on open positions per symbol for contract where barrier is different from entry spot.
  final NonAtm? nonAtm;
}

/// Payout per symbol class.
class PayoutPerSymbol extends PayoutPerSymbolModel {
  /// Initializes Payout per symbol class.
  const PayoutPerSymbol({
    double? atm,
    NonAtm? nonAtm,
  }) : super(
          atm: atm,
          nonAtm: nonAtm,
        );

  /// Creates an instance from JSON.
  factory PayoutPerSymbol.fromJson(Map<String, dynamic> json) =>
      PayoutPerSymbol(
        atm: getDouble(json['atm']),
        nonAtm:
            json['non_atm'] == null ? null : NonAtm.fromJson(json['non_atm']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['atm'] = atm;
    if (nonAtm != null) {
      resultMap['non_atm'] = nonAtm!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PayoutPerSymbol copyWith({
    double? atm,
    NonAtm? nonAtm,
  }) =>
      PayoutPerSymbol(
        atm: atm ?? this.atm,
        nonAtm: nonAtm ?? this.nonAtm,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Non atm model class.
abstract class NonAtmModel extends Equatable {
  /// Initializes Non atm model class .
  const NonAtmModel({
    this.lessThanSevenDays,
    this.moreThanSevenDays,
  });

  /// Maximum aggregate payouts on open positions per symbol for contract where barrier is different from entry spot and duration is less than and equal to seven days
  final double? lessThanSevenDays;

  /// Maximum aggregate payouts on open positions per symbol for contract where barrier is different from entry spot and duration is more to seven days
  final double? moreThanSevenDays;
}

/// Non atm class.
class NonAtm extends NonAtmModel {
  /// Initializes Non atm class.
  const NonAtm({
    double? lessThanSevenDays,
    double? moreThanSevenDays,
  }) : super(
          lessThanSevenDays: lessThanSevenDays,
          moreThanSevenDays: moreThanSevenDays,
        );

  /// Creates an instance from JSON.
  factory NonAtm.fromJson(Map<String, dynamic> json) => NonAtm(
        lessThanSevenDays: getDouble(json['less_than_seven_days']),
        moreThanSevenDays: getDouble(json['more_than_seven_days']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['less_than_seven_days'] = lessThanSevenDays;
    resultMap['more_than_seven_days'] = moreThanSevenDays;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  NonAtm copyWith({
    double? lessThanSevenDays,
    double? moreThanSevenDays,
  }) =>
      NonAtm(
        lessThanSevenDays: lessThanSevenDays ?? this.lessThanSevenDays,
        moreThanSevenDays: moreThanSevenDays ?? this.moreThanSevenDays,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
