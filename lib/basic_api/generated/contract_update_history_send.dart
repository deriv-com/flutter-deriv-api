/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_history_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Contract update history request class
class ContractUpdateHistoryRequest extends Request {
  /// Initialize ContractUpdateHistoryRequest
  const ContractUpdateHistoryRequest({
    required this.contractId,
    this.contractUpdateHistory = true,
    this.limit,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'contract_update_history',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ContractUpdateHistoryRequest.fromJson(Map<String, dynamic> json) =>
      ContractUpdateHistoryRequest(
        contractId: json['contract_id'] as int?,
        contractUpdateHistory: json['contract_update_history'] == null
            ? null
            : json['contract_update_history'] == 1,
        limit: json['limit'] as num?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Internal unique contract identifier.
  final int? contractId;

  /// Must be `true`
  final bool? contractUpdateHistory;

  /// [Optional] Maximum number of historical updates to receive.
  final num? limit;

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
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateHistoryRequest copyWith({
    int? contractId,
    bool? contractUpdateHistory,
    num? limit,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ContractUpdateHistoryRequest(
        contractId: contractId ?? this.contractId,
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
        limit: limit ?? this.limit,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
