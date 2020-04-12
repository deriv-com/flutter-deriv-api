/// generated automatically from flutter_deriv_api|lib/api/forget_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'forget_send.g.dart';

/// JSON conversion for 'forget_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ForgetRequest extends Request {
  /// Initialize ForgetRequest
  const ForgetRequest({
    this.forget,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory ForgetRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetRequestFromJson(json);

  // Properties
  /// ID of the real-time stream of messages to cancel.
  final String forget;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ForgetRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ForgetRequest copyWith({
    String forget,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      ForgetRequest(
        forget: forget ?? this.forget,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
