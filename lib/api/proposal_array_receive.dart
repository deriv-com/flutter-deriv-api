/// generated automatically from flutter_deriv_api|lib/api/proposal_array_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'proposal_array_receive.g.dart';

/// JSON conversion for 'proposal_array_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ProposalArrayResponse extends Response {
  /// Initialize ProposalArrayResponse
  const ProposalArrayResponse({
    this.proposalArray,
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
  factory ProposalArrayResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalArrayResponseFromJson(json);

  // Properties
  /// Latest price and other details for a given contract
  final Map<String, dynamic> proposalArray;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalArrayResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ProposalArrayResponse copyWith({
    Map<String, dynamic> proposalArray,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ProposalArrayResponse(
        proposalArray: proposalArray ?? this.proposalArray,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
