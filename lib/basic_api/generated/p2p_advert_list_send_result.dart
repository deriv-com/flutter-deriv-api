/// P2p advert list send model class
abstract class P2pAdvertListSendModel {
  /// Initializes
  P2pAdvertListSendModel({
    @required this.p2pAdvertList,
    this.advertiserId,
    this.amount,
    this.counterpartyType,
    this.limit,
    this.localCurrency,
    this.offset,
    this.useClientLimits,
  });

  /// Must be 1
  final int p2pAdvertList;

  /// [Optional] Which advertiser to list adverts for.
  final String advertiserId;

  /// [Optional] How much to buy or sell, used to calculate prices.
  final double amount;

  /// [Optional] Filter the adverts by `counterparty_type`.
  final CounterpartyTypeEnum counterpartyType;

  /// [Optional] Used for paging.
  final int limit;

  /// [Optional] Currency to conduct payment transaction in, defaults to the main currency for the client's country.
  final String localCurrency;

  /// [Optional] Used for paging.
  final int offset;

  /// [Optional] If set to `true`, ads that exceed this account's balance or turnover limits will not be shown.
  final bool useClientLimits;
}

/// P2p advert list send class
class P2pAdvertListSend extends P2pAdvertListSendModel {
  /// Initializes
  P2pAdvertListSend({
    @required int p2pAdvertList,
    String advertiserId,
    double amount,
    String counterpartyType,
    int limit,
    String localCurrency,
    int offset,
    bool useClientLimits,
  }) : super(
          p2pAdvertList: p2pAdvertList,
          advertiserId: advertiserId,
          amount: amount,
          counterpartyType: counterpartyType,
          limit: limit,
          localCurrency: localCurrency,
          offset: offset,
          useClientLimits: useClientLimits,
        );

  /// Creates an instance from JSON
  factory P2pAdvertListSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertListSend(
        p2pAdvertList: json['p2p_advert_list'],
        advertiserId: json['advertiser_id'],
        amount: getDouble(json['amount']),
        counterpartyType: json['counterparty_type'] == null
            ? null
            : counterpartyTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['counterparty_type'],
                    orElse: () => null)
                ?.key,
        limit: json['limit'],
        localCurrency: json['local_currency'],
        offset: json['offset'],
        useClientLimits: getBool(json['use_client_limits']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_advert_list'] = p2pAdvertList;
    result['advertiser_id'] = advertiserId;
    result['amount'] = amount;
    result['counterparty_type'] = counterpartyTypeEnumMapper[counterpartyType];
    result['limit'] = limit;
    result['local_currency'] = localCurrency;
    result['offset'] = offset;
    result['use_client_limits'] = useClientLimits;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertListSend copyWith({
    int p2pAdvertList,
    String advertiserId,
    double amount,
    String counterpartyType,
    int limit,
    String localCurrency,
    int offset,
    bool useClientLimits,
  }) =>
      P2pAdvertListSend(
        p2pAdvertList: p2pAdvertList ?? this.p2pAdvertList,
        advertiserId: advertiserId ?? this.advertiserId,
        amount: amount ?? this.amount,
        counterpartyType: counterpartyType ?? this.counterpartyType,
        limit: limit ?? this.limit,
        localCurrency: localCurrency ?? this.localCurrency,
        offset: offset ?? this.offset,
        useClientLimits: useClientLimits ?? this.useClientLimits,
      );
  // Creating Enum Mappers

  static final Map<CounterpartyTypeEnum, String> counterpartyTypeEnumMapper = {
    CounterpartyTypeEnum.buy: 'buy',
    CounterpartyTypeEnum.sell: 'sell',
  };
}

// Creating Enums

enum CounterpartyTypeEnum {
  buy,
  sell,
}
