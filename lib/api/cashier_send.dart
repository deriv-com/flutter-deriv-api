/// Autogenerated from flutter_deriv_api|lib/api/cashier_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'cashier_send.g.dart';

/// JSON conversion for 'cashier_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class CashierRequest extends Request {
  /// Initialize CashierRequest
  CashierRequest(
      {this.cashier,
      this.provider,
      this.verificationCode,
      Map<String, dynamic> passthrough,
      int reqId})
      : super(passthrough: passthrough, reqId: reqId);

  /// Creates instance from JSON
  factory CashierRequest.fromJson(Map<String, dynamic> json) =>
      _$CashierRequestFromJson(json);

  // Properties
  /// The cashier type to request the URL for.
  String cashier;

  /// [Optional] Note: only 'doughflow' is supported currently.
  String provider;

  /// [Optional] Email verification code (received from a verify_email call, which must be done first)
  String verificationCode;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CashierRequestToJson(this);
}
