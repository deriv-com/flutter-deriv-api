/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Proposal receive class.
class ProposalReceive extends Response {
  /// Initialize ProposalReceive.
  const ProposalReceive({
    this.proposal,
    this.subscription,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ProposalReceive.fromJson(Map<String, dynamic> json) =>
      ProposalReceive(
        proposal: json['proposal'] as Map<String, dynamic>?,
        subscription: json['subscription'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Latest price and other details for a given contract
  final Map<String, dynamic>? proposal;

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'proposal': proposal,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ProposalReceive copyWith({
    Map<String, dynamic>? proposal,
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ProposalReceive(
        proposal: proposal ?? this.proposal,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
