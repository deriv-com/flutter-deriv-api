/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/statement_send.json

import '../request.dart';

/// StatementRequest class
class StatementRequest extends Request {
  /// Initialize StatementRequest
  const StatementRequest({
    this.actionType,
    this.dateFrom,
    this.dateTo,
    this.description,
    this.limit,
    this.offset,
    this.statement = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'statement',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory StatementRequest.fromJson(Map<String, dynamic> json) =>
      StatementRequest(
        // ignore: avoid_as
        actionType: json['action_type'] as String,
        // ignore: avoid_as
        dateFrom: json['date_from'] as int,
        // ignore: avoid_as
        dateTo: json['date_to'] as int,
        description:
            json['description'] == null ? null : json['description'] == 1,
        // ignore: avoid_as
        limit: json['limit'] as num,
        // ignore: avoid_as
        offset: json['offset'] as num,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        statement: json['statement'] as int,
      );

  /// [Optional] To filter the statement according to the type of transaction.
  final String actionType;

  /// [Optional] Start date (epoch)
  final int dateFrom;

  /// [Optional] End date (epoch)
  final int dateTo;

  /// [Optional] If set to 1, will return full contracts description.
  final bool description;

  /// [Optional] Maximum number of transactions to receive.
  final num limit;

  /// [Optional] Number of transactions to skip.
  final num offset;

  /// Must be `1`
  final int statement;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'action_type': actionType,
        'date_from': dateFrom,
        'date_to': dateTo,
        'description': description == null ? null : description ? 1 : 0,
        'limit': limit,
        'offset': offset,
        'passthrough': passthrough,
        'req_id': reqId,
        'statement': statement,
      };

  /// Creates a copy of instance with given parameters
  @override
  StatementRequest copyWith({
    String actionType,
    int dateFrom,
    int dateTo,
    bool description,
    num limit,
    num offset,
    int statement,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      StatementRequest(
        actionType: actionType ?? this.actionType,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        description: description ?? this.description,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        statement: statement ?? this.statement,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
