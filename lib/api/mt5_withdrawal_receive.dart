/// Autogenerated from flutter_deriv_api|lib/api/mt5_withdrawal_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'mt5_withdrawal_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5WithdrawalResponse {
  Mt5WithdrawalResponse();
  factory Mt5WithdrawalResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5WithdrawalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$Mt5WithdrawalResponseToJson(this);

  // Properties
  int mt5Withdrawal;

  /// 1 on success
  int binaryTransactionId;

  /// Deposit reference ID of Binary account.
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
