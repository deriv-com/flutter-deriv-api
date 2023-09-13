/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_history_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Contract update history receive class.
class ContractUpdateHistoryReceive extends Response {
  /// Initialize ContractUpdateHistoryReceive.
  const ContractUpdateHistoryReceive({
    this.contractUpdateHistory,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ContractUpdateHistoryReceive.fromJson(Map<String, dynamic> json) =>
      ContractUpdateHistoryReceive(
        contractUpdateHistory:
            (json['contract_update_history'] as List<dynamic>?)
                ?.map<Map<String, dynamic>>(
                    (dynamic item) => item as Map<String, dynamic>)
                .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Contains the historical and the most recent update status of the contract
  final List<Map<String, dynamic>>? contractUpdateHistory;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_update_history': contractUpdateHistory,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateHistoryReceive copyWith({
    List<Map<String, dynamic>>? contractUpdateHistory,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ContractUpdateHistoryReceive(
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
