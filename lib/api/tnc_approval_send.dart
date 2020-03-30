/// Autogenerated from flutter_deriv_api|lib/api/tnc_approval_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'tnc_approval_send.g.dart';

/// JSON conversion for 'tnc_approval_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TncApprovalRequest extends Request {
  /// Initialize TncApprovalRequest
  TncApprovalRequest(
      {this.tncApproval,
      this.ukgcFundsProtection,
      Map<String, dynamic> passthrough,
      int reqId})
      : super(passthrough: passthrough, reqId: reqId);

  /// Creates instance from JSON
  factory TncApprovalRequest.fromJson(Map<String, dynamic> json) =>
      _$TncApprovalRequestFromJson(json);

  // Properties
  /// Must be `1`
  num tncApproval;

  /// [Optional] For 'ASK_UK_FUNDS_PROTECTION' in cashier.
  int ukgcFundsProtection;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TncApprovalRequestToJson(this);
}
