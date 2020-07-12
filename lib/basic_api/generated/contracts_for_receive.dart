/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contracts_for_receive.json

import '../response.dart';

/// ContractsForResponse class
class ContractsForResponse extends Response {
  /// Initialize ContractsForResponse
  const ContractsForResponse({
    this.contractsFor,
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
  factory ContractsForResponse.fromJson(Map<String, dynamic> json) =>
      ContractsForResponse(
        // ignore: avoid_as
        contractsFor: json['contracts_for'] as Map<String, dynamic>,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// List of available contracts. Note: if the user is authenticated, then only contracts allowed under his account will be returned.
  final Map<String, dynamic> contractsFor;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contracts_for': contractsFor,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractsForResponse copyWith({
    Map<String, dynamic> contractsFor,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ContractsForResponse(
        contractsFor: contractsFor ?? this.contractsFor,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
