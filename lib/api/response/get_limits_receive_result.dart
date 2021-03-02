import 'package:meta/meta.dart';

import '../../basic_api/generated/get_limits_receive.dart';
import '../../basic_api/generated/get_limits_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Get limits response model class
abstract class GetLimitsResponseModel {
  /// Initializes
  GetLimitsResponseModel({
    @required this.getLimits,
  });

  /// Trading limits of real account user
  final GetLimits getLimits;
}

/// Get limits response class
class GetLimitsResponse extends GetLimitsResponseModel {
  /// Initializes
  GetLimitsResponse({
    @required GetLimits getLimits,
  }) : super(
          getLimits: getLimits,
        );

  /// Creates an instance from JSON
  factory GetLimitsResponse.fromJson(
    dynamic getLimitsJson,
  ) =>
      GetLimitsResponse(
        getLimits:
            getLimitsJson == null ? null : GetLimits.fromJson(getLimitsJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (getLimits != null) {
      resultMap['get_limits'] = getLimits.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the trading and withdrawal limits for logged in account
  ///
  /// Throws an [AccountLimitsException] if API response contains an error
  static Future<GetLimitsResponse> fetchAccountLimits([
    GetLimitsSend request,
  ]) async {
    final GetLimitsReceive response = await _api.call(
      request: request ?? const GetLimitsSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          AccountLimitsException(baseExceptionModel: baseExceptionModel),
    );

    return GetLimitsResponse.fromJson(response.getLimits);
  }

  /// Creates a copy of instance with given parameters
  GetLimitsResponse copyWith({
    GetLimits getLimits,
  }) =>
      GetLimitsResponse(
        getLimits: getLimits ?? this.getLimits,
      );
}
/// Get limits model class
abstract class GetLimitsModel {
  /// Initializes
  GetLimitsModel({
    @required this.withdrawalSinceInceptionMonetary,
    @required this.withdrawalForXDaysMonetary,
    @required this.remainder,
    @required this.payoutPerSymbolAndContractType,
    @required this.payout,
    @required this.openPositions,
    @required this.numOfDaysLimit,
    @required this.numOfDays,
    @required this.marketSpecific,
    @required this.lifetimeLimit,
    @required this.dailyTurnover,
    @required this.accountBalance,
    this.payoutPerSymbol,
  });

  /// Total withdrawal since inception
  final double withdrawalSinceInceptionMonetary;

  /// Total withdrawal for num_of_days days
  final double withdrawalForXDaysMonetary;

  /// Amount left to reach withdrawal limit
  final double remainder;

  /// Maximum aggregate payouts on open positions per symbol and contract type. This limit can be exceeded up to the overall payout limit if there is no prior open position.
  final double payoutPerSymbolAndContractType;

  /// Maximum aggregate payouts on open positions
  final double payout;

  /// Maximum number of open positions
  final int openPositions;

  /// Withdrawal limit for num_of_days days
  final double numOfDaysLimit;

  /// Number of days for num_of_days_limit withdrawal limit
  final int numOfDays;

  /// Contains limitation information for each market.
  final Map<String, List<MarketSpecificPropertyItem>> marketSpecific;

  /// Lifetime withdrawal limit
  final double lifetimeLimit;

  /// Maximum daily turnover
  final double dailyTurnover;

  /// Maximum account cash balance
  final double accountBalance;

  /// Maximum payout for each symbol based on different barrier types.
  final PayoutPerSymbol payoutPerSymbol;
}

/// Get limits class
class GetLimits extends GetLimitsModel {
  /// Initializes
  GetLimits({
    @required double accountBalance,
    @required double dailyTurnover,
    @required double lifetimeLimit,
    @required Map<String, List<MarketSpecificPropertyItem>> marketSpecific,
    @required int numOfDays,
    @required double numOfDaysLimit,
    @required int openPositions,
    @required double payout,
    @required double payoutPerSymbolAndContractType,
    @required double remainder,
    @required double withdrawalForXDaysMonetary,
    @required double withdrawalSinceInceptionMonetary,
    PayoutPerSymbol payoutPerSymbol,
  }) : super(
          accountBalance: accountBalance,
          dailyTurnover: dailyTurnover,
          lifetimeLimit: lifetimeLimit,
          marketSpecific: marketSpecific,
          numOfDays: numOfDays,
          numOfDaysLimit: numOfDaysLimit,
          openPositions: openPositions,
          payout: payout,
          payoutPerSymbolAndContractType: payoutPerSymbolAndContractType,
          remainder: remainder,
          withdrawalForXDaysMonetary: withdrawalForXDaysMonetary,
          withdrawalSinceInceptionMonetary: withdrawalSinceInceptionMonetary,
          payoutPerSymbol: payoutPerSymbol,
        );

  /// Creates an instance from JSON
  factory GetLimits.fromJson(Map<String, dynamic> json) => GetLimits(
        accountBalance: getDouble(json['account_balance']),
        dailyTurnover: getDouble(json['daily_turnover']),
        lifetimeLimit: getDouble(json['lifetime_limit']),
        marketSpecific: json['market_specific'] == null
            ? null
            : Map<String, List<MarketSpecificPropertyItem>>.fromEntries(
                json['market_specific']
                    .entries
                    .map<MapEntry<String, List<MarketSpecificPropertyItem>>>(
                        (MapEntry<String, dynamic> entry) =>
                            MapEntry<String, List<MarketSpecificPropertyItem>>(
                                entry.key,
                                entry.value == null
                                    ? null
                                    : List<MarketSpecificPropertyItem>.from(entry
                                        .value
                                        .map((dynamic item) => MarketSpecificPropertyItem.fromJson(item)))))),
        numOfDays: json['num_of_days'],
        numOfDaysLimit: getDouble(json['num_of_days_limit']),
        openPositions: json['open_positions'],
        payout: getDouble(json['payout']),
        payoutPerSymbolAndContractType:
            getDouble(json['payout_per_symbol_and_contract_type']),
        remainder: getDouble(json['remainder']),
        withdrawalForXDaysMonetary:
            getDouble(json['withdrawal_for_x_days_monetary']),
        withdrawalSinceInceptionMonetary:
            getDouble(json['withdrawal_since_inception_monetary']),
        payoutPerSymbol: json['payout_per_symbol'] == null
            ? null
            : PayoutPerSymbol.fromJson(json['payout_per_symbol']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_balance'] = accountBalance;
    resultMap['daily_turnover'] = dailyTurnover;
    resultMap['lifetime_limit'] = lifetimeLimit;
    resultMap['market_specific'] = marketSpecific;
    resultMap['num_of_days'] = numOfDays;
    resultMap['num_of_days_limit'] = numOfDaysLimit;
    resultMap['open_positions'] = openPositions;
    resultMap['payout'] = payout;
    resultMap['payout_per_symbol_and_contract_type'] =
        payoutPerSymbolAndContractType;
    resultMap['remainder'] = remainder;
    resultMap['withdrawal_for_x_days_monetary'] = withdrawalForXDaysMonetary;
    resultMap['withdrawal_since_inception_monetary'] =
        withdrawalSinceInceptionMonetary;
    if (payoutPerSymbol != null) {
      resultMap['payout_per_symbol'] = payoutPerSymbol.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  GetLimits copyWith({
    double accountBalance,
    double dailyTurnover,
    double lifetimeLimit,
    Map<String, List<MarketSpecificPropertyItem>> marketSpecific,
    int numOfDays,
    double numOfDaysLimit,
    int openPositions,
    double payout,
    double payoutPerSymbolAndContractType,
    double remainder,
    double withdrawalForXDaysMonetary,
    double withdrawalSinceInceptionMonetary,
    PayoutPerSymbol payoutPerSymbol,
  }) =>
      GetLimits(
        accountBalance: accountBalance ?? this.accountBalance,
        dailyTurnover: dailyTurnover ?? this.dailyTurnover,
        lifetimeLimit: lifetimeLimit ?? this.lifetimeLimit,
        marketSpecific: marketSpecific ?? this.marketSpecific,
        numOfDays: numOfDays ?? this.numOfDays,
        numOfDaysLimit: numOfDaysLimit ?? this.numOfDaysLimit,
        openPositions: openPositions ?? this.openPositions,
        payout: payout ?? this.payout,
        payoutPerSymbolAndContractType: payoutPerSymbolAndContractType ??
            this.payoutPerSymbolAndContractType,
        remainder: remainder ?? this.remainder,
        withdrawalForXDaysMonetary:
            withdrawalForXDaysMonetary ?? this.withdrawalForXDaysMonetary,
        withdrawalSinceInceptionMonetary: withdrawalSinceInceptionMonetary ??
            this.withdrawalSinceInceptionMonetary,
        payoutPerSymbol: payoutPerSymbol ?? this.payoutPerSymbol,
      );
}
/// Market specific property item model class
abstract class MarketSpecificPropertyItemModel {
  /// Initializes
  MarketSpecificPropertyItemModel({
    @required this.turnoverLimit,
    @required this.profileName,
    @required this.payoutLimit,
    @required this.name,
  });

  /// The limit of turnover for the submarket
  final double turnoverLimit;

  /// The limitation profile name.
  final String profileName;

  /// The limit of payout for the submarket
  final double payoutLimit;

  /// The submarket display name.
  final String name;
}

/// Market specific property item class
class MarketSpecificPropertyItem extends MarketSpecificPropertyItemModel {
  /// Initializes
  MarketSpecificPropertyItem({
    @required String name,
    @required double payoutLimit,
    @required String profileName,
    @required double turnoverLimit,
  }) : super(
          name: name,
          payoutLimit: payoutLimit,
          profileName: profileName,
          turnoverLimit: turnoverLimit,
        );

  /// Creates an instance from JSON
  factory MarketSpecificPropertyItem.fromJson(Map<String, dynamic> json) =>
      MarketSpecificPropertyItem(
        name: json['name'],
        payoutLimit: getDouble(json['payout_limit']),
        profileName: json['profile_name'],
        turnoverLimit: getDouble(json['turnover_limit']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['name'] = name;
    resultMap['payout_limit'] = payoutLimit;
    resultMap['profile_name'] = profileName;
    resultMap['turnover_limit'] = turnoverLimit;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  MarketSpecificPropertyItem copyWith({
    String name,
    double payoutLimit,
    String profileName,
    double turnoverLimit,
  }) =>
      MarketSpecificPropertyItem(
        name: name ?? this.name,
        payoutLimit: payoutLimit ?? this.payoutLimit,
        profileName: profileName ?? this.profileName,
        turnoverLimit: turnoverLimit ?? this.turnoverLimit,
      );
}
/// Payout per symbol model class
abstract class PayoutPerSymbolModel {
  /// Initializes
  PayoutPerSymbolModel({
    @required this.nonAtm,
    this.atm,
  });

  /// Maximum aggregate payouts on open positions per symbol for contract where barrier is different from entry spot.
  final NonAtm nonAtm;

  /// Maximum aggregate payouts on open positions per symbol for contracts where barrier is same as entry spot.
  final double atm;
}

/// Payout per symbol class
class PayoutPerSymbol extends PayoutPerSymbolModel {
  /// Initializes
  PayoutPerSymbol({
    @required NonAtm nonAtm,
    double atm,
  }) : super(
          nonAtm: nonAtm,
          atm: atm,
        );

  /// Creates an instance from JSON
  factory PayoutPerSymbol.fromJson(Map<String, dynamic> json) =>
      PayoutPerSymbol(
        nonAtm:
            json['non_atm'] == null ? null : NonAtm.fromJson(json['non_atm']),
        atm: getDouble(json['atm']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (nonAtm != null) {
      resultMap['non_atm'] = nonAtm.toJson();
    }
    resultMap['atm'] = atm;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  PayoutPerSymbol copyWith({
    NonAtm nonAtm,
    double atm,
  }) =>
      PayoutPerSymbol(
        nonAtm: nonAtm ?? this.nonAtm,
        atm: atm ?? this.atm,
      );
}
/// Non atm model class
abstract class NonAtmModel {
  /// Initializes
  NonAtmModel({
    @required this.moreThanSevenDays,
    @required this.lessThanSevenDays,
  });

  /// Maximum aggregate payouts on open positions per symbol for contract where barrier is different from entry spot and duration is more to seven days
  final double moreThanSevenDays;

  /// Maximum aggregate payouts on open positions per symbol for contract where barrier is different from entry spot and duration is less than and equal to seven days
  final double lessThanSevenDays;
}

/// Non atm class
class NonAtm extends NonAtmModel {
  /// Initializes
  NonAtm({
    @required double lessThanSevenDays,
    @required double moreThanSevenDays,
  }) : super(
          lessThanSevenDays: lessThanSevenDays,
          moreThanSevenDays: moreThanSevenDays,
        );

  /// Creates an instance from JSON
  factory NonAtm.fromJson(Map<String, dynamic> json) => NonAtm(
        lessThanSevenDays: getDouble(json['less_than_seven_days']),
        moreThanSevenDays: getDouble(json['more_than_seven_days']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['less_than_seven_days'] = lessThanSevenDays;
    resultMap['more_than_seven_days'] = moreThanSevenDays;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  NonAtm copyWith({
    double lessThanSevenDays,
    double moreThanSevenDays,
  }) =>
      NonAtm(
        lessThanSevenDays: lessThanSevenDays ?? this.lessThanSevenDays,
        moreThanSevenDays: moreThanSevenDays ?? this.moreThanSevenDays,
      );
}
