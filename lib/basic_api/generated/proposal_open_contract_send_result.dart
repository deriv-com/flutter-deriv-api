/// Proposal open contract send model class
abstract class ProposalOpenContractSendModel {
  /// Initializes
  ProposalOpenContractSendModel({
    @required this.proposalOpenContract,
    this.contractId,
    this.subscribe,
  });

  /// Must be `1`
  final int proposalOpenContract;

  /// [Optional] Contract ID received from a `portfolio` request. If not set, you will receive stream of all open contracts.
  final int contractId;

  /// [Optional] `1` to stream.
  final int subscribe;
}

/// Proposal open contract send class
class ProposalOpenContractSend extends ProposalOpenContractSendModel {
  /// Initializes
  ProposalOpenContractSend({
    @required int proposalOpenContract,
    int contractId,
    int subscribe,
  }) : super(
          proposalOpenContract: proposalOpenContract,
          contractId: contractId,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory ProposalOpenContractSend.fromJson(Map<String, dynamic> json) =>
      ProposalOpenContractSend(
        proposalOpenContract: json['proposal_open_contract'],
        contractId: json['contract_id'],
        subscribe: json['subscribe'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['proposal_open_contract'] = proposalOpenContract;
    result['contract_id'] = contractId;
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ProposalOpenContractSend copyWith({
    int proposalOpenContract,
    int contractId,
    int subscribe,
  }) =>
      ProposalOpenContractSend(
        proposalOpenContract: proposalOpenContract ?? this.proposalOpenContract,
        contractId: contractId ?? this.contractId,
        subscribe: subscribe ?? this.subscribe,
      );
}
