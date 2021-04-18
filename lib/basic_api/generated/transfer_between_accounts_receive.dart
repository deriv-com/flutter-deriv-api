/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/transfer_between_accounts_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Transfer between accounts response class
class TransferBetweenAccountsResponse extends Response {
  /// Initialize TransferBetweenAccountsResponse
  const TransferBetweenAccountsResponse({
    this.accounts,
    this.clientToFullName,
    this.clientToLoginid,
    this.transactionId,
    this.transferBetweenAccounts,
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

  /// Creates an instance from JSON
  factory TransferBetweenAccountsResponse.fromJson(Map<String, dynamic> json) =>
      TransferBetweenAccountsResponse(
        accounts: (json['accounts'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        clientToFullName: json['client_to_full_name'] as String?,
        clientToLoginid: json['client_to_loginid'] as String?,
        transactionId: json['transaction_id'] as int?,
        transferBetweenAccounts: json['transfer_between_accounts'] == null
            ? null
            : json['transfer_between_accounts'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The available accounts to transfer, or the accounts affected by a successful transfer.
  final List<Map<String, dynamic>>? accounts;

  /// The account to client full name
  final String? clientToFullName;

  /// The account to client loginid
  final String? clientToLoginid;

  /// Reference ID of transfer performed
  final int? transactionId;

  /// If set to `true`, transfer succeeded.
  final bool? transferBetweenAccounts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'accounts': accounts,
        'client_to_full_name': clientToFullName,
        'client_to_loginid': clientToLoginid,
        'transaction_id': transactionId,
        'transfer_between_accounts': transferBetweenAccounts == null
            ? null
            : transferBetweenAccounts!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TransferBetweenAccountsResponse copyWith({
    List<Map<String, dynamic>>? accounts,
    String? clientToFullName,
    String? clientToLoginid,
    int? transactionId,
    bool? transferBetweenAccounts,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TransferBetweenAccountsResponse(
        accounts: accounts ?? this.accounts,
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginid: clientToLoginid ?? this.clientToLoginid,
        transactionId: transactionId ?? this.transactionId,
        transferBetweenAccounts:
            transferBetweenAccounts ?? this.transferBetweenAccounts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
