/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/confirm_email_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Confirm email request class.
class ConfirmEmailRequest extends Request {
  /// Initialize ConfirmEmailRequest.
  const ConfirmEmailRequest({
    this.confirmEmail = true,
    required this.emailConsent,
    required this.verificationCode,
    super.msgType = 'confirm_email',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ConfirmEmailRequest.fromJson(Map<String, dynamic> json) =>
      ConfirmEmailRequest(
        confirmEmail:
            json['confirm_email'] == null ? null : json['confirm_email'] == 1,
        emailConsent:
            json['email_consent'] == null ? null : json['email_consent'] == 1,
        verificationCode: json['verification_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? confirmEmail;

  /// Boolean value: `true` or `false`, indicating whether the client has given consent for marketing emails.
  final bool? emailConsent;

  /// Email verification code (received from a `verify_email` call, which must be done first).
  final String? verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'confirm_email': confirmEmail == null
            ? null
            : confirmEmail!
                ? 1
                : 0,
        'email_consent': emailConsent == null
            ? null
            : emailConsent!
                ? 1
                : 0,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ConfirmEmailRequest copyWith({
    bool? confirmEmail,
    bool? emailConsent,
    String? verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ConfirmEmailRequest(
        confirmEmail: confirmEmail ?? this.confirmEmail,
        emailConsent: emailConsent ?? this.emailConsent,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
