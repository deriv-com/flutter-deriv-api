/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_confirm_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p order confirm request class.
class P2pOrderConfirmRequest extends Request {
  /// Initialize P2pOrderConfirmRequest.
  const P2pOrderConfirmRequest({
    this.dryRun,
    required this.id,
    this.loginid,
    this.p2pOrderConfirm = true,
    this.verificationCode,
    super.msgType = 'p2p_order_confirm',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pOrderConfirmRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderConfirmRequest(
        dryRun: json['dry_run'] == null ? null : json['dry_run'] == 1,
        id: json['id'] as String?,
        loginid: json['loginid'] as String?,
        p2pOrderConfirm: json['p2p_order_confirm'] == null
            ? null
            : json['p2p_order_confirm'] == 1,
        verificationCode: json['verification_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] If set to `true`, only validation is performed.
  final bool? dryRun;

  /// The unique identifier for this order.
  final String? id;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? p2pOrderConfirm;

  /// [Optional] Verification code received from email.
  final String? verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'dry_run': dryRun == null
            ? null
            : dryRun!
                ? 1
                : 0,
        'id': id,
        'loginid': loginid,
        'p2p_order_confirm': p2pOrderConfirm == null
            ? null
            : p2pOrderConfirm!
                ? 1
                : 0,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderConfirmRequest copyWith({
    bool? dryRun,
    String? id,
    String? loginid,
    bool? p2pOrderConfirm,
    String? verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pOrderConfirmRequest(
        dryRun: dryRun ?? this.dryRun,
        id: id ?? this.id,
        loginid: loginid ?? this.loginid,
        p2pOrderConfirm: p2pOrderConfirm ?? this.p2pOrderConfirm,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
