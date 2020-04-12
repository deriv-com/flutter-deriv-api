/// generated automatically from flutter_deriv_api|lib/api/proposal_open_contract_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'proposal_open_contract_send.g.dart';

/// JSON conversion for 'proposal_open_contract_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ProposalOpenContractRequest extends Request {
  /// Initialize ProposalOpenContractRequest
  ProposalOpenContractRequest({
    this.contractId,
    this.proposalOpenContract = 1,
    this.subscribe,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory ProposalOpenContractRequest.fromJson(Map<String, dynamic> json) =>
      _$ProposalOpenContractRequestFromJson(json);

  // Properties
  /// [Optional] Contract ID received from a `portfolio` request. If not set, you will receive stream of all open contracts.
  final int contractId;

  /// Must be `1`
  final int proposalOpenContract;

  /// [Optional] `1` to stream.
  final int subscribe;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalOpenContractRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ProposalOpenContractRequest copyWith({
    int contractId,
    int proposalOpenContract,
    int subscribe,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      ProposalOpenContractRequest(
        contractId: contractId ?? this.contractId,
        proposalOpenContract: proposalOpenContract ?? this.proposalOpenContract,
        subscribe: subscribe ?? this.subscribe,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
