/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_open_contract_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Proposal open contract receive class.
class ProposalOpenContractReceive extends Response {
  /// Initialize ProposalOpenContractReceive.
  const ProposalOpenContractReceive({
    this.proposalOpenContract,
    this.subscription,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ProposalOpenContractReceive.fromJson(Map<String, dynamic> json) =>
      ProposalOpenContractReceive(
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
  ProposalOpenContractReceive copyWith({
    Map<String, dynamic>? proposalOpenContract,
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ProposalOpenContractReceive(
        proposalOpenContract: proposalOpenContract ?? this.proposalOpenContract,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
