/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_open_contract_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'proposal_open_contract_send.g.dart';

/// JSON conversion for 'proposal_open_contract_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
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
      _$ProposalOpenContractRequestFromJson(json);

  /// [Optional] Contract ID received from a `portfolio` request. If not set, you will receive stream of all open contracts.
  final int contractId;

  /// Must be `1`
  final int proposalOpenContract;

  /// [Optional] `1` to stream.
  final int subscribe;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalOpenContractRequestToJson(this);

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
