/// generated automatically from flutter_deriv_api|lib/api/transaction_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'transaction_receive.g.dart';

/// JSON conversion for 'transaction_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TransactionResponse extends Response {
  /// Initialize TransactionResponse
  const TransactionResponse({
    this.subscription,
    this.transaction,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  // Properties
  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Realtime stream of user transaction updates.
  final Map<String, dynamic> transaction;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TransactionResponse copyWith({
    Map<String, dynamic> subscription,
    Map<String, dynamic> transaction,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      TransactionResponse(
        subscription: subscription ?? this.subscription,
        transaction: transaction ?? this.transaction,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
