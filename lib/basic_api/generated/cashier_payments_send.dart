/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cashier_payments_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Cashier payments request class.
class CashierPaymentsRequest extends Request {
  /// Initialize CashierPaymentsRequest.
  const CashierPaymentsRequest({
    this.cashierPayments = true,
    this.provider,
    this.subscribe,
    this.transactionType,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'cashier_payments',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory CashierPaymentsRequest.fromJson(Map<String, dynamic> json) =>
      CashierPaymentsRequest(
        cashierPayments: json['cashier_payments'] == null
            ? null
            : json['cashier_payments'] == 1,
        provider: json['provider'] as String?,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        transactionType: json['transaction_type'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? cashierPayments;

  /// [Optional] Cashier provider. `crypto` will be default option for crypto currency accounts.
  final String? provider;

  /// [Optional] If set to `true`, will send updates whenever there is update to crypto payments.
  final bool? subscribe;

  /// [Optional] Type of transactions to receive.
  final String? transactionType;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cashier_payments': cashierPayments == null
            ? null
            : cashierPayments!
                ? 1
                : 0,
        'provider': provider,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'transaction_type': transactionType,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CashierPaymentsRequest copyWith({
    bool? cashierPayments,
    String? provider,
    bool? subscribe,
    String? transactionType,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CashierPaymentsRequest(
        cashierPayments: cashierPayments ?? this.cashierPayments,
        provider: provider ?? this.provider,
        subscribe: subscribe ?? this.subscribe,
        transactionType: transactionType ?? this.transactionType,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
