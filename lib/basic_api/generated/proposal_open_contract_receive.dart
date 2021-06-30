/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_open_contract_receive.json.
// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Proposal open contract response class.
class ProposalOpenContractResponse extends Response {
  /// Initialize ProposalOpenContractResponse.
  const ProposalOpenContractResponse({
    this.proposalOpenContract,
    this.subscription,
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
  factory ProposalOpenContractResponse.fromJson(Map<String, dynamic> json) =>
      ProposalOpenContractResponse(
        proposalOpenContract:
            json['proposal_open_contract'] as Map<String, dynamic>?,
        subscription: json['subscription'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Latest price and other details for an open contract
  final Map<String, dynamic>? proposalOpenContract;

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'proposal_open_contract': proposalOpenContract,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ProposalOpenContractResponse copyWith({
    Map<String, dynamic>? proposalOpenContract,
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ProposalOpenContractResponse(
        proposalOpenContract: proposalOpenContract ?? this.proposalOpenContract,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
