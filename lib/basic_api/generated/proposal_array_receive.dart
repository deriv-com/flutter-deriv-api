/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_array_receive.json

import '../response.dart';

/// ProposalArrayResponse class
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
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        proposalArray: json['proposal_array'] as Map<String, dynamic>,
        // ignore: avoid_as
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
