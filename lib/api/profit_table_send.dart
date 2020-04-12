/// generated automatically from flutter_deriv_api|lib/api/profit_table_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

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
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
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

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProfitTableRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ProfitTableRequest copyWith({
    String dateFrom,
    String dateTo,
    int description,
    num limit,
    num offset,
    int profitTable,
    String sort,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      ProfitTableRequest(
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        description: description ?? this.description,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        profitTable: profitTable ?? this.profitTable,
        sort: sort ?? this.sort,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
