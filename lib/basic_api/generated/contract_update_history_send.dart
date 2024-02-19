/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_history_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Contract update history request class.
class ContractUpdateHistoryRequest extends Request {
  /// Initialize ContractUpdateHistoryRequest.
  const ContractUpdateHistoryRequest({
    required this.contractId,
    this.contractUpdateHistory = true,
    this.limit,
    this.loginid,
    super.msgType = 'contract_update_history',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ContractUpdateHistoryRequest.fromJson(Map<String, dynamic> json) =>
      ContractUpdateHistoryRequest(
        contractId: json['contract_id'] as int?,
        contractUpdateHistory: json['contract_update_history'] == null
            ? null
            : json['contract_update_history'] == 1,
        limit: json['limit'] as num?,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Internal unique contract identifier.
  final int? contractId;

  /// Must be `true`
  final bool? contractUpdateHistory;

  /// [Optional] Maximum number of historical updates to receive.
  final num? limit;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_id': contractId,
        'contract_update_history': contractUpdateHistory == null
            ? null
            : contractUpdateHistory!
                ? 1
                : 0,
        'limit': limit,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateHistoryRequest copyWith({
    int? contractId,
    bool? contractUpdateHistory,
    num? limit,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ContractUpdateHistoryRequest(
        contractId: contractId ?? this.contractId,
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
        limit: limit ?? this.limit,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
