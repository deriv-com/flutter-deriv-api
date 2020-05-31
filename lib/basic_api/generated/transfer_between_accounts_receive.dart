/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/transfer_between_accounts_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'transfer_between_accounts_receive.g.dart';

/// JSON conversion for 'transfer_between_accounts_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class TransferBetweenAccountsResponse extends Response {
  /// Initialize TransferBetweenAccountsResponse
  const TransferBetweenAccountsResponse({
    this.accounts,
    this.clientToFullName,
    this.clientToLoginid,
    this.transactionId,
    this.transferBetweenAccounts,
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
  factory TransferBetweenAccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferBetweenAccountsResponseFromJson(json);

  /// The available accounts to transfer, or the accounts affected by a successful transfer.
  final List<Map<String, dynamic>> accounts;

  /// The account to client full name
  final String clientToFullName;

  /// The account to client loginid
  final String clientToLoginid;

  /// Reference ID of transfer performed
  final int transactionId;

  /// If set to 1, transfer succeeded.
  final int transferBetweenAccounts;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() =>
      _$TransferBetweenAccountsResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  TransferBetweenAccountsResponse copyWith({
    List<Map<String, dynamic>> accounts,
    String clientToFullName,
    String clientToLoginid,
    int transactionId,
    int transferBetweenAccounts,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
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
  List<Object> get props => null;
}
