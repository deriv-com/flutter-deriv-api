/// generated automatically from flutter_deriv_api|lib/basic_api/generated/statement_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'statement_send.g.dart';

/// JSON conversion for 'statement_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
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
      _$StatementRequestFromJson(json);

  // Properties
  /// [Optional] To filter the statement according to the type of transaction.
  final String actionType;

  /// [Optional] Start date (epoch)
  final int dateFrom;

  /// [Optional] End date (epoch)
  final int dateTo;

  /// [Optional] If set to 1, will return full contracts description.
  final int description;

  /// [Optional] Maximum number of transactions to receive.
  final num limit;

  /// [Optional] Number of transactions to skip.
  final num offset;

  /// Must be `1`
  final int statement;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$StatementRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  StatementRequest copyWith({
    String actionType,
    int dateFrom,
    int dateTo,
    int description,
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
