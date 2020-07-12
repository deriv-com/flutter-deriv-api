/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_open_contract_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// ProposalOpenContractResponse class
class ProposalOpenContractResponse extends Response {
  /// Initialize ProposalOpenContractResponse
  const ProposalOpenContractResponse({
    this.proposalOpenContract,
    this.subscription,
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
  factory ProposalOpenContractResponse.fromJson(Map<String, dynamic> json) =>
      ProposalOpenContractResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        proposalOpenContract:
            json['proposal_open_contract'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
        subscription: json['subscription'] as Map<String, dynamic>,
      );

  /// Latest price and other details for an open contract
  final Map<String, dynamic> proposalOpenContract;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'proposal_open_contract': proposalOpenContract,
        'req_id': reqId,
        'subscription': subscription,
      };

  /// Creates a copy of instance with given parameters
  @override
  ProposalOpenContractResponse copyWith({
    Map<String, dynamic> proposalOpenContract,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ProposalOpenContractResponse(
        proposalOpenContract: proposalOpenContract ?? this.proposalOpenContract,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
