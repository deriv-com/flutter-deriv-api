/// generated automatically from flutter_deriv_api|lib/api/verify_email_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'verify_email_receive.g.dart';

/// JSON conversion for 'verify_email_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class VerifyEmailResponse extends Response {
  /// Initialize VerifyEmailResponse
  const VerifyEmailResponse({
    this.verifyEmail,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailResponseFromJson(json);

  // Properties
  /// 1 for success (secure code has been sent to the email address)
  final int verifyEmail;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$VerifyEmailResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  VerifyEmailResponse copyWith({
    int verifyEmail,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      VerifyEmailResponse(
        verifyEmail: verifyEmail ?? this.verifyEmail,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
