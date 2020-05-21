/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/verify_email_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'verify_email_send.g.dart';

/// JSON conversion for 'verify_email_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class VerifyEmailRequest extends Request {
  /// Initialize VerifyEmailRequest
  const VerifyEmailRequest({
    this.type,
    this.urlParameters,
    this.verifyEmail,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'verify_email',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory VerifyEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailRequestFromJson(json);

  /// Purpose of the email verification call.
  final String type;

  /// [Optional] Extra parameters that can be attached to the verify email link URL.
  final Map<String, dynamic> urlParameters;

  /// Email address to be verified.
  final String verifyEmail;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$VerifyEmailRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  VerifyEmailRequest copyWith({
    String type,
    Map<String, dynamic> urlParameters,
    String verifyEmail,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      VerifyEmailRequest(
        type: type ?? this.type,
        urlParameters: urlParameters ?? this.urlParameters,
        verifyEmail: verifyEmail ?? this.verifyEmail,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
