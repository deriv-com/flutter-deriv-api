/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Contract update receive class
class ContractUpdateReceive extends Response {
  /// Initialize ContractUpdateReceive
  const ContractUpdateReceive({
    this.contractUpdate,
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
  factory ContractUpdateReceive.fromJson(Map<String, dynamic> json) =>
      ContractUpdateReceive(
        contractUpdate: json['contract_update'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Contains the update status of the request
  final Map<String, dynamic> contractUpdate;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_update': contractUpdate,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateReceive copyWith({
    Map<String, dynamic> contractUpdate,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ContractUpdateReceive(
        contractUpdate: contractUpdate ?? this.contractUpdate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
