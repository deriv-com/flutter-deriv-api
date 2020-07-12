/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_history_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// ContractUpdateHistoryRequest class
class ContractUpdateHistoryRequest extends Request {
  /// Initialize ContractUpdateHistoryRequest
  const ContractUpdateHistoryRequest({
    @required this.contractId,
    this.contractUpdateHistory = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'contract_update_history',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ContractUpdateHistoryRequest.fromJson(Map<String, dynamic> json) =>
      ContractUpdateHistoryRequest(
        // ignore: avoid_as
        contractId: json['contract_id'] as int,
        // ignore: avoid_as
        contractUpdateHistory: json['contract_update_history'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Internal unique contract identifier.
  final int contractId;

  /// Must be `1`
  final int contractUpdateHistory;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_id': contractId,
        'contract_update_history': contractUpdateHistory,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateHistoryRequest copyWith({
    int contractId,
    int contractUpdateHistory,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ContractUpdateHistoryRequest(
        contractId: contractId ?? this.contractId,
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
