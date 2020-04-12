/// generated automatically from flutter_deriv_api|lib/api/verify_email_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'verify_email_send.g.dart';

/// JSON conversion for 'verify_email_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class VerifyEmailRequest extends Request {
  /// Initialize VerifyEmailRequest
  VerifyEmailRequest({
    this.type,
    this.urlParameters,
    this.verifyEmail,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory VerifyEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailRequestFromJson(json);

  // Properties
  /// Purpose of the email verification call.
  final String type;

  /// [Optional] Extra parameters that can be attached to the verify email link URL.
  final Map<String, dynamic> urlParameters;

  /// Email address to be verified.
  final String verifyEmail;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$VerifyEmailRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  VerifyEmailRequest copyWith({
    String type,
    Map<String, dynamic> urlParameters,
    String verifyEmail,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      VerifyEmailRequest(
        type: type ?? this.type,
        urlParameters: urlParameters ?? this.urlParameters,
        verifyEmail: verifyEmail ?? this.verifyEmail,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
