/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_array_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Proposal array response class
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
      ProposalArrayResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        proposalArray: json['proposal_array'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Latest price and other details for a given contract
  final Map<String, dynamic> proposalArray;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'proposal_array': proposalArray,
        'req_id': reqId,
      };

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
