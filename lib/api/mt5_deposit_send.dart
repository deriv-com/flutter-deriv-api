/// Autogenerated from flutter_deriv_api|lib/api/mt5_deposit_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'mt5_deposit_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5DepositRequest {
  Mt5DepositRequest();
  factory Mt5DepositRequest.fromJson(Map<String, dynamic> json) =>
      _$Mt5DepositRequestFromJson(json);
  Map<String, dynamic> toJson() => _$Mt5DepositRequestToJson(this);

  // Properties
  int mt5Deposit;

  /// Must be 1
  num amount;

  /// Amount to deposit (in the currency of from_binary); min = $1 or an equivalent amount, max = $20000 or an equivalent amount
  String fromBinary;

  /// Binary account loginid to transfer money from
  String toMt5;

  /// MT5 account login to deposit money to
  Map<String, dynamic> passthrough;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  int reqId;

  /// [Optional] Used to map request to response.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
