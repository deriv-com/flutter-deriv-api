/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cashier_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Cashier request class.
class CashierRequest extends Request {
  /// Initialize CashierRequest.
  const CashierRequest({
    this.address,
    this.amount,
    required this.cashier,
    this.dryRun,
    this.estimatedFeeUniqueId,
    this.loginid,
    this.provider,
    this.type,
    this.verificationCode,
    super.msgType = 'cashier',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CashierRequest.fromJson(Map<String, dynamic> json) => CashierRequest(
        address: json['address'] as String?,
        amount: json['amount'] as num?,
        cashier: json['cashier'] as String?,
        dryRun: json['dry_run'] == null ? null : json['dry_run'] == 1,
        estimatedFeeUniqueId: json['estimated_fee_unique_id'] as String?,
        loginid: json['loginid'] as String?,
        provider: json['provider'] as String?,
        type: json['type'] as String?,
        verificationCode: json['verification_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Address for crypto withdrawal. Only applicable for `api` type.
  final String? address;

  /// [Optional] Amount for crypto withdrawal. Only applicable for `api` type.
  final num? amount;

  /// Operation which needs to be requested from cashier
  final String? cashier;

  /// [Optional] If set to `true`, only validation is performed. Only applicable for `withdraw` using `crypto` provider and `api` type.
  final bool? dryRun;

  /// [Optional] The `unique_id` of the estimated fee received from `crypto_estimations` call in case the client is willing to pay the returned fee in order to prioritise their withdrawal request.
  final String? estimatedFeeUniqueId;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] Cashier provider. `crypto` will be default option for crypto currency accounts.
  final String? provider;

  /// [Optional] Data is returned from the cashier. The `crypto` provider only supports `api` (not `url`) for crypto accounts.
  final String? type;

  /// [Optional] Email verification code (received from a `verify_email` call, which must be done first)
  final String? verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'amount': amount,
        'cashier': cashier,
        'dry_run': dryRun == null
            ? null
            : dryRun!
                ? 1
                : 0,
        'estimated_fee_unique_id': estimatedFeeUniqueId,
        'loginid': loginid,
        'provider': provider,
        'type': type,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CashierRequest copyWith({
    String? address,
    num? amount,
    String? cashier,
    bool? dryRun,
    String? estimatedFeeUniqueId,
    String? loginid,
    String? provider,
    String? type,
    String? verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CashierRequest(
        address: address ?? this.address,
        amount: amount ?? this.amount,
        cashier: cashier ?? this.cashier,
        dryRun: dryRun ?? this.dryRun,
        estimatedFeeUniqueId: estimatedFeeUniqueId ?? this.estimatedFeeUniqueId,
        loginid: loginid ?? this.loginid,
        provider: provider ?? this.provider,
        type: type ?? this.type,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
