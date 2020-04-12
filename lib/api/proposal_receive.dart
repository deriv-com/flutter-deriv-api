/// generated automatically from flutter_deriv_api|lib/api/proposal_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'proposal_receive.g.dart';

/// JSON conversion for 'proposal_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ProposalResponse extends Response {
  /// Initialize ProposalResponse
  ProposalResponse({
    this.proposal,
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
  factory ProposalResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalResponseFromJson(json);

  // Properties
  /// Latest price and other details for a given contract
  final Map<String, dynamic> proposal;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ProposalResponse copyWith({
    Map<String, dynamic> proposal,
    Map<String, dynamic> subscription,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ProposalResponse(
        proposal: proposal ?? this.proposal,
        subscription: subscription ?? this.subscription,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
