/// generated automatically from flutter_deriv_api|lib/basic_api/generated/profit_table_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'profit_table_send.g.dart';

/// JSON conversion for 'profit_table_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ProfitTableRequest extends Request {
  /// Initialize ProfitTableRequest
  const ProfitTableRequest({
    this.dateFrom,
    this.dateTo,
    this.description,
    this.limit,
    this.offset,
    this.profitTable = 1,
    this.sort,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'profit_table',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ProfitTableRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfitTableRequestFromJson(json);

  // Properties
  /// [Optional] Start date (epoch or YYYY-MM-DD)
  final String dateFrom;

  /// [Optional] End date (epoch or YYYY-MM-DD)
  final String dateTo;

  /// [Optional] If set to 1, will return full contracts description.
  final int description;

  /// [Optional] Apply upper limit to count of transactions received.
  final num limit;

  /// [Optional] Number of transactions to skip.
  final num offset;

  /// Must be `1`
  final int profitTable;

  /// [Optional] Sort direction.
  final String sort;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ProfitTableRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ProfitTableRequest copyWith({
    String dateFrom,
    String dateTo,
    int description,
    num limit,
    num offset,
    int profitTable,
    String sort,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ProfitTableRequest(
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        description: description ?? this.description,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        profitTable: profitTable ?? this.profitTable,
        sort: sort ?? this.sort,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
