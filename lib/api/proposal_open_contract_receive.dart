/// generated automatically from flutter_deriv_api|lib/api/proposal_open_contract_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'proposal_open_contract_receive.g.dart';

/// JSON conversion for 'proposal_open_contract_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ProposalOpenContractResponse extends Response {
  /// Initialize ProposalOpenContractResponse
  ProposalOpenContractResponse({
    this.proposalOpenContract,
    this.subscription,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory ProposalOpenContractResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalOpenContractResponseFromJson(json);

  // Properties
  /// Latest price and other details for an open contract
  final Map<String, dynamic> proposalOpenContract;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalOpenContractResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ProposalOpenContractResponse copyWith({
    Map<String, dynamic> proposalOpenContract,
    Map<String, dynamic> subscription,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ProposalOpenContractResponse(
        proposalOpenContract: proposalOpenContract ?? this.proposalOpenContract,
        subscription: subscription ?? this.subscription,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
