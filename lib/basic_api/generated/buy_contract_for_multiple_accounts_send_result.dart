/// Buy contract for multiple accounts send model class
abstract class BuyContractForMultipleAccountsSendModel {
  /// Initializes
  BuyContractForMultipleAccountsSendModel({
    @required this.buyContractForMultipleAccounts,
    this.parameters,
    @required this.price,
    @required this.tokens,
  });

  /// Either the ID received from a Price Proposal (`proposal` call), or `1` if contract buy parameters are passed in the `parameters` field.
  final String buyContractForMultipleAccounts;

  /// [Optional] Used to pass the parameters for contract buy.
  final Parameters parameters;

  /// Maximum price at which to purchase the contract.
  final double price;

  /// List of API tokens identifying the accounts for which the contract is bought. Note: If the same token appears multiple times or if multiple tokens designate the same account, the contract is bought multiple times for this account.
  final List<String> tokens;
}

/// Buy contract for multiple accounts send class
class BuyContractForMultipleAccountsSend
    extends BuyContractForMultipleAccountsSendModel {
  /// Initializes
  BuyContractForMultipleAccountsSend({
    @required String buyContractForMultipleAccounts,
    Parameters parameters,
    @required double price,
    @required List<String> tokens,
  }) : super(
          buyContractForMultipleAccounts: buyContractForMultipleAccounts,
          parameters: parameters,
          price: price,
          tokens: tokens,
        );

  /// Creates an instance from JSON
  factory BuyContractForMultipleAccountsSend.fromJson(
          Map<String, dynamic> json) =>
      BuyContractForMultipleAccountsSend(
        buyContractForMultipleAccounts:
            json['buy_contract_for_multiple_accounts'],
        parameters: json['parameters'] == null
            ? null
            : Parameters.fromJson(json['parameters']),
        price: getDouble(json['price']),
        tokens: List<String>.from(json['tokens'].map((x) => x)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['buy_contract_for_multiple_accounts'] =
        buyContractForMultipleAccounts;
    if (parameters != null) {
      result['parameters'] = parameters.toJson();
    }
    result['price'] = price;
    result['tokens'] = tokens;

    return result;
  }

  /// Creates a copy of instance with given parameters
  BuyContractForMultipleAccountsSend copyWith({
    String buyContractForMultipleAccounts,
    Parameters parameters,
    double price,
    List<String> tokens,
  }) =>
      BuyContractForMultipleAccountsSend(
        buyContractForMultipleAccounts: buyContractForMultipleAccounts ??
            this.buyContractForMultipleAccounts,
        parameters: parameters ?? this.parameters,
        price: price ?? this.price,
        tokens: tokens ?? this.tokens,
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
    @required this.contractType,
    @required this.currency,
    this.dateExpiry,
    this.dateStart,
    this.duration,
    this.durationUnit,
    this.multiplier,
    this.selectedTick,
    @required this.symbol,
  });

  /// [Optional] Proposed `payout` or `stake` value
  final double amount;

  /// [Optional] Markup added to contract prices (as a percentage of contract payout)
  final double appMarkupPercentage;

  /// [Optional] Barrier for the contract (or last digit prediction for digit contracts). Contracts less than 24 hours in duration would need a relative barrier (barriers which need +/-), where entry spot would be adjusted accordingly with that amount to define a barrier, except for Synthetic Indices as they support both relative and absolute barriers.
  final String barrier;

  /// [Optional] Low barrier for the contract (for contracts with two barriers). Contracts less than 24 hours in duration would need a relative barrier (barriers which need +/-), where entry spot would be adjusted accordingly with that amount to define a barrier, except for Synthetic Indices as they support both relative and absolute barriers.
  final String barrier2;

  /// [Optional] Indicate whether amount is 'payout' or 'stake'.
  final BasisEnum basis;

  /// A valid contract-type
  final ContractTypeEnum contractType;

  /// This can only be the account-holder's currency
  final String currency;

  /// [Optional] Epoch value of the expiry time of the contract. You must either specify `date_expiry` or `duration`.
  final int dateExpiry;

  /// [Optional] For forward-starting contracts, epoch value of the starting time of the contract.
  final int dateStart;

  /// [Optional] Duration quantity
  final int duration;

  /// [Optional] Duration unit is `s`: seconds, `m`: minutes, `h`: hours, `d`: days, `t`: ticks
  final DurationUnitEnum durationUnit;

  /// [Optional] The multiplier for non-binary options. E.g. lookbacks.
  final double multiplier;

  /// [Optional] The tick that is predicted to have the highest/lowest value - for tickhigh and ticklow contracts.
  final int selectedTick;

  /// Symbol code
  final String symbol;
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
    @required String contractType,
    @required String currency,
    int dateExpiry,
    int dateStart,
    int duration,
    String durationUnit,
    double multiplier,
    int selectedTick,
    @required String symbol,
  }) : super(
          amount: amount,
          appMarkupPercentage: appMarkupPercentage,
          barrier: barrier,
          barrier2: barrier2,
          basis: basis,
          contractType: contractType,
          currency: currency,
          dateExpiry: dateExpiry,
          dateStart: dateStart,
          duration: duration,
          durationUnit: durationUnit,
          multiplier: multiplier,
          selectedTick: selectedTick,
          symbol: symbol,
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
        multiplier: getDouble(json['multiplier']),
        selectedTick: json['selected_tick'],
        symbol: json['symbol'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['amount'] = amount;
    result['app_markup_percentage'] = appMarkupPercentage;
    result['barrier'] = barrier;
    result['barrier2'] = barrier2;
    result['basis'] = basisEnumMapper[basis];
    result['contract_type'] = contractTypeEnumMapper[contractType];
    result['currency'] = currency;
    result['date_expiry'] = dateExpiry;
    result['date_start'] = dateStart;
    result['duration'] = duration;
    result['duration_unit'] = durationUnitEnumMapper[durationUnit];
    result['multiplier'] = multiplier;
    result['selected_tick'] = selectedTick;
    result['symbol'] = symbol;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Parameters copyWith({
    double amount,
    double appMarkupPercentage,
    String barrier,
    String barrier2,
    String basis,
    String contractType,
    String currency,
    int dateExpiry,
    int dateStart,
    int duration,
    String durationUnit,
    double multiplier,
    int selectedTick,
    String symbol,
  }) =>
      Parameters(
        amount: amount ?? this.amount,
        appMarkupPercentage: appMarkupPercentage ?? this.appMarkupPercentage,
        barrier: barrier ?? this.barrier,
        barrier2: barrier2 ?? this.barrier2,
        basis: basis ?? this.basis,
        contractType: contractType ?? this.contractType,
        currency: currency ?? this.currency,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        dateStart: dateStart ?? this.dateStart,
        duration: duration ?? this.duration,
        durationUnit: durationUnit ?? this.durationUnit,
        multiplier: multiplier ?? this.multiplier,
        selectedTick: selectedTick ?? this.selectedTick,
        symbol: symbol ?? this.symbol,
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
