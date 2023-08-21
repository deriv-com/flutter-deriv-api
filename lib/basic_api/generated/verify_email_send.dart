/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/verify_email_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Verify email request class.
class VerifyEmailRequest extends Request {
  /// Initialize VerifyEmailRequest.
  const VerifyEmailRequest({
    required this.type,
    this.urlParameters,
    required this.verifyEmail,
    super.msgType = 'verify_email',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory VerifyEmailRequest.fromJson(Map<String, dynamic> json) =>
      VerifyEmailRequest(
        type: json['type'] as String?,
        urlParameters: json['url_parameters'] as Map<String, dynamic>?,
        verifyEmail: json['verify_email'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Purpose of email verification, request_email and reset_password are the only two types restricted from all unoffical apps
  final String? type;

  /// [Optional] Extra parameters that can be attached to the verify email link URL.
  final Map<String, dynamic>? urlParameters;

  /// Email address to be verified.
  final String? verifyEmail;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'url_parameters': urlParameters,
        'verify_email': verifyEmail,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  VerifyEmailRequest copyWith({
    String? type,
    Map<String, dynamic>? urlParameters,
    String? verifyEmail,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      VerifyEmailRequest(
        type: type ?? this.type,
        urlParameters: urlParameters ?? this.urlParameters,
        verifyEmail: verifyEmail ?? this.verifyEmail,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
