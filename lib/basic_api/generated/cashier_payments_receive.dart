/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cashier_payments_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Cashier payments response class.
class CashierPaymentsResponse extends Response {
  /// Initialize CashierPaymentsResponse.
  const CashierPaymentsResponse({
    this.cashierPayments,
    this.subscription,
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
  factory CashierPaymentsResponse.fromJson(Map<String, dynamic> json) =>
      CashierPaymentsResponse(
        cashierPayments: json['cashier_payments'] as Map<String, dynamic>?,
        subscription: json['subscription'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of cashier transactions.
  final Map<String, dynamic>? cashierPayments;

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cashier_payments': cashierPayments,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CashierPaymentsResponse copyWith({
    Map<String, dynamic>? cashierPayments,
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CashierPaymentsResponse(
        cashierPayments: cashierPayments ?? this.cashierPayments,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
