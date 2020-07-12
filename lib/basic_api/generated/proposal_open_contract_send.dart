/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_open_contract_send.json

import '../request.dart';

/// ProposalOpenContractRequest class
class ProposalOpenContractRequest extends Request {
  /// Initialize ProposalOpenContractRequest
  const ProposalOpenContractRequest({
    this.contractId,
    this.proposalOpenContract = 1,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'proposal_open_contract',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ProposalOpenContractRequest.fromJson(Map<String, dynamic> json) =>
      ProposalOpenContractRequest(
        // ignore: avoid_as
        contractId: json['contract_id'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        proposalOpenContract: json['proposal_open_contract'] as int,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        subscribe: json['subscribe'] as int,
      );

  /// [Optional] Contract ID received from a `portfolio` request. If not set, you will receive stream of all open contracts.
  final int contractId;

  /// Must be `1`
  final int proposalOpenContract;

  /// [Optional] `1` to stream.
  final int subscribe;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_id': contractId,
        'passthrough': passthrough,
        'proposal_open_contract': proposalOpenContract,
        'req_id': reqId,
        'subscribe': subscribe,
      };

  /// Creates a copy of instance with given parameters
  @override
  ProposalOpenContractRequest copyWith({
    int contractId,
    int proposalOpenContract,
    int subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ProposalOpenContractRequest(
        contractId: contractId ?? this.contractId,
        proposalOpenContract: proposalOpenContract ?? this.proposalOpenContract,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[contractId];
}
