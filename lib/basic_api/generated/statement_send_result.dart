/// Statement send model class
abstract class StatementSendModel {
  /// Initializes
  StatementSendModel({
    @required this.statement,
    this.actionType,
    this.dateFrom,
    this.dateTo,
    this.description,
    this.limit,
    this.offset,
  });

  /// Must be `1`
  final int statement;

  /// [Optional] To filter the statement according to the type of transaction.
  final ActionTypeEnum actionType;

  /// [Optional] Start date (epoch)
  final int dateFrom;

  /// [Optional] End date (epoch)
  final int dateTo;

  /// [Optional] If set to `true`, will return full contracts description.
  final bool description;

  /// [Optional] Maximum number of transactions to receive.
  final double limit;

  /// [Optional] Number of transactions to skip.
  final double offset;
}

/// Statement send class
class StatementSend extends StatementSendModel {
  /// Initializes
  StatementSend({
    @required int statement,
    String actionType,
    int dateFrom,
    int dateTo,
    bool description,
    double limit,
    double offset,
  }) : super(
          statement: statement,
          actionType: actionType,
          dateFrom: dateFrom,
          dateTo: dateTo,
          description: description,
          limit: limit,
          offset: offset,
        );

  /// Creates an instance from JSON
  factory StatementSend.fromJson(Map<String, dynamic> json) => StatementSend(
        statement: json['statement'],
        actionType: json['action_type'] == null
            ? null
            : actionTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['action_type'],
                    orElse: () => null)
                ?.key,
        dateFrom: json['date_from'],
        dateTo: json['date_to'],
        description: getBool(json['description']),
        limit: getDouble(json['limit']),
        offset: getDouble(json['offset']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['statement'] = statement;
    result['action_type'] = actionTypeEnumMapper[actionType];
    result['date_from'] = dateFrom;
    result['date_to'] = dateTo;
    result['description'] = description;
    result['limit'] = limit;
    result['offset'] = offset;

    return result;
  }

  /// Creates a copy of instance with given parameters
  StatementSend copyWith({
    int statement,
    String actionType,
    int dateFrom,
    int dateTo,
    bool description,
    double limit,
    double offset,
  }) =>
      StatementSend(
        statement: statement ?? this.statement,
        actionType: actionType ?? this.actionType,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        description: description ?? this.description,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
      );
  // Creating Enum Mappers

  static final Map<ActionTypeEnum, String> actionTypeEnumMapper = {
    ActionTypeEnum.buy: 'buy',
    ActionTypeEnum.sell: 'sell',
    ActionTypeEnum.deposit: 'deposit',
    ActionTypeEnum.withdrawal: 'withdrawal',
    ActionTypeEnum.escrow: 'escrow',
    ActionTypeEnum.adjustment: 'adjustment',
    ActionTypeEnum.virtual_credit: 'virtual_credit',
  };
}

// Creating Enums

enum ActionTypeEnum {
  buy,
  sell,
  deposit,
  withdrawal,
  escrow,
  adjustment,
  virtual_credit,
}
