/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Proposal response class
class ProposalResponse extends Response {
  /// Initialize ProposalResponse
  const ProposalResponse({
    this.proposal,
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
  factory ProposalResponse.fromJson(Map<String, dynamic> json) =>
      ProposalResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        proposal: json['proposal'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
        subscription: json['subscription'] as Map<String, dynamic>,
      );

  /// Latest price and other details for a given contract
  final Map<String, dynamic> proposal;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'proposal': proposal,
        'req_id': reqId,
        'subscription': subscription,
      };

  /// Creates a copy of instance with given parameters
  @override
  ProposalResponse copyWith({
    Map<String, dynamic> proposal,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ProposalResponse(
        proposal: proposal ?? this.proposal,
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
