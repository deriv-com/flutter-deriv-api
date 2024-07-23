/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/statement_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Statement request class.
class StatementRequest extends Request {
  /// Initialize StatementRequest.
  const StatementRequest({
    this.actionType,
    this.dateFrom,
    this.dateTo,
    this.description,
    this.limit,
    this.loginid,
    this.offset,
    this.statement = true,
    super.msgType = 'statement',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory StatementRequest.fromJson(Map<String, dynamic> json) =>
      StatementRequest(
        actionType: json['action_type'] as String?,
        dateFrom: json['date_from'] as int?,
        dateTo: json['date_to'] as int?,
        description:
            json['description'] == null ? null : json['description'] == 1,
        limit: json['limit'] as num?,
        loginid: json['loginid'] as String?,
        offset: json['offset'] as int?,
        statement: json['statement'] == null ? null : json['statement'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] To filter the statement according to the type of transaction.
  final String? actionType;

  /// [Optional] Start date (epoch)
  final int? dateFrom;

  /// [Optional] End date (epoch)
  final int? dateTo;

  /// [Optional] If set to `true`, will return full contracts description.
  final bool? description;

  /// [Optional] Maximum number of transactions to receive.
  final num? limit;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] Number of transactions to skip.
  final int? offset;

  /// Must be `true`
  final bool? statement;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'action_type': actionType,
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
        'statement': statement == null
            ? null
            : statement!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  StatementRequest copyWith({
    String? actionType,
    int? dateFrom,
    int? dateTo,
    bool? description,
    num? limit,
    String? loginid,
    int? offset,
    bool? statement,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      StatementRequest(
        actionType: actionType ?? this.actionType,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        description: description ?? this.description,
        limit: limit ?? this.limit,
        loginid: loginid ?? this.loginid,
        offset: offset ?? this.offset,
        statement: statement ?? this.statement,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
