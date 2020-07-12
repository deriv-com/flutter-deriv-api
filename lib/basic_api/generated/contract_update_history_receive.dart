/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_history_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// ContractUpdateHistoryResponse class
class ContractUpdateHistoryResponse extends Response {
  /// Initialize ContractUpdateHistoryResponse
  const ContractUpdateHistoryResponse({
    this.contractUpdateHistory,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ContractUpdateHistoryResponse.fromJson(Map<String, dynamic> json) =>
      ContractUpdateHistoryResponse(
        contractUpdateHistory: (json['contract_update_history'] as List)
            ?.map((dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Contains the historical and the most recent update status of the contract
  final List<Map<String, dynamic>> contractUpdateHistory;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_update_history': contractUpdateHistory,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateHistoryResponse copyWith({
    List<Map<String, dynamic>> contractUpdateHistory,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ContractUpdateHistoryResponse(
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
