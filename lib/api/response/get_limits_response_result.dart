// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_limits_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_limits_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Get limits response model class.
abstract class GetLimitsResponseModel {
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
    super.getLimits,
  });

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

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets the trading and withdrawal limits for logged in account
  ///
  /// Throws an [BaseAPIException] if API response contains an error
  static Future<GetLimitsResponse> fetchAccountLimits([
    GetLimitsRequest? request,
  ]) async {
    final GetLimitsReceive response = await _api.call(
      request: request ?? const GetLimitsRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
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
}

/// Get limits model class.
abstract class GetLimitsModel {
  /// Initializes Get limits model class .
  const GetLimitsModel({
    this.accountBalance,
    this.dailyCumulativeAmountTransfers,
    this.dailyTransfers,
    this.dailyTurnover,
    this.lifetimeLimit,
    this.lifetimeTransfers,
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

  /// Cumulative daily transfer limits
  final Map<String, dynamic>? dailyCumulativeAmountTransfers;

  /// Daily transfers
  final Map<String, dynamic>? dailyTransfers;

  /// Maximum daily turnover
  final double? dailyTurnover;

  /// Lifetime withdrawal limit
  final double? lifetimeLimit;

  /// Lifetime transfer limits. Only present when applicable to the current accout.
  final LifetimeTransfers? lifetimeTransfers;

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
    super.accountBalance,
    super.dailyCumulativeAmountTransfers,
    super.dailyTransfers,
    super.dailyTurnover,
    super.lifetimeLimit,
    super.lifetimeTransfers,
    super.marketSpecific,
    super.numOfDays,
    super.numOfDaysLimit,
    super.openPositions,
    super.payout,
    super.payoutPerSymbol,
    super.payoutPerSymbolAndContractType,
    super.remainder,
    super.withdrawalForXDaysMonetary,
    super.withdrawalSinceInceptionMonetary,
  });

  /// Creates an instance from JSON.
  factory GetLimits.fromJson(Map<String, dynamic> json) => GetLimits(
        accountBalance: getDouble(json['account_balance']),
        dailyCumulativeAmountTransfers:
            json['daily_cumulative_amount_transfers'],
        dailyTransfers: json['daily_transfers'],
        dailyTurnover: getDouble(json['daily_turnover']),
        lifetimeLimit: getDouble(json['lifetime_limit']),
        lifetimeTransfers: json['lifetime_transfers'] == null
            ? null
            : LifetimeTransfers.fromJson(json['lifetime_transfers']),
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
    resultMap['daily_cumulative_amount_transfers'] =
        dailyCumulativeAmountTransfers;
    resultMap['daily_transfers'] = dailyTransfers;
    resultMap['daily_turnover'] = dailyTurnover;
    resultMap['lifetime_limit'] = lifetimeLimit;
    if (lifetimeTransfers != null) {
      resultMap['lifetime_transfers'] = lifetimeTransfers!.toJson();
    }
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
    Map<String, dynamic>? dailyCumulativeAmountTransfers,
    Map<String, dynamic>? dailyTransfers,
    double? dailyTurnover,
    double? lifetimeLimit,
    LifetimeTransfers? lifetimeTransfers,
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
        dailyCumulativeAmountTransfers: dailyCumulativeAmountTransfers ??
            this.dailyCumulativeAmountTransfers,
        dailyTransfers: dailyTransfers ?? this.dailyTransfers,
        dailyTurnover: dailyTurnover ?? this.dailyTurnover,
        lifetimeLimit: lifetimeLimit ?? this.lifetimeLimit,
        lifetimeTransfers: lifetimeTransfers ?? this.lifetimeTransfers,
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

/// Lifetime transfers model class.
abstract class LifetimeTransfersModel {
  /// Initializes Lifetime transfers model class .
  const LifetimeTransfersModel({
    this.cryptoToCrypto,
    this.cryptoToFiat,
    this.fiatToCrypto,
  });

  /// Lifetime transfer limit for crypto to crypto currencies.
  final CryptoToCrypto? cryptoToCrypto;

  /// Lifetime transfer limit for crypto to fiat currencies.
  final CryptoToFiat? cryptoToFiat;

  /// Lifetime transfer limit for fiat to crypto currencies.
  final FiatToCrypto? fiatToCrypto;
}

/// Lifetime transfers class.
class LifetimeTransfers extends LifetimeTransfersModel {
  /// Initializes Lifetime transfers class.
  const LifetimeTransfers({
    super.cryptoToCrypto,
    super.cryptoToFiat,
    super.fiatToCrypto,
  });

  /// Creates an instance from JSON.
  factory LifetimeTransfers.fromJson(Map<String, dynamic> json) =>
      LifetimeTransfers(
        cryptoToCrypto: json['crypto_to_crypto'] == null
            ? null
            : CryptoToCrypto.fromJson(json['crypto_to_crypto']),
        cryptoToFiat: json['crypto_to_fiat'] == null
            ? null
            : CryptoToFiat.fromJson(json['crypto_to_fiat']),
        fiatToCrypto: json['fiat_to_crypto'] == null
            ? null
            : FiatToCrypto.fromJson(json['fiat_to_crypto']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (cryptoToCrypto != null) {
      resultMap['crypto_to_crypto'] = cryptoToCrypto!.toJson();
    }
    if (cryptoToFiat != null) {
      resultMap['crypto_to_fiat'] = cryptoToFiat!.toJson();
    }
    if (fiatToCrypto != null) {
      resultMap['fiat_to_crypto'] = fiatToCrypto!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LifetimeTransfers copyWith({
    CryptoToCrypto? cryptoToCrypto,
    CryptoToFiat? cryptoToFiat,
    FiatToCrypto? fiatToCrypto,
  }) =>
      LifetimeTransfers(
        cryptoToCrypto: cryptoToCrypto ?? this.cryptoToCrypto,
        cryptoToFiat: cryptoToFiat ?? this.cryptoToFiat,
        fiatToCrypto: fiatToCrypto ?? this.fiatToCrypto,
      );
}

/// Crypto to crypto model class.
abstract class CryptoToCryptoModel {
  /// Initializes Crypto to crypto model class .
  const CryptoToCryptoModel({
    this.allowed,
    this.available,
  });

  /// Total limit in client's currency.
  final double? allowed;

  /// Remaining limit in client's currency.
  final double? available;
}

/// Crypto to crypto class.
class CryptoToCrypto extends CryptoToCryptoModel {
  /// Initializes Crypto to crypto class.
  const CryptoToCrypto({
    super.allowed,
    super.available,
  });

  /// Creates an instance from JSON.
  factory CryptoToCrypto.fromJson(Map<String, dynamic> json) => CryptoToCrypto(
        allowed: getDouble(json['allowed']),
        available: getDouble(json['available']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['allowed'] = allowed;
    resultMap['available'] = available;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CryptoToCrypto copyWith({
    double? allowed,
    double? available,
  }) =>
      CryptoToCrypto(
        allowed: allowed ?? this.allowed,
        available: available ?? this.available,
      );
}

/// Crypto to fiat model class.
abstract class CryptoToFiatModel {
  /// Initializes Crypto to fiat model class .
  const CryptoToFiatModel({
    this.allowed,
    this.available,
  });

  /// Total limit in client's currency.
  final double? allowed;

  /// Remaining limit in client's currency.
  final double? available;
}

/// Crypto to fiat class.
class CryptoToFiat extends CryptoToFiatModel {
  /// Initializes Crypto to fiat class.
  const CryptoToFiat({
    super.allowed,
    super.available,
  });

  /// Creates an instance from JSON.
  factory CryptoToFiat.fromJson(Map<String, dynamic> json) => CryptoToFiat(
        allowed: getDouble(json['allowed']),
        available: getDouble(json['available']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['allowed'] = allowed;
    resultMap['available'] = available;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CryptoToFiat copyWith({
    double? allowed,
    double? available,
  }) =>
      CryptoToFiat(
        allowed: allowed ?? this.allowed,
        available: available ?? this.available,
      );
}

/// Fiat to crypto model class.
abstract class FiatToCryptoModel {
  /// Initializes Fiat to crypto model class .
  const FiatToCryptoModel({
    this.allowed,
    this.available,
  });

  /// Total limit in client's currency.
  final double? allowed;

  /// Remaining limit in client's currency.
  final double? available;
}

/// Fiat to crypto class.
class FiatToCrypto extends FiatToCryptoModel {
  /// Initializes Fiat to crypto class.
  const FiatToCrypto({
    super.allowed,
    super.available,
  });

  /// Creates an instance from JSON.
  factory FiatToCrypto.fromJson(Map<String, dynamic> json) => FiatToCrypto(
        allowed: getDouble(json['allowed']),
        available: getDouble(json['available']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['allowed'] = allowed;
    resultMap['available'] = available;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FiatToCrypto copyWith({
    double? allowed,
    double? available,
  }) =>
      FiatToCrypto(
        allowed: allowed ?? this.allowed,
        available: available ?? this.available,
      );
}

/// Market specific property item model class.
abstract class MarketSpecificPropertyItemModel {
  /// Initializes Market specific property item model class .
  const MarketSpecificPropertyItemModel({
    this.level,
    this.name,
    this.payoutLimit,
    this.profileName,
    this.turnoverLimit,
  });

  /// The group the profile belong to.
  final String? level;

  /// The market or submarket display name.
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
    super.level,
    super.name,
    super.payoutLimit,
    super.profileName,
    super.turnoverLimit,
  });

  /// Creates an instance from JSON.
  factory MarketSpecificPropertyItem.fromJson(Map<String, dynamic> json) =>
      MarketSpecificPropertyItem(
        level: json['level'],
        name: json['name'],
        payoutLimit: getDouble(json['payout_limit']),
        profileName: json['profile_name'],
        turnoverLimit: getDouble(json['turnover_limit']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['level'] = level;
    resultMap['name'] = name;
    resultMap['payout_limit'] = payoutLimit;
    resultMap['profile_name'] = profileName;
    resultMap['turnover_limit'] = turnoverLimit;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MarketSpecificPropertyItem copyWith({
    String? level,
    String? name,
    double? payoutLimit,
    String? profileName,
    double? turnoverLimit,
  }) =>
      MarketSpecificPropertyItem(
        level: level ?? this.level,
        name: name ?? this.name,
        payoutLimit: payoutLimit ?? this.payoutLimit,
        profileName: profileName ?? this.profileName,
        turnoverLimit: turnoverLimit ?? this.turnoverLimit,
      );
}

/// Payout per symbol model class.
abstract class PayoutPerSymbolModel {
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
    super.atm,
    super.nonAtm,
  });

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
}

/// Non atm model class.
abstract class NonAtmModel {
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
    super.lessThanSevenDays,
    super.moreThanSevenDays,
  });

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
}
