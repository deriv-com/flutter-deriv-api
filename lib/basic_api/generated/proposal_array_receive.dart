/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_array_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'proposal_array_receive.g.dart';

/// JSON conversion for 'proposal_array_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ProposalArrayResponse extends Response {
  /// Initialize ProposalArrayResponse
  const ProposalArrayResponse({
    this.proposalArray,
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
  factory ProposalArrayResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalArrayResponseFromJson(json);

  /// Latest price and other details for a given contract
  final Map<String, dynamic> proposalArray;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalArrayResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ProposalArrayResponse copyWith({
    Map<String, dynamic> proposalArray,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ProposalArrayResponse(
        proposalArray: proposalArray ?? this.proposalArray,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
