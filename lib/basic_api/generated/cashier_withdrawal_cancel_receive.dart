/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cashier_withdrawal_cancel_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Cashier withdrawal cancel receive class.
class CashierWithdrawalCancelReceive extends Response {
  /// Initialize CashierWithdrawalCancelReceive.
  const CashierWithdrawalCancelReceive({
    this.cashierWithdrawalCancel,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory CashierWithdrawalCancelReceive.fromJson(Map<String, dynamic> json) =>
      CashierWithdrawalCancelReceive(
        cashierWithdrawalCancel:
            json['cashier_withdrawal_cancel'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Cancellation details
  final Map<String, dynamic>? cashierWithdrawalCancel;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cashier_withdrawal_cancel': cashierWithdrawalCancel,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CashierWithdrawalCancelReceive copyWith({
    Map<String, dynamic>? cashierWithdrawalCancel,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CashierWithdrawalCancelReceive(
        cashierWithdrawalCancel:
            cashierWithdrawalCancel ?? this.cashierWithdrawalCancel,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
