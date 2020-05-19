/// generated automatically from flutter_deriv_api|lib/basic_api/generated/tnc_approval_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'tnc_approval_send.g.dart';

/// JSON conversion for 'tnc_approval_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class TncApprovalRequest extends Request {
  /// Initialize TncApprovalRequest
  const TncApprovalRequest({
    this.tncApproval,
    this.ukgcFundsProtection,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'tnc_approval',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TncApprovalRequest.fromJson(Map<String, dynamic> json) =>
      _$TncApprovalRequestFromJson(json);

  // Properties
  /// Must be `1`
  final num tncApproval;

  /// [Optional] For `ASK_UK_FUNDS_PROTECTION` in `cashier`.
  final int ukgcFundsProtection;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$TncApprovalRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  TncApprovalRequest copyWith({
    num tncApproval,
    int ukgcFundsProtection,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TncApprovalRequest(
        tncApproval: tncApproval ?? this.tncApproval,
        ukgcFundsProtection: ukgcFundsProtection ?? this.ukgcFundsProtection,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
