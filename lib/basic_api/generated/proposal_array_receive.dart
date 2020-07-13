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
        proposalArray: json['proposal_array'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Latest price and other details for a given contract
  final Map<String, dynamic> proposalArray;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'proposal_array': proposalArray,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
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
