/// generated automatically from flutter_deriv_api|lib/api/tnc_approval_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'tnc_approval_send.g.dart';

/// JSON conversion for 'tnc_approval_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TncApprovalRequest extends Request {
  /// Initialize TncApprovalRequest
  TncApprovalRequest({
    this.tncApproval,
    this.ukgcFundsProtection,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory TncApprovalRequest.fromJson(Map<String, dynamic> json) =>
      _$TncApprovalRequestFromJson(json);

  // Properties
  /// Must be `1`
  final num tncApproval;

  /// [Optional] For `ASK_UK_FUNDS_PROTECTION` in `cashier`.
  final int ukgcFundsProtection;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TncApprovalRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TncApprovalRequest copyWith({
    num tncApproval,
    int ukgcFundsProtection,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      TncApprovalRequest(
        tncApproval: tncApproval ?? this.tncApproval,
        ukgcFundsProtection: ukgcFundsProtection ?? this.ukgcFundsProtection,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
