/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_receive.json

import '../response.dart';

/// ContractUpdateResponse class
class ContractUpdateResponse extends Response {
  /// Initialize ContractUpdateResponse
  const ContractUpdateResponse({
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
  factory ContractUpdateResponse.fromJson(Map<String, dynamic> json) =>
      ContractUpdateResponse(
        // ignore: avoid_as
        contractUpdate: json['contract_update'] as Map<String, dynamic>,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Contains the update status of the request
  final Map<String, dynamic> contractUpdate;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_update': contractUpdate,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateResponse copyWith({
    Map<String, dynamic> contractUpdate,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ContractUpdateResponse(
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
