/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/profit_table_send.json
// ignore_for_file: avoid_as, always_specify_types

import '../request.dart';

/// Profit table request class
class ProfitTableRequest extends Request {
  /// Initialize ProfitTableRequest
  const ProfitTableRequest({
    this.dateFrom,
    this.dateTo,
    this.description,
    this.limit,
    this.offset,
    this.profitTable = true,
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
      ProfitTableRequest(
        dateFrom: json['date_from'] as String,
        dateTo: json['date_to'] as String,
        description:
            json['description'] == null ? null : json['description'] == 1,
        limit: json['limit'] as num,
        offset: json['offset'] as num,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        profitTable:
            json['profit_table'] == null ? null : json['profit_table'] == 1,
        reqId: json['req_id'] as int,
        sort: json['sort'] as String,
      );

  /// [Optional] Start date (epoch or YYYY-MM-DD)
  final String dateFrom;

  /// [Optional] End date (epoch or YYYY-MM-DD)
  final String dateTo;

  /// [Optional] If set to 1, will return full contracts description.
  final bool description;

  /// [Optional] Apply upper limit to count of transactions received.
  final num limit;

  /// [Optional] Number of transactions to skip.
  final num offset;

  /// Must be `true`
  final bool profitTable;

  /// [Optional] Sort direction.
  final String sort;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'date_from': dateFrom,
        'date_to': dateTo,
        'description': description == null ? null : description ? 1 : 0,
        'limit': limit,
        'offset': offset,
        'passthrough': passthrough,
        'profit_table': profitTable == null ? null : profitTable ? 1 : 0,
        'req_id': reqId,
        'sort': sort,
      };

  /// Creates a copy of instance with given parameters
  @override
  ProfitTableRequest copyWith({
    String dateFrom,
    String dateTo,
    bool description,
    num limit,
    num offset,
    bool profitTable,
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
