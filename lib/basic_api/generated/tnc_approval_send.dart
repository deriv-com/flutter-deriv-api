/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/tnc_approval_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Tnc approval request class.
class TncApprovalRequest extends Request {
  /// Initialize TncApprovalRequest.
  const TncApprovalRequest({
    this.affiliateCocAgreement,
    this.loginid,
    this.tncApproval = true,
    this.ukgcFundsProtection,
    super.msgType = 'tnc_approval',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TncApprovalRequest.fromJson(Map<String, dynamic> json) =>
      TncApprovalRequest(
        affiliateCocAgreement: json['affiliate_coc_agreement'] as int?,
        loginid: json['loginid'] as String?,
        tncApproval:
            json['tnc_approval'] == null ? null : json['tnc_approval'] == 1,
        ukgcFundsProtection: json['ukgc_funds_protection'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] For Affiliate's Code of Conduct Agreement.
  final int? affiliateCocAgreement;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? tncApproval;

  /// [Optional] For `ASK_UK_FUNDS_PROTECTION` in `cashier`.
  final int? ukgcFundsProtection;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'affiliate_coc_agreement': affiliateCocAgreement,
        'loginid': loginid,
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
  TncApprovalRequest copyWith({
    int? affiliateCocAgreement,
    String? loginid,
    bool? tncApproval,
    int? ukgcFundsProtection,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TncApprovalRequest(
        affiliateCocAgreement:
            affiliateCocAgreement ?? this.affiliateCocAgreement,
        loginid: loginid ?? this.loginid,
        tncApproval: tncApproval ?? this.tncApproval,
        ukgcFundsProtection: ukgcFundsProtection ?? this.ukgcFundsProtection,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
