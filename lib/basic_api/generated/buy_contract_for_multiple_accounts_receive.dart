/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/buy_contract_for_multiple_accounts_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// BuyContractForMultipleAccountsResponse class
class BuyContractForMultipleAccountsResponse extends Response {
  /// Initialize BuyContractForMultipleAccountsResponse
  const BuyContractForMultipleAccountsResponse({
    this.buyContractForMultipleAccounts,
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
  factory BuyContractForMultipleAccountsResponse.fromJson(
          Map<String, dynamic> json) =>
      BuyContractForMultipleAccountsResponse(
        buyContractForMultipleAccounts:
            json['buy_contract_for_multiple_accounts'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Receipt confirmation for the purchase
  final Map<String, dynamic> buyContractForMultipleAccounts;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'buy_contract_for_multiple_accounts': buyContractForMultipleAccounts,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  BuyContractForMultipleAccountsResponse copyWith({
    Map<String, dynamic> buyContractForMultipleAccounts,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      BuyContractForMultipleAccountsResponse(
        buyContractForMultipleAccounts: buyContractForMultipleAccounts ??
            this.buyContractForMultipleAccounts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
