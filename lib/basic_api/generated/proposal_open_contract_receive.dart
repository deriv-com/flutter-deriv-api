/// generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_open_contract_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'proposal_open_contract_receive.g.dart';

/// JSON conversion for 'proposal_open_contract_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
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
      _$ProposalOpenContractResponseFromJson(json);

  // Properties
  /// Latest price and other details for an open contract
  final Map<String, dynamic> proposalOpenContract;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalOpenContractResponseToJson(this);

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
