/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/verify_email_cellxpert_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Verify email cellxpert request class.
class VerifyEmailCellxpertRequest extends Request {
  /// Initialize VerifyEmailCellxpertRequest.
  const VerifyEmailCellxpertRequest({
    required this.type,
    this.urlParameters,
    required this.verifyEmailCellxpert,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'verify_email_cellxpert',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory VerifyEmailCellxpertRequest.fromJson(Map<String, dynamic> json) =>
      VerifyEmailCellxpertRequest(
        type: json['type'] as String?,
        urlParameters: json['url_parameters'] as Map<String, dynamic>?,
        verifyEmailCellxpert: json['verify_email_cellxpert'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Purpose of the email verification call.
  final String? type;

  /// [Optional] Extra parameters that can be attached to the verify email link URL.
  final Map<String, dynamic>? urlParameters;

  /// Email address to be verified.
  final String? verifyEmailCellxpert;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'url_parameters': urlParameters,
        'verify_email_cellxpert': verifyEmailCellxpert,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  VerifyEmailCellxpertRequest copyWith({
    String? type,
    Map<String, dynamic>? urlParameters,
    String? verifyEmailCellxpert,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      VerifyEmailCellxpertRequest(
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
