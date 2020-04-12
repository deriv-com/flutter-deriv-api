/// generated automatically from flutter_deriv_api|lib/api/transfer_between_accounts_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'transfer_between_accounts_receive.g.dart';

/// JSON conversion for 'transfer_between_accounts_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TransferBetweenAccountsResponse extends Response {
  /// Initialize TransferBetweenAccountsResponse
  TransferBetweenAccountsResponse({
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

  /// Creates instance from JSON
  factory TransferBetweenAccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferBetweenAccountsResponseFromJson(json);

  // Properties
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

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() =>
      _$TransferBetweenAccountsResponseToJson(this);
}
