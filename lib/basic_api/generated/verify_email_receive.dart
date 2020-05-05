/// generated automatically from flutter_deriv_api|lib/basic_api/generated/verify_email_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'verify_email_receive.g.dart';

/// JSON conversion for 'verify_email_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class VerifyEmailResponse extends Response {
  /// Initialize VerifyEmailResponse
  const VerifyEmailResponse({
    this.verifyEmail,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from json
  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailResponseFromJson(json);

  // Properties
  /// 1 for success (secure code has been sent to the email address)
  final int verifyEmail;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$VerifyEmailResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  VerifyEmailResponse copyWith({
    int verifyEmail,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      VerifyEmailResponse(
        verifyEmail: verifyEmail ?? this.verifyEmail,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
