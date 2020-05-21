/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'forget_send.g.dart';

/// JSON conversion for 'forget_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class ForgetRequest extends Request {
  /// Initialize ForgetRequest
  const ForgetRequest({
    this.forget,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'forget',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ForgetRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetRequestFromJson(json);

  /// ID of the real-time stream of messages to cancel.
  final String forget;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ForgetRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ForgetRequest copyWith({
    String forget,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ForgetRequest(
        forget: forget ?? this.forget,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
