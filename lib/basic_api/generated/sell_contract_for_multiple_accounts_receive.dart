/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_contract_for_multiple_accounts_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Sell contract for multiple accounts response class
class SellContractForMultipleAccountsResponse extends Response {
  /// Initialize SellContractForMultipleAccountsResponse
  const SellContractForMultipleAccountsResponse({
    this.sellContractForMultipleAccounts,
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
  factory SellContractForMultipleAccountsResponse.fromJson(
          Map<String, dynamic> json) =>
      SellContractForMultipleAccountsResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
        sellContractForMultipleAccounts:
            json['sell_contract_for_multiple_accounts'] as Map<String, dynamic>,
      );

  /// Status information for each affected account.
  final Map<String, dynamic> sellContractForMultipleAccounts;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'sell_contract_for_multiple_accounts': sellContractForMultipleAccounts,
      };

  /// Creates a copy of instance with given parameters
  @override
  SellContractForMultipleAccountsResponse copyWith({
    Map<String, dynamic> sellContractForMultipleAccounts,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      SellContractForMultipleAccountsResponse(
        sellContractForMultipleAccounts: sellContractForMultipleAccounts ??
            this.sellContractForMultipleAccounts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
