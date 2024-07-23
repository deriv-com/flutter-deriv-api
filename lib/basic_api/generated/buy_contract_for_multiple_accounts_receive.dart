/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/buy_contract_for_multiple_accounts_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Buy contract for multiple accounts receive class.
class BuyContractForMultipleAccountsReceive extends Response {
  /// Initialize BuyContractForMultipleAccountsReceive.
  const BuyContractForMultipleAccountsReceive({
    this.buyContractForMultipleAccounts,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory BuyContractForMultipleAccountsReceive.fromJson(
          Map<String, dynamic> json) =>
      BuyContractForMultipleAccountsReceive(
        buyContractForMultipleAccounts:
            json['buy_contract_for_multiple_accounts'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Receipt confirmation for the purchase
  final Map<String, dynamic>? buyContractForMultipleAccounts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'buy_contract_for_multiple_accounts': buyContractForMultipleAccounts,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  BuyContractForMultipleAccountsReceive copyWith({
    Map<String, dynamic>? buyContractForMultipleAccounts,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      BuyContractForMultipleAccountsReceive(
        buyContractForMultipleAccounts: buyContractForMultipleAccounts ??
            this.buyContractForMultipleAccounts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
