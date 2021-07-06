/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/tnc_approval_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Tnc approval send class.
class TncApprovalSend extends Request {
  /// Initialize TncApprovalSend.
  const TncApprovalSend({
    this.tncApproval = true,
    this.ukgcFundsProtection,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'tnc_approval',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TncApprovalSend.fromJson(Map<String, dynamic> json) =>
      TncApprovalSend(
        tncApproval:
            json['tnc_approval'] == null ? null : json['tnc_approval'] == 1,
        ukgcFundsProtection: json['ukgc_funds_protection'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? tncApproval;

  /// [Optional] For `ASK_UK_FUNDS_PROTECTION` in `cashier`.
  final int? ukgcFundsProtection;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'tnc_approval': tncApproval == null
            ? null
            : tncApproval!
                ? 1
                : 0,
        'ukgc_funds_protection': ukgcFundsProtection,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TncApprovalSend copyWith({
    bool? tncApproval,
    int? ukgcFundsProtection,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TncApprovalSend(
        tncApproval: tncApproval ?? this.tncApproval,
        ukgcFundsProtection: ukgcFundsProtection ?? this.ukgcFundsProtection,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
