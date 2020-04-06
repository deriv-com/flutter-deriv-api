/// Autogenerated from flutter_deriv_api|lib/api/forget_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'forget_send.g.dart';

/// JSON conversion for 'forget_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ForgetRequest extends Request {
  /// Initialize ForgetRequest
  ForgetRequest({
    this.forget,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'forget',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory ForgetRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetRequestFromJson(json);

  // Properties
  /// ID of the real-time stream of messages to cancel.
  String forget;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ForgetRequestToJson(this);
}
