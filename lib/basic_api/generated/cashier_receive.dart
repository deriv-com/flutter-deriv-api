/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cashier_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Cashier receive class.
class CashierReceive extends Response {
  /// Initialize CashierReceive.
  const CashierReceive({
    this.cashier,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CashierReceive.fromJson(Map<String, dynamic> json) => CashierReceive(
        cashier: json['cashier'] as dynamic,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Possible error codes are:
  /// - `ASK_TNC_APPROVAL`: API call `tnc_approval`
  /// - `ASK_AUTHENTICATE`
  /// - `ASK_UK_FUNDS_PROTECTION`: API call `tnc_approval`
  /// - `ASK_CURRENCY`: API call `set_account_currency`
  /// - `ASK_EMAIL_VERIFY`: API call `verify_email`
  /// - `ASK_FIX_DETAILS`: API call `set_settings`
  final dynamic cashier;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cashier': cashier,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CashierReceive copyWith({
    dynamic cashier,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CashierReceive(
        cashier: cashier ?? this.cashier,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
