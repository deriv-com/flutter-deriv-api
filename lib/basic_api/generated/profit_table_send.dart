/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/profit_table_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Profit table request class.
class ProfitTableRequest extends Request {
  /// Initialize ProfitTableRequest.
  const ProfitTableRequest({
    required this.contractType,
    this.dateFrom,
    this.dateTo,
    this.description,
    this.limit,
    this.loginid,
    this.offset,
    this.profitTable = true,
    this.sort,
    super.msgType = 'profit_table',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ProfitTableRequest.fromJson(Map<String, dynamic> json) =>
      ProfitTableRequest(
        contractType: (json['contract_type'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        dateFrom: json['date_from'] as String?,
        dateTo: json['date_to'] as String?,
        description:
            json['description'] == null ? null : json['description'] == 1,
        limit: json['limit'] as num?,
        loginid: json['loginid'] as String?,
        offset: json['offset'] as int?,
        profitTable:
            json['profit_table'] == null ? null : json['profit_table'] == 1,
        sort: json['sort'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Return only contracts of the specified types
  final List<String>? contractType;

  /// [Optional] Start date (epoch or YYYY-MM-DD)
  final String? dateFrom;

  /// [Optional] End date (epoch or YYYY-MM-DD)
  final String? dateTo;

  /// [Optional] If set to `true`, will return full contracts description.
  final bool? description;

  /// [Optional] Apply upper limit to count of transactions received.
  final num? limit;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] Number of transactions to skip.
  final int? offset;

  /// Must be `true`
  final bool? profitTable;

  /// [Optional] Sort direction.
  final String? sort;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_type': contractType,
        'date_from': dateFrom,
        'date_to': dateTo,
        'description': description == null
            ? null
            : description!
                ? 1
                : 0,
        'limit': limit,
        'loginid': loginid,
        'offset': offset,
        'profit_table': profitTable == null
            ? null
            : profitTable!
                ? 1
                : 0,
        'sort': sort,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ProfitTableRequest copyWith({
    List<String>? contractType,
    String? dateFrom,
    String? dateTo,
    bool? description,
    num? limit,
    String? loginid,
    int? offset,
    bool? profitTable,
    String? sort,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ProfitTableRequest(
        contractType: contractType ?? this.contractType,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        description: description ?? this.description,
        limit: limit ?? this.limit,
        loginid: loginid ?? this.loginid,
        offset: offset ?? this.offset,
        profitTable: profitTable ?? this.profitTable,
        sort: sort ?? this.sort,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
