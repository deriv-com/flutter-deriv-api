/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/verify_email_cellxpert_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Verify email cellxpert request class.
class VerifyEmailCellxpertRequest extends Request {
  /// Initialize VerifyEmailCellxpertRequest.
  const VerifyEmailCellxpertRequest({
    this.loginid,
    required this.type,
    this.urlParameters,
    required this.verifyEmailCellxpert,
    super.msgType = 'verify_email_cellxpert',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory VerifyEmailCellxpertRequest.fromJson(Map<String, dynamic> json) =>
      VerifyEmailCellxpertRequest(
        loginid: json['loginid'] as String?,
        type: json['type'] as String?,
        urlParameters: json['url_parameters'] as Map<String, dynamic>?,
        verifyEmailCellxpert: json['verify_email_cellxpert'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Purpose of the email verification call.
  final String? type;

  /// [Optional] Extra parameters that can be attached to the verify email link URL.
  final Map<String, dynamic>? urlParameters;

  /// Email address to be verified.
  final String? verifyEmailCellxpert;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'type': type,
        'url_parameters': urlParameters,
        'verify_email_cellxpert': verifyEmailCellxpert,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  VerifyEmailCellxpertRequest copyWith({
    String? loginid,
    String? type,
    Map<String, dynamic>? urlParameters,
    String? verifyEmailCellxpert,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      VerifyEmailCellxpertRequest(
        loginid: loginid ?? this.loginid,
        type: type ?? this.type,
        urlParameters: urlParameters ?? this.urlParameters,
        verifyEmailCellxpert: verifyEmailCellxpert ?? this.verifyEmailCellxpert,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
