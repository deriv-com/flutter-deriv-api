/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cashier_receive.json

import '../response.dart';

/// CashierResponse class
class CashierResponse extends Response {
  /// Initialize CashierResponse
  const CashierResponse({
    this.cashier,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory CashierResponse.fromJson(Map<String, dynamic> json) =>
      CashierResponse(
        // ignore: avoid_as
        cashier: json['cashier'] as dynamic,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Possible error codes are:
  /// - `ASK_TNC_APPROVAL`: API call `tnc_approval`
  /// - `ASK_AUTHENTICATE`
  /// - `ASK_UK_FUNDS_PROTECTION`: API call `tnc_approval`
  /// - `ASK_CURRENCY`: API call `set_account_currency`
  /// - `ASK_EMAIL_VERIFY`: API call `verify_email`
  /// - `ASK_FIX_DETAILS`: API call `set_settings`
  final dynamic cashier;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cashier': cashier,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CashierResponse copyWith({
    dynamic cashier,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      CashierResponse(
        cashier: cashier ?? this.cashier,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
