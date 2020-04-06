/// Autogenerated from flutter_deriv_api|lib/api/proposal_open_contract_send.json
import 'dart:async';
import 'dart:convert';
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
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'proposal_open_contract',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory ProposalOpenContractRequest.fromJson(Map<String, dynamic> json) =>
      _$ProposalOpenContractRequestFromJson(json);

  // Properties
  /// [Optional] Contract ID received from a Portfolio request. If not set, you will receive stream of all open contracts.
  int contractId;

  /// Must be `1`
  int proposalOpenContract;

  /// [Optional] `1` to stream.
  int subscribe;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalOpenContractRequestToJson(this);
}
