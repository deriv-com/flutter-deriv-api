/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contracts_for_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Contracts for receive class.
class ContractsForReceive extends Response {
  /// Initialize ContractsForReceive.
  const ContractsForReceive({
    this.contractsFor,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory ContractsForReceive.fromJson(Map<String, dynamic> json) =>
      ContractsForReceive(
        contractsFor: json['contracts_for'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of available contracts. Note: if the user is authenticated, then only contracts allowed under his account will be returned.
  final Map<String, dynamic>? contractsFor;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contracts_for': contractsFor,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractsForReceive copyWith({
    Map<String, dynamic>? contractsFor,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ContractsForReceive(
        contractsFor: contractsFor ?? this.contractsFor,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
