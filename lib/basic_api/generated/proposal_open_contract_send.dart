/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_open_contract_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Proposal open contract request class.
class ProposalOpenContractRequest extends Request {
  /// Initialize ProposalOpenContractRequest.
  const ProposalOpenContractRequest({
    this.contractId,
    this.proposalOpenContract = true,
    this.subscribe,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'proposal_open_contract',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory ProposalOpenContractRequest.fromJson(Map<String, dynamic> json) =>
      ProposalOpenContractRequest(
        contractId: json['contract_id'] as int?,
        proposalOpenContract: json['proposal_open_contract'] == null
            ? null
            : json['proposal_open_contract'] == 1,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Contract ID received from a `portfolio` request. If not set, you will receive stream of all open contracts.
  final int? contractId;

  /// Must be `true`
  final bool? proposalOpenContract;

  /// [Optional] `true` to stream.
  final bool? subscribe;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_id': contractId,
        'proposal_open_contract': proposalOpenContract == null
            ? null
            : proposalOpenContract!
                ? 1
                : 0,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ProposalOpenContractRequest copyWith({
    int? contractId,
    bool? proposalOpenContract,
    bool? subscribe,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ProposalOpenContractRequest(
        contractId: contractId ?? this.contractId,
        proposalOpenContract: proposalOpenContract ?? this.proposalOpenContract,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[contractId];
}
