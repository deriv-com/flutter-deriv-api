/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/transaction_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'transaction_receive.g.dart';

/// JSON conversion for 'transaction_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class TransactionResponse extends Response {
  /// Initialize TransactionResponse
  const TransactionResponse({
    this.subscription,
    this.transaction,
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
  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Realtime stream of user transaction updates.
  final Map<String, dynamic> transaction;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  TransactionResponse copyWith({
    Map<String, dynamic> subscription,
    Map<String, dynamic> transaction,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TransactionResponse(
        subscription: subscription ?? this.subscription,
        transaction: transaction ?? this.transaction,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
