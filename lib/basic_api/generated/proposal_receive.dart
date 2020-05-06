/// generated automatically from flutter_deriv_api|lib/basic_api/generated/proposal_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'proposal_receive.g.dart';

/// JSON conversion for 'proposal_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
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
      _$ProposalResponseFromJson(json);

  // Properties
  /// Latest price and other details for a given contract
  final Map<String, dynamic> proposal;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ProposalResponseToJson(this);

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
