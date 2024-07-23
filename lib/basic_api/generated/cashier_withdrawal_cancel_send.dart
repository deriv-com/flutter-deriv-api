/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cashier_withdrawal_cancel_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Cashier withdrawal cancel request class.
class CashierWithdrawalCancelRequest extends Request {
  /// Initialize CashierWithdrawalCancelRequest.
  const CashierWithdrawalCancelRequest({
    this.cashierWithdrawalCancel = true,
    required this.id,
    this.loginid,
    super.msgType = 'cashier_withdrawal_cancel',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CashierWithdrawalCancelRequest.fromJson(Map<String, dynamic> json) =>
      CashierWithdrawalCancelRequest(
        cashierWithdrawalCancel: json['cashier_withdrawal_cancel'] == null
            ? null
            : json['cashier_withdrawal_cancel'] == 1,
        id: json['id'] as String?,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? cashierWithdrawalCancel;

  /// The unique identifier for the transaction.
  final String? id;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cashier_withdrawal_cancel': cashierWithdrawalCancel == null
            ? null
            : cashierWithdrawalCancel!
                ? 1
                : 0,
        'id': id,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CashierWithdrawalCancelRequest copyWith({
    bool? cashierWithdrawalCancel,
    String? id,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CashierWithdrawalCancelRequest(
        cashierWithdrawalCancel:
            cashierWithdrawalCancel ?? this.cashierWithdrawalCancel,
        id: id ?? this.id,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
