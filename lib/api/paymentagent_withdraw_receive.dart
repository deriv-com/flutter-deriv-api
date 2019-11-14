/// Autogenerated from flutter_deriv_api|lib/api/paymentagent_withdraw_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'paymentagent_withdraw_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PaymentagentWithdrawResponse {
  PaymentagentWithdrawResponse();
  factory PaymentagentWithdrawResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentagentWithdrawResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentagentWithdrawResponseToJson(this);

  // Properties
  int paymentagentWithdraw;

  /// If set to 1, withdrawal success. If set to 2, dry-run success.
  String paymentagentName;

  /// Payment agent name.
  int transactionId;

  /// Reference ID of withdrawal performed.
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
