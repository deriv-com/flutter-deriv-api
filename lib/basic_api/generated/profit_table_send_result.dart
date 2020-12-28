/// Profit table send model class
abstract class ProfitTableSendModel {
  /// Initializes
  ProfitTableSendModel({
    @required this.profitTable,
    @required this.contractType,
    this.dateFrom,
    this.dateTo,
    this.description,
    this.limit,
    this.offset,
    this.sort,
  });

  /// Must be `1`
  final int profitTable;

  /// Return only contracts of the specified types
  final List<ContractTypeEnum> contractType;

  /// [Optional] Start date (epoch or YYYY-MM-DD)
  final String dateFrom;

  /// [Optional] End date (epoch or YYYY-MM-DD)
  final String dateTo;

  /// [Optional] If set to `true`, will return full contracts description.
  final bool description;

  /// [Optional] Apply upper limit to count of transactions received.
  final double limit;

  /// [Optional] Number of transactions to skip.
  final double offset;

  /// [Optional] Sort direction.
  final SortEnum sort;
}

/// Profit table send class
class ProfitTableSend extends ProfitTableSendModel {
  /// Initializes
  ProfitTableSend({
    @required int profitTable,
    @required List<ContractTypeEnum> contractType,
    String dateFrom,
    String dateTo,
    bool description,
    double limit,
    double offset,
    String sort,
  }) : super(
          profitTable: profitTable,
          contractType: contractType,
          dateFrom: dateFrom,
          dateTo: dateTo,
          description: description,
          limit: limit,
          offset: offset,
          sort: sort,
        );

  /// Creates an instance from JSON
  factory ProfitTableSend.fromJson(Map<String, dynamic> json) =>
      ProfitTableSend(
        profitTable: json['profit_table'],
        contractType: List<ContractTypeEnum>.from(json['contract_type'].map(
            (x) => contractTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == x, orElse: () => null)
                ?.key)),
        dateFrom: json['date_from'],
        dateTo: json['date_to'],
        description: getBool(json['description']),
        limit: getDouble(json['limit']),
        offset: getDouble(json['offset']),
        sort: json['sort'] == null
            ? null
            : sortEnumMapper.entries
                .firstWhere((entry) => entry.value == json['sort'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['profit_table'] = profitTable;
    if (contractType != null) {
      result['contract_type'] =
          contractType.map((item) => contractTypeEnumMapper[item]).toList();
    }
    result['date_from'] = dateFrom;
    result['date_to'] = dateTo;
    result['description'] = description;
    result['limit'] = limit;
    result['offset'] = offset;
    result['sort'] = sortEnumMapper[sort];

    return result;
  }

  /// Creates a copy of instance with given parameters
  ProfitTableSend copyWith({
    int profitTable,
    List<ContractTypeEnum> contractType,
    String dateFrom,
    String dateTo,
    bool description,
    double limit,
    double offset,
    String sort,
  }) =>
      ProfitTableSend(
        profitTable: profitTable ?? this.profitTable,
        contractType: contractType ?? this.contractType,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        description: description ?? this.description,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        sort: sort ?? this.sort,
      );
  // Creating Enum Mappers

  static final Map<ContractTypeEnum, String> contractTypeEnumMapper = {
    ContractTypeEnum.ASIAND: 'ASIAND',
    ContractTypeEnum.ASIANU: 'ASIANU',
    ContractTypeEnum.CALL: 'CALL',
    ContractTypeEnum.CALLE: 'CALLE',
    ContractTypeEnum.CALLSPREAD: 'CALLSPREAD',
    ContractTypeEnum.DIGITDIFF: 'DIGITDIFF',
    ContractTypeEnum.DIGITEVEN: 'DIGITEVEN',
    ContractTypeEnum.DIGITMATCH: 'DIGITMATCH',
    ContractTypeEnum.DIGITODD: 'DIGITODD',
    ContractTypeEnum.DIGITOVER: 'DIGITOVER',
    ContractTypeEnum.DIGITUNDER: 'DIGITUNDER',
    ContractTypeEnum.EXPIRYMISSE: 'EXPIRYMISSE',
    ContractTypeEnum.EXPIRYMISS: 'EXPIRYMISS',
    ContractTypeEnum.EXPIRYRANGE: 'EXPIRYRANGE',
    ContractTypeEnum.EXPIRYRANGEE: 'EXPIRYRANGEE',
    ContractTypeEnum.LBFLOATCALL: 'LBFLOATCALL',
    ContractTypeEnum.LBFLOATPUT: 'LBFLOATPUT',
    ContractTypeEnum.LBHIGHLOW: 'LBHIGHLOW',
    ContractTypeEnum.MULTDOWN: 'MULTDOWN',
    ContractTypeEnum.MULTUP: 'MULTUP',
    ContractTypeEnum.NOTOUCH: 'NOTOUCH',
    ContractTypeEnum.ONETOUCH: 'ONETOUCH',
    ContractTypeEnum.PUT: 'PUT',
    ContractTypeEnum.PUTE: 'PUTE',
    ContractTypeEnum.PUTSPREAD: 'PUTSPREAD',
    ContractTypeEnum.RANGE: 'RANGE',
    ContractTypeEnum.RESETCALL: 'RESETCALL',
    ContractTypeEnum.RESETPUT: 'RESETPUT',
    ContractTypeEnum.RUNHIGH: 'RUNHIGH',
    ContractTypeEnum.RUNLOW: 'RUNLOW',
    ContractTypeEnum.TICKHIGH: 'TICKHIGH',
    ContractTypeEnum.TICKLOW: 'TICKLOW',
    ContractTypeEnum.UPORDOWN: 'UPORDOWN',
  };

  static final Map<SortEnum, String> sortEnumMapper = {
    SortEnum.ASC: 'ASC',
    SortEnum.DESC: 'DESC',
  };
}

// Creating Enums

enum ContractTypeEnum {
  ASIAND,
  ASIANU,
  CALL,
  CALLE,
  CALLSPREAD,
  DIGITDIFF,
  DIGITEVEN,
  DIGITMATCH,
  DIGITODD,
  DIGITOVER,
  DIGITUNDER,
  EXPIRYMISSE,
  EXPIRYMISS,
  EXPIRYRANGE,
  EXPIRYRANGEE,
  LBFLOATCALL,
  LBFLOATPUT,
  LBHIGHLOW,
  MULTDOWN,
  MULTUP,
  NOTOUCH,
  ONETOUCH,
  PUT,
  PUTE,
  PUTSPREAD,
  RANGE,
  RESETCALL,
  RESETPUT,
  RUNHIGH,
  RUNLOW,
  TICKHIGH,
  TICKLOW,
  UPORDOWN,
}

enum SortEnum {
  ASC,
  DESC,
}
