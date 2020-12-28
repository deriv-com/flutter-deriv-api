/// Buy send model class
abstract class BuySendModel {
  /// Initializes
  BuySendModel({
    @required this.buy,
    this.parameters,
    @required this.price,
    this.subscribe,
  });

  /// Either the ID received from a Price Proposal (`proposal` call), or `1` if contract buy parameters are passed in the `parameters` field.
  final String buy;

  /// [Optional] Used to pass the parameters for contract buy.
  final Parameters parameters;

  /// Maximum price at which to purchase the contract.
  final double price;

  /// [Optional] `1` to stream.
  final int subscribe;
}

/// Buy send class
class BuySend extends BuySendModel {
  /// Initializes
  BuySend({
    @required String buy,
    Parameters parameters,
    @required double price,
    int subscribe,
  }) : super(
          buy: buy,
          parameters: parameters,
          price: price,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory BuySend.fromJson(Map<String, dynamic> json) => BuySend(
        buy: json['buy'],
        parameters: json['parameters'] == null
            ? null
            : Parameters.fromJson(json['parameters']),
        price: getDouble(json['price']),
        subscribe: json['subscribe'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['buy'] = buy;
    if (parameters != null) {
      result['parameters'] = parameters.toJson();
    }
    result['price'] = price;
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  BuySend copyWith({
    String buy,
    Parameters parameters,
    double price,
    int subscribe,
  }) =>
      BuySend(
        buy: buy ?? this.buy,
        parameters: parameters ?? this.parameters,
        price: price ?? this.price,
        subscribe: subscribe ?? this.subscribe,
      );
}
/// Parameters model class
abstract class ParametersModel {
  /// Initializes
  ParametersModel({
    this.amount,
    this.appMarkupPercentage,
    this.barrier,
    this.barrier2,
    this.basis,
    @required this.cancellation,
    @required this.contractType,
    @required this.currency,
    this.dateExpiry,
    this.dateStart,
    this.duration,
    this.durationUnit,
    @required this.limitOrder,
    this.multiplier,
    this.productType,
    this.selectedTick,
    @required this.symbol,
    this.tradingPeriodStart,
  });

  /// [Optional] Proposed payout or stake value
  final double amount;

  /// [Optional] Markup added to contract prices (as a percentage of contract payout)
  final double appMarkupPercentage;

  /// [Optional] Barrier for the contract (or last digit prediction for digit contracts). Contracts less than 24 hours in duration would need a relative barrier (barriers which need +/-), where entry spot would be adjusted accordingly with that amount to define a barrier, except for Synthetic Indices as they support both relative and absolute barriers.
  final String barrier;

  /// [Optional] Low barrier for the contract (for contracts with two barriers). Contracts less than 24 hours in duration would need a relative barrier (barriers which need +/-), where entry spot would be adjusted accordingly with that amount to define a barrier, except for Synthetic Indices as they support both relative and absolute barriers.
  final String barrier2;

  /// [Optional] Indicates whether amount is 'payout' or 'stake' for binary options.
  final BasisEnum basis;

  /// Cancellation duration option (only for `MULTUP` and `MULTDOWN` contracts).
  final String cancellation;

  /// A valid contract-type
  final ContractTypeEnum contractType;

  /// This can only be the account-holder's currency
  final String currency;

  /// [Optional] Epoch value of the expiry time of the contract. You must either specify date_expiry or duration.
  final int dateExpiry;

  /// [Optional] For forward-starting contracts, epoch value of the starting time of the contract.
  final int dateStart;

  /// [Optional] Duration quantity
  final int duration;

  /// [Optional] Duration unit is `s`: seconds, `m`: minutes, `h`: hours, `d`: days, `t`: ticks
  final DurationUnitEnum durationUnit;

  /// Add an order to close the contract once the order condition is met (only for `MULTUP` and `MULTDOWN` contracts).
  final LimitOrder limitOrder;

  /// [Optional] The multiplier for non-binary options. E.g. lookbacks.
  final double multiplier;

  /// [Optional] The product type.
  final ProductTypeEnum productType;

  /// [Optional] The tick that is predicted to have the highest/lowest value - for tickhigh and ticklow contracts.
  final int selectedTick;

  /// Symbol code
  final String symbol;

  /// [Optional] An epoch value of a predefined trading period start time
  final int tradingPeriodStart;
}

/// Parameters class
class Parameters extends ParametersModel {
  /// Initializes
  Parameters({
    double amount,
    double appMarkupPercentage,
    String barrier,
    String barrier2,
    String basis,
    @required String cancellation,
    @required String contractType,
    @required String currency,
    int dateExpiry,
    int dateStart,
    int duration,
    String durationUnit,
    @required LimitOrder limitOrder,
    double multiplier,
    String productType,
    int selectedTick,
    @required String symbol,
    int tradingPeriodStart,
  }) : super(
          amount: amount,
          appMarkupPercentage: appMarkupPercentage,
          barrier: barrier,
          barrier2: barrier2,
          basis: basis,
          cancellation: cancellation,
          contractType: contractType,
          currency: currency,
          dateExpiry: dateExpiry,
          dateStart: dateStart,
          duration: duration,
          durationUnit: durationUnit,
          limitOrder: limitOrder,
          multiplier: multiplier,
          productType: productType,
          selectedTick: selectedTick,
          symbol: symbol,
          tradingPeriodStart: tradingPeriodStart,
        );

  /// Creates an instance from JSON
  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        amount: getDouble(json['amount']),
        appMarkupPercentage: getDouble(json['app_markup_percentage']),
        barrier: json['barrier'],
        barrier2: json['barrier2'],
        basis: json['basis'] == null
            ? null
            : basisEnumMapper.entries
                .firstWhere((entry) => entry.value == json['basis'],
                    orElse: () => null)
                ?.key,
        cancellation: json['cancellation'],
        contractType: json['contract_type'] == null
            ? null
            : contractTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['contract_type'],
                    orElse: () => null)
                ?.key,
        currency: json['currency'],
        dateExpiry: json['date_expiry'],
        dateStart: json['date_start'],
        duration: json['duration'],
        durationUnit: json['duration_unit'] == null
            ? null
            : durationUnitEnumMapper.entries
                .firstWhere((entry) => entry.value == json['duration_unit'],
                    orElse: () => null)
                ?.key,
        limitOrder: json['limit_order'] == null
            ? null
            : LimitOrder.fromJson(json['limit_order']),
        multiplier: getDouble(json['multiplier']),
        productType: json['product_type'] == null
            ? null
            : productTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['product_type'],
                    orElse: () => null)
                ?.key,
        selectedTick: json['selected_tick'],
        symbol: json['symbol'],
        tradingPeriodStart: json['trading_period_start'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['amount'] = amount;
    result['app_markup_percentage'] = appMarkupPercentage;
    result['barrier'] = barrier;
    result['barrier2'] = barrier2;
    result['basis'] = basisEnumMapper[basis];
    result['cancellation'] = cancellation;
    result['contract_type'] = contractTypeEnumMapper[contractType];
    result['currency'] = currency;
    result['date_expiry'] = dateExpiry;
    result['date_start'] = dateStart;
    result['duration'] = duration;
    result['duration_unit'] = durationUnitEnumMapper[durationUnit];
    if (limitOrder != null) {
      result['limit_order'] = limitOrder.toJson();
    }
    result['multiplier'] = multiplier;
    result['product_type'] = productTypeEnumMapper[productType];
    result['selected_tick'] = selectedTick;
    result['symbol'] = symbol;
    result['trading_period_start'] = tradingPeriodStart;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Parameters copyWith({
    double amount,
    double appMarkupPercentage,
    String barrier,
    String barrier2,
    String basis,
    String cancellation,
    String contractType,
    String currency,
    int dateExpiry,
    int dateStart,
    int duration,
    String durationUnit,
    LimitOrder limitOrder,
    double multiplier,
    String productType,
    int selectedTick,
    String symbol,
    int tradingPeriodStart,
  }) =>
      Parameters(
        amount: amount ?? this.amount,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        barrier: barrier ?? this.barrier,
        barrier2: barrier2 ?? this.barrier2,
        basis: basis ?? this.basis,
        cancellation: cancellation ?? this.cancellation,
        contractType: contractType ?? this.contractType,
        currency: currency ?? this.currency,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        dateStart: dateStart ?? this.dateStart,
        duration: duration ?? this.duration,
        durationUnit: durationUnit ?? this.durationUnit,
        limitOrder: limitOrder ?? this.limitOrder,
        multiplier: multiplier ?? this.multiplier,
        productType: productType ?? this.productType,
        selectedTick: selectedTick ?? this.selectedTick,
        symbol: symbol ?? this.symbol,
        tradingPeriodStart: tradingPeriodStart ?? this.tradingPeriodStart,
      );
  // Creating Enum Mappers

  static final Map<BasisEnum, String> basisEnumMapper = {
    BasisEnum.payout: 'payout',
    BasisEnum.stake: 'stake',
  };

  static final Map<ContractTypeEnum, String> contractTypeEnumMapper = {
    ContractTypeEnum.MULTUP: 'MULTUP',
    ContractTypeEnum.MULTDOWN: 'MULTDOWN',
    ContractTypeEnum.UPORDOWN: 'UPORDOWN',
    ContractTypeEnum.EXPIRYRANGE: 'EXPIRYRANGE',
    ContractTypeEnum.ONETOUCH: 'ONETOUCH',
    ContractTypeEnum.CALLE: 'CALLE',
    ContractTypeEnum.LBHIGHLOW: 'LBHIGHLOW',
    ContractTypeEnum.ASIAND: 'ASIAND',
    ContractTypeEnum.EXPIRYRANGEE: 'EXPIRYRANGEE',
    ContractTypeEnum.DIGITDIFF: 'DIGITDIFF',
    ContractTypeEnum.DIGITMATCH: 'DIGITMATCH',
    ContractTypeEnum.DIGITOVER: 'DIGITOVER',
    ContractTypeEnum.PUTE: 'PUTE',
    ContractTypeEnum.DIGITUNDER: 'DIGITUNDER',
    ContractTypeEnum.NOTOUCH: 'NOTOUCH',
    ContractTypeEnum.CALL: 'CALL',
    ContractTypeEnum.RANGE: 'RANGE',
    ContractTypeEnum.LBFLOATPUT: 'LBFLOATPUT',
    ContractTypeEnum.DIGITODD: 'DIGITODD',
    ContractTypeEnum.PUT: 'PUT',
    ContractTypeEnum.ASIANU: 'ASIANU',
    ContractTypeEnum.LBFLOATCALL: 'LBFLOATCALL',
    ContractTypeEnum.EXPIRYMISSE: 'EXPIRYMISSE',
    ContractTypeEnum.EXPIRYMISS: 'EXPIRYMISS',
    ContractTypeEnum.DIGITEVEN: 'DIGITEVEN',
    ContractTypeEnum.TICKHIGH: 'TICKHIGH',
    ContractTypeEnum.TICKLOW: 'TICKLOW',
    ContractTypeEnum.RESETCALL: 'RESETCALL',
    ContractTypeEnum.RESETPUT: 'RESETPUT',
    ContractTypeEnum.CALLSPREAD: 'CALLSPREAD',
    ContractTypeEnum.PUTSPREAD: 'PUTSPREAD',
    ContractTypeEnum.RUNHIGH: 'RUNHIGH',
    ContractTypeEnum.RUNLOW: 'RUNLOW',
  };

  static final Map<DurationUnitEnum, String> durationUnitEnumMapper = {
    DurationUnitEnum.d: 'd',
    DurationUnitEnum.m: 'm',
    DurationUnitEnum.s: 's',
    DurationUnitEnum.h: 'h',
    DurationUnitEnum.t: 't',
  };

  static final Map<ProductTypeEnum, String> productTypeEnumMapper = {
    ProductTypeEnum.basic: 'basic',
  };
}

// Creating Enums

enum BasisEnum {
  payout,
  stake,
}

enum ContractTypeEnum {
  MULTUP,
  MULTDOWN,
  UPORDOWN,
  EXPIRYRANGE,
  ONETOUCH,
  CALLE,
  LBHIGHLOW,
  ASIAND,
  EXPIRYRANGEE,
  DIGITDIFF,
  DIGITMATCH,
  DIGITOVER,
  PUTE,
  DIGITUNDER,
  NOTOUCH,
  CALL,
  RANGE,
  LBFLOATPUT,
  DIGITODD,
  PUT,
  ASIANU,
  LBFLOATCALL,
  EXPIRYMISSE,
  EXPIRYMISS,
  DIGITEVEN,
  TICKHIGH,
  TICKLOW,
  RESETCALL,
  RESETPUT,
  CALLSPREAD,
  PUTSPREAD,
  RUNHIGH,
  RUNLOW,
}

enum DurationUnitEnum {
  d,
  m,
  s,
  h,
  t,
}

enum ProductTypeEnum {
  basic,
}
/// Limit order model class
abstract class LimitOrderModel {
  /// Initializes
  LimitOrderModel({
    @required this.stopLoss,
    @required this.takeProfit,
  });

  /// Contract will be automatically closed when the value of the contract reaches a specific loss.
  final double stopLoss;

  /// Contract will be automatically closed when the value of the contract reaches a specific profit.
  final double takeProfit;
}

/// Limit order class
class LimitOrder extends LimitOrderModel {
  /// Initializes
  LimitOrder({
    @required double stopLoss,
    @required double takeProfit,
  }) : super(
          stopLoss: stopLoss,
          takeProfit: takeProfit,
        );

  /// Creates an instance from JSON
  factory LimitOrder.fromJson(Map<String, dynamic> json) => LimitOrder(
        stopLoss: getDouble(json['stop_loss']),
        takeProfit: getDouble(json['take_profit']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['stop_loss'] = stopLoss;
    result['take_profit'] = takeProfit;

    return result;
  }

  /// Creates a copy of instance with given parameters
  LimitOrder copyWith({
    double stopLoss,
    double takeProfit,
  }) =>
      LimitOrder(
        stopLoss: stopLoss ?? this.stopLoss,
        takeProfit: takeProfit ?? this.takeProfit,
      );
}
