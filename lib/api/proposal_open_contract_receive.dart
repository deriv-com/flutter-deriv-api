/// Autogenerated from flutter_deriv_api|lib/api/proposal_open_contract_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'proposal_open_contract_receive.g.dart';

/// JSON conversion for 'proposal_open_contract_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ProposalOpenContractResponse extends Response {
  /// Initialize ProposalOpenContractResponse
  ProposalOpenContractResponse(
      {this.proposalOpenContract,
      this.subscription,
      Map<String, dynamic> echoReq,
      Map<String, dynamic> error,
      String msgType,
      int reqId})
      : super(echoReq: echoReq, error: error, msgType: msgType, reqId: reqId);

  /// Creates instance from JSON
  factory ProposalOpenContractResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalOpenContractResponseFromJson(json);

  // Properties
  /// Latest price and other details for an open contract
  Map<String, dynamic> proposalOpenContract;

  /// For subscription requests only.
  Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalOpenContractResponseToJson(this);
}
