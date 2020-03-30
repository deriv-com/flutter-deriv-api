/// Autogenerated from flutter_deriv_api|lib/api/profit_table_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'profit_table_send.g.dart';

/// JSON conversion for 'profit_table_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class ProfitTableRequest extends Request {
  /// Initialize ProfitTableRequest
  ProfitTableRequest(
      {this.dateFrom,
      this.dateTo,
      this.description,
      this.limit,
      this.offset,
      this.profitTable = 1,
      this.sort,
      Map<String, dynamic> passthrough,
      int reqId})
      : super(passthrough: passthrough, reqId: reqId);

  /// Creates instance from JSON
  factory ProfitTableRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfitTableRequestFromJson(json);

  // Properties
  /// [Optional] Start date (epoch or YYYY-MM-DD)
  String dateFrom;

  /// [Optional] End date (epoch or YYYY-MM-DD)
  String dateTo;

  /// [Optional] If set to 1, will return full contracts description.
  int description;

  /// [Optional] Apply upper limit to count of transactions received.
  num limit;

  /// [Optional] Number of transactions to skip.
  num offset;

  /// Must be `1`
  int profitTable;

  /// [Optional] Sort direction.
  String sort;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProfitTableRequestToJson(this);
}
