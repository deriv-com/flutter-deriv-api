/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_contract_for_multiple_accounts_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Sell contract for multiple accounts receive class.
class SellContractForMultipleAccountsReceive extends Response {
  /// Initialize SellContractForMultipleAccountsReceive.
  const SellContractForMultipleAccountsReceive({
    this.sellContractForMultipleAccounts,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory SellContractForMultipleAccountsReceive.fromJson(
          Map<String, dynamic> json) =>
      SellContractForMultipleAccountsReceive(
        sellContractForMultipleAccounts:
            json['sell_contract_for_multiple_accounts']
                as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Status information for each affected account.
  final Map<String, dynamic>? sellContractForMultipleAccounts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'sell_contract_for_multiple_accounts': sellContractForMultipleAccounts,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SellContractForMultipleAccountsReceive copyWith({
    Map<String, dynamic>? sellContractForMultipleAccounts,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      SellContractForMultipleAccountsReceive(
        sellContractForMultipleAccounts: sellContractForMultipleAccounts ??
            this.sellContractForMultipleAccounts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
