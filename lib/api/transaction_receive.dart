/// Autogenerated from flutter_deriv_api|lib/api/transaction_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TransactionResponse {
  TransactionResponse();
  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);

  // Properties
  Map<String, dynamic> transaction;

  /// Realtime stream of user transaction updates.
  Map<String, dynamic> subscription;

  /// For subscription requests only
  Map<String, dynamic> echoReq;

  /// Echo of the request made.
  String msgType;

  /// Action name of the request made.
  int reqId;

  /// Optional field sent in request to map to response, present only when request contains req_id.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
