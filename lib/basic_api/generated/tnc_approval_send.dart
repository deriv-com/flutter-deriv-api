/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/tnc_approval_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// TncApprovalRequest class
class TncApprovalRequest extends Request {
  /// Initialize TncApprovalRequest
  const TncApprovalRequest({
    @required this.tncApproval,
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
      TncApprovalRequest(
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        tncApproval: json['tnc_approval'] as num,
        // ignore: avoid_as
        ukgcFundsProtection: json['ukgc_funds_protection'] as int,
      );

  /// Must be `1`
  final num tncApproval;

  /// [Optional] For `ASK_UK_FUNDS_PROTECTION` in `cashier`.
  final int ukgcFundsProtection;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'req_id': reqId,
        'tnc_approval': tncApproval,
        'ukgc_funds_protection': ukgcFundsProtection,
      };

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
